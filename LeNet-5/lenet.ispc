inline varying double relu_ispc(varying double x) {
    return x > 0 ? x : 0;
}

#define IDX3(c,h,w,H,W) ((c)*(H)*(W) + (h)*(W) + (w))
#define IDX4(o,c,kh,kw,C,KH,KW) ((o)*(C)*(KH)*(KW) + (c)*(KH)*(KW) + (kh)*(KW) + (kw))
#define IDX_OUT(o,h,w,H,W) ((o)*(H)*(W) + (h)*(W) + (w))

// ========================================
// 前向传播：卷积
// ========================================
export void conv_forward_ispc(
    uniform int outC, uniform int inC,
    uniform int inH, uniform int inW,
    uniform int kH, uniform int kW,
    uniform int outH, uniform int outW,
    uniform double input[], uniform double output[],
    uniform double weight[], uniform double bias[]
)
{
    foreach (o = 0 ... outC, h = 0 ... outH, w = 0 ... outW) {
        varying double sum = bias[o];
        for (uniform int c = 0; c < inC; c++) {
            varying int input_base = c * inH * inW;  // varying
            varying int weight_base = o * inC * kH * kW + c * kH * kW;  // varying
            for (uniform int kh = 0; kh < kH; kh++) {
                for (uniform int kw = 0; kw < kW; kw++) {
                    varying int ih = h + kh;  // varying
                    varying int iw = w + kw;  // varying
                    if (ih < inH && iw < inW) {
                        sum += input[input_base + ih * inW + iw] *
                               weight[weight_base + kh * kW + kw];
                    }
                }
            }
        }
        output[IDX_OUT(o, h, w, outH, outW)] = relu_ispc(sum);
    }
}

// ========================================
// 前向传播：全连接
// ========================================
export void dot_forward_ispc(
    uniform int inLen, uniform int outLen,
    uniform double input[], uniform double output[],
    uniform double weight[], uniform double bias[]
)
{
    foreach (y = 0 ... outLen) {
        varying double sum = bias[y];
        for (uniform int x = 0; x < inLen; x++) {
            sum += input[x] * weight[x * outLen + y];
        }
        output[y] = relu_ispc(sum);
    }
}

// ========================================
// 反向传播：卷积
// ========================================
export void conv_backward_ispc(
    uniform int outC, uniform int inC,
    uniform int inH, uniform int inW,
    uniform int kH, uniform int kW,
    uniform int outH, uniform int outW,
    uniform double input[], uniform double output[],
    uniform double out_error[], uniform double in_error[],
    uniform double weight[], uniform double dweight[],
    uniform double dbias[]
)
{
    // 清零
    foreach (i = 0 ... outC) dbias[i] = 0.0;
    foreach (i = 0 ... outC*inC*kH*kW) dweight[i] = 0.0;
    foreach (i = 0 ... inC*inH*inW) in_error[i] = 0.0;

    // 1. 偏置梯度
    foreach (o = 0 ... outC) {
        varying double sum = 0.0;
        for (uniform int h = 0; h < outH; h++)
            for (uniform int w = 0; w < outW; w++)
                sum += out_error[IDX_OUT(o, h, w, outH, outW)];
        dbias[o] = sum;
    }

    // 2. 权重梯度
    foreach (o = 0 ... outC, c = 0 ... inC, kh = 0 ... kH, kw = 0 ... kW) {
        varying double sum = 0.0;
        for (uniform int h = 0; h < outH; h++) {
            for (uniform int w = 0; w < outW; w++) {
                varying int ih = h + kh;  // varying
                varying int iw = w + kw;  // varying
                if (ih < inH && iw < inW) {
                    sum += input[IDX3(c, ih, iw, inH, inW)] *
                           out_error[IDX_OUT(o, h, w, outH, outW)];
                }
            }
        }
        dweight[IDX4(o, c, kh, kw, inC, kH, kW)] = sum;
    }

    // 3. 输入误差
    foreach (c = 0 ... inC, ih = 0 ... inH, iw = 0 ... inW) {
        varying double sum = 0.0;
        for (uniform int o = 0; o < outC; o++) {
            for (uniform int kh = 0; kh < kH; kh++) {
                for (uniform int kw = 0; kw < kW; kw++) {
                    varying int oh = ih - kh;  // varying
                    varying int ow = iw - kw;  // varying
                    if (oh >= 0 && oh < outH && ow >= 0 && ow < outW) {
                        varying int out_idx = IDX_OUT(o, oh, ow, outH, outW);
                        varying double grad = out_error[out_idx];
                        grad *= (output[out_idx] > 0.0 ? 1.0 : 0.0);
                        sum += weight[IDX4(o, c, kh, kw, inC, kH, kW)] * grad;
                    }
                }
            }
        }
        in_error[IDX3(c, ih, iw, inH, inW)] = sum;
    }
}

// ========================================
// 反向传播：全连接
// ========================================
export void dot_backward_ispc(
    uniform int inLen, uniform int outLen,
    uniform double input[], uniform double output[],
    uniform double out_error[], uniform double in_error[],
    uniform double weight[], uniform double dweight[],
    uniform double dbias[]
)
{
    foreach (y = 0 ... outLen) {
        dbias[y] = out_error[y];
    }

    foreach (x = 0 ... inLen, y = 0 ... outLen) {
        varying double grad = out_error[y] * (output[y] > 0.0 ? 1.0 : 0.0);
        dweight[x * outLen + y] = input[x] * grad;
    }

    foreach (x = 0 ... inLen) {
        varying double sum = 0.0;
        for (uniform int y = 0; y < outLen; y++) {
            varying double grad = out_error[y] * (output[y] > 0.0 ? 1.0 : 0.0);
            sum += weight[x * outLen + y] * grad;
        }
        in_error[x] = sum;
    }
}