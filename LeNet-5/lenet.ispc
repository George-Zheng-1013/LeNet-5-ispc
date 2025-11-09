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
    uniform double input[],    // input[inC*inH*inW] - NCHW layout, W is innermost
    uniform double output[],   // output[outC*outH*outW] - NCHW layout
    uniform double weight[],   // weight[outC*inC*kH*kW]
    uniform double bias[])     // bias[outC]
{
    print(">>> ISPC conv_forward_ispc launched! <<<\n");
    
    // 遍历输出通道
    for (uniform int o = 0; o < outC; o++) {
        uniform double b = bias[o];
        
        // 遍历输出高度
        for (uniform int oh = 0; oh < outH; oh++) {
            // SIMD 并行在输出宽度上：一次处理多个相邻像素
            foreach (ow = 0 ... outW) {
                varying double sum = 0.0;
        
                // 遍历输入通道
                for (uniform int c = 0; c < inC; c++) {
                    // 输入和权重的基地址
                    uniform int input_channel_base = c * inH * inW;
                    uniform int weight_channel_base = (o * inC + c) * kH * kW;
     
                    // 卷积核遍历
                    for (uniform int kh = 0; kh < kH; kh++) {
                        uniform int input_row_base = input_channel_base + (oh + kh) * inW;
                        uniform int weight_row_base = weight_channel_base + kh * kW;
           
                        for (uniform int kw = 0; kw < kW; kw++) {
                            // 关键：input[input_row_base + ow + kw]
                            // 每个 lane 访问 ow 不同，但都是连续地址
                            // 权重是 uniform，会被广播到所有 lane
                            uniform double w = weight[weight_row_base + kw];
                            varying double inp = input[input_row_base + ow + kw];
                            sum += inp * w;
                        }
                    }
                }
      
                // 激活并写回，输出地址也是连续的
                uniform int output_row_base = (o * outH + oh) * outW;
                output[output_row_base + ow] = relu_ispc(sum + b);
            }
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
