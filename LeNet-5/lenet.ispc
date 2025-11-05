// lenet.ispc

// relu 激活函数（varying 输入）
inline varying double relu_ispc(varying double x) {
    return x > 0 ? x : 0;
}

// 一维索引宏
#define IDX3(c,h,w,H,W) ((c)*(H)*(W) + (h)*(W) + (w))
#define IDX4(o,c,kh,kw,C,H,W) ((o)*(C)*(H)*(W) + (c)*(H)*(W) + (kh)*(W) + (kw))
#define IDX_OUT(o,h,w,H,W) ((o)*(H)*(W) + (h)*(W) + (w))

// 卷积前向（valid卷积）
export void conv_forward_ispc(
    uniform int outC, uniform int inC,
    uniform int inH, uniform int inW,
    uniform int kH, uniform int kW,
    uniform int outH, uniform int outW,
    uniform double input[],    // input[inC*inH*inW]
    uniform double output[],   // output[outC*outH*outW]
    uniform double weight[],   // weight[outC*inC*kH*kW]
    uniform double bias[])     // bias[outC]
{
    print(">>> ISPC conv_forward_ispc launched! <<<\n");
    // 输出通道并行
    foreach (o = 0 ... outC) {
        // 每个输出通道遍历每个输出像素
        for (int i0 = 0; i0 < outH; i0++)
            for (int i1 = 0; i1 < outW; i1++) {
                varying double sum = 0.0;
                // 卷积累加，确保访问连续内存
                for (int c = 0; c < inC; c++) {
                    int input_base = c*inH*inW + i0*inW;
                    int weight_base = o*inC*kH*kW + c*kH*kW;
                    for (int kh = 0; kh < kH; kh++) {
                        for (int kw = 0; kw < kW; kw++) {
                            sum += input[input_base + kh*inW + kw] * weight[weight_base + kh*kW + kw];
                        }
                    }
                }
                output[IDX_OUT(o,i0,i1,outH,outW)] = relu_ispc(sum + bias[o]);
            }
    }
}

// 全连接前向
export void dot_forward_ispc(
    uniform int inLen, uniform int outLen,
    uniform double input[],     // [inLen]
    uniform double output[],    // [outLen]
    uniform double weight[],    // [inLen*outLen]
    uniform double bias[]       // [outLen]
) {
    foreach (y = 0 ... outLen) {
        varying double sum = 0.0;
        int w_base = y;
        for (int x = 0; x < inLen; x++) {
            sum += input[x] * weight[x*outLen + y];  // 每列连续访问
        }
        output[y] = relu_ispc(sum + bias[y]);
    }
}
