// lenet.ispc - Optimized version with branch elimination and reduced redundant calculations

// 优化的无分支 ReLU（修复类型匹配）
inline varying double relu_ispc(varying double x) {
    return max(x, (double)0.0);  // 显式转换为 double
}

#define IDX3(c,h,w,H,W) ((c)*(H)*(W) + (h)*(W) + (w))
#define IDX4(o,c,kh,kw,C,KH,KW) ((o)*(C)*(KH)*(KW) + (c)*(KH)*(KW) + (kh)*(KW) + (kw))
#define IDX_OUT(o,h,w,H,W) ((o)*(H)*(W) + (h)*(W) + (w))

// ========================================
// 前向传播：Max Pooling（优化版）
// ========================================
export void maxpool_forward_ispc(
    uniform int channels,
    uniform int inH, uniform int inW,
    uniform int outH, uniform int outW,
    uniform int poolSize,
    uniform double input[],
    uniform double output[],
    uniform int indices[]  // 记录最大值位置，用于反向传播
)
{
    uniform int stride_inHW = inH * inW;
    uniform int stride_outHW = outH * outW;
    
    // 外层循环：通道和输出高度
    for (uniform int c = 0; c < channels; c++) {
        uniform int input_c_base = c * stride_inHW;
        uniform int output_c_base = c * stride_outHW;
        
        for (uniform int oh = 0; oh < outH; oh++) {
            uniform int input_row_base = input_c_base + oh * poolSize * inW;  // 【优化】预计算行基址
            
            // 向量化输出宽度
            foreach (ow = 0 ... outW) {
                varying double maxval = -1e30;
                varying int maxIdx = 0;
                varying int iw_base = ow * poolSize;  // 【优化】预计算列基址
                
                // 在池化窗口内寻找最大值
                #pragma unroll
                for (uniform int ph = 0; ph < poolSize; ph++) {
                    uniform int ih = oh * poolSize + ph;
                    uniform bool row_valid = (ih < inH);  // 【优化】提升到 uniform
                    
                    if (row_valid) {
                        uniform int row_offset = ph * inW;  // 【优化】增量索引
                        
                        #pragma unroll
                        for (uniform int pw = 0; pw < poolSize; pw++) {
                            varying int iw = iw_base + pw;
                            
                            // 【优化】使用 select 消除分支
                            varying int inIdx = input_row_base + row_offset + iw;
                            varying double val = select(iw < inW, input[inIdx], -1e30);
                            
                            // 【优化】无分支更新（使用 select）
                            varying bool is_greater = (val > maxval);
                            maxval = select(is_greater, val, maxval);
                            maxIdx = select(is_greater, inIdx, maxIdx);
                        }
                    }
                }
                
                varying int outIdx = output_c_base + oh * outW + ow;
                output[outIdx] = maxval;
                indices[outIdx] = maxIdx;
            }
        }
    }
}

// ========================================
// 反向传播：Max Pooling（优化版）
// ========================================
export void maxpool_backward_ispc(
    uniform int channels,
    uniform int inH, uniform int inW,
    uniform int outH, uniform int outW,
    uniform double out_error[],
    uniform double in_error[],
    uniform int indices[]
)
{
    uniform int stride_inHW = inH * inW;
    uniform int stride_outHW = outH * outW;
    uniform int total_input = channels * inH * inW;
    
    // 1. 清零输入误差
    foreach (i = 0 ... total_input) {
        in_error[i] = 0.0;
    }
    
    // 2. 根据 indices 将误差传递回最大值位置
    for (uniform int c = 0; c < channels; c++) {
        uniform int output_c_base = c * stride_outHW;
        
        for (uniform int oh = 0; oh < outH; oh++) {
            uniform int row_base = output_c_base + oh * outW;  // 【优化】预计算行基址
            
            foreach (ow = 0 ... outW) {
                varying int outIdx = row_base + ow;
                varying int maxIdx = indices[outIdx];
                varying double err = out_error[outIdx];
                
                // 原子累加（ISPC 自动处理冲突）
                in_error[maxIdx] = in_error[maxIdx] + err;
            }
        }
    }
}

// ========================================
// 前向传播：卷积（优化版 - 消除分支 + FMA）
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
    uniform int stride_inHW = inH * inW;
    uniform int stride_outHW = outH * outW;
    uniform int stride_kHW = kH * kW;
    uniform int stride_inC_weight = inC * kH * kW;

    for (uniform int o = 0; o < outC; o++) {
        uniform double b = bias[o];
        uniform int out_base = o * stride_outHW;
        uniform int weight_o_base = o * stride_inC_weight;
        
        for (uniform int h = 0; h < outH; h++) {
            uniform int out_row_base = out_base + h * outW;  // 【优化】预计算输出行基址
            
            foreach (w = 0 ... outW) {
                varying double sum = b;
                
                for (uniform int c = 0; c < inC; c++) {
                    uniform int input_c_base = c * stride_inHW;
                    uniform int weight_oc_base = weight_o_base + c * stride_kHW;
                    
                    #pragma unroll
                    for (uniform int kh = 0; kh < kH; kh++) {
                        uniform int ih = h + kh;
                        uniform bool row_valid = (ih < inH);  // 【优化】提升到 uniform
                        
                        if (row_valid) {
                            uniform int input_row_base = input_c_base + ih * inW;
                            uniform int weight_kh_base = weight_oc_base + kh * kW;
                            
                            #pragma unroll
                            for (uniform int kw = 0; kw < kW; kw++) {
                                varying int iw = w + kw;
                                
                                // 【优化】使用 select 替代条件运算符
                                varying double inp = select(iw < inW, input[input_row_base + iw], 0.0);
                                
                                // 【优化】使用 FMA 指令
                                sum = fma(inp, weight[weight_kh_base + kw], sum);
                            }
                        }
                    }
                }
                output[out_row_base + w] = relu_ispc(sum);
            }
        }
    }
}

// ========================================
// 前向传播：全连接（优化版 - FMA）
// ========================================
export void dot_forward_ispc(
    uniform int inLen, uniform int outLen,
    uniform double input[], uniform double output[],
    uniform double weight[], uniform double bias[]
)
{
    foreach (y = 0 ... outLen) {
        varying double sum = bias[y];
        
        // 【优化】使用 FMA 指令
        for (uniform int x = 0; x < inLen; x++) {
            uniform double inp = input[x];
            sum = fma(inp, weight[x * outLen + y], sum);
        }
        output[y] = relu_ispc(sum);
    }
}

// ========================================
// 反向传播：卷积（优化版 - 消除分支 + 减少计算）
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
    uniform int stride_inHW = inH * inW;
    uniform int stride_outHW = outH * outW;
    uniform int stride_kHW = kH * kW;
    uniform int stride_inC_weight = inC * kH * kW;
    uniform int total_weight = outC * inC * kH * kW;
    uniform int total_input = inC * inH * inW;

    // 清零
    foreach (i = 0 ... outC) {
        dbias[i] = 0.0;
    }
    foreach (i = 0 ... total_weight) {
        dweight[i] = 0.0;
    }
    foreach (i = 0 ... total_input) {
        in_error[i] = 0.0;
    }

    // 1. 偏置梯度
    for (uniform int o = 0; o < outC; o++) {
        uniform int out_base = o * stride_outHW;
        varying double sum = 0.0;
        
        foreach (hw = 0 ... (outH * outW)) {
            sum += out_error[out_base + hw];
        }
        dbias[o] = reduce_add(sum);
    }

    // 2. 权重梯度（优化索引计算）
    for (uniform int o = 0; o < outC; o++) {
        uniform int out_base = o * stride_outHW;
        uniform int weight_o_base = o * stride_inC_weight;
        
        for (uniform int c = 0; c < inC; c++) {
            uniform int input_c_base = c * stride_inHW;
            uniform int weight_oc_base = weight_o_base + c * stride_kHW;
            
            for (uniform int kh = 0; kh < kH; kh++) {
                uniform int weight_row_base = weight_oc_base + kh * kW;  // 【优化】预计算
                
                for (uniform int kw = 0; kw < kW; kw++) {
                    varying double sum = 0.0;
                    
                    for (uniform int h = 0; h < outH; h++) {
                        uniform int ih = h + kh;
                        uniform bool row_valid = (ih < inH);  // 【优化】提升检查
                        uniform int out_row_base = out_base + h * outW;
                        
                        if (row_valid) {
                            uniform int input_row_base = input_c_base + ih * inW;
                            
                            foreach (w = 0 ... outW) {
                                varying int iw = w + kw;
                                
                                // 【优化】使用 select 消除分支
                                varying double inp = select(iw < inW, input[input_row_base + iw], 0.0);
                                varying double err = out_error[out_row_base + w];
                                
                                // 【优化】使用 FMA
                                sum = fma(inp, err, sum);
                            }
                        }
                    }
                    dweight[weight_row_base + kw] = reduce_add(sum);
                }
            }
        }
    }

    // 3. 输入误差（优化索引计算）
    for (uniform int c = 0; c < inC; c++) {
        uniform int input_c_base = c * stride_inHW;
        
        for (uniform int ih = 0; ih < inH; ih++) {
            uniform int input_row_base = input_c_base + ih * inW;  // 【优化】预计算
            
            foreach (iw = 0 ... inW) {
                varying double sum = 0.0;
                
                for (uniform int o = 0; o < outC; o++) {
                    uniform int out_base = o * stride_outHW;
                    uniform int weight_oc_base = o * stride_inC_weight + c * stride_kHW;
                    
                    #pragma unroll
                    for (uniform int kh = 0; kh < kH; kh++) {
                        varying int oh = ih - kh;
                        uniform int weight_row_base = weight_oc_base + kh * kW;
                        
                        // 【优化】使用 select 消除嵌套 if
                        varying bool row_valid = (oh >= 0 && oh < outH);
                        
                        if (row_valid) {
                            uniform int out_row_base = out_base + oh * outW;
                            
                            #pragma unroll
                            for (uniform int kw = 0; kw < kW; kw++) {
                                varying int ow = iw - kw;
                                if (ow >= 0 && ow < outW) {
                                    varying int out_idx = out_row_base + ow;
                                    varying double err = out_error[out_idx];
                                    varying double out_val = output[out_idx];
                                    // ReLU 梯度
                                    varying double grad = err * select(out_val > 0.0, 1.0, 0.0);
                                    sum += weight[weight_row_base + kw] * grad;
                                }
                            }
                        }
                    }
                }
                in_error[input_row_base + iw] = sum;
            }
        }
    }
}

// ========================================
// 反向传播：全连接（优化版 - FMA + select）
// ========================================
export void dot_backward_ispc(
    uniform int inLen, uniform int outLen,
    uniform double input[], uniform double output[],
    uniform double out_error[], uniform double in_error[],
    uniform double weight[], uniform double dweight[],
    uniform double dbias[]
)
{
    // 1. 偏置梯度
    foreach (y = 0 ... outLen) {
        dbias[y] = out_error[y];
    }

    // 2. 权重梯度（优化版 - FMA + select）
    foreach (x = 0 ... inLen, y = 0 ... outLen) {
        varying double err = out_error[y];
        varying double out_val = output[y];
        
        // 【优化】使用 select 消除分支
        varying double grad = err * select(out_val > 0.0, 1.0, 0.0);
        
        dweight[x * outLen + y] = input[x] * grad;
    }

    // 3. 输入误差（优化版 - FMA + select）
    foreach (x = 0 ... inLen) {
        varying double sum = 0.0;
        
        for (uniform int y = 0; y < outLen; y++) {
            uniform double err = out_error[y];
            uniform double out_val = output[y];
            
            // 【优化】使用 select 消除分支
            uniform double grad = err * select(out_val > 0.0, 1.0, 0.0);
            
            // 【优化】使用 FMA
            sum = fma(weight[x * outLen + y], grad, sum);
        }
        in_error[x] = sum;
    }
}

// ========================================
// 前向传播：ReLU（优化版）
// ========================================
export void relu_forward_ispc(
    uniform int length,
    uniform double input[],
    uniform double output[]
)
{
    foreach (i = 0 ... length) {
        varying double val = input[i];
        output[i] = max(val, (double)0.0);
    }
}

// ========================================
// 反向传播：ReLU（优化版 - select）
// ========================================
export void relu_backward_ispc(
    uniform int length,
    uniform double input[],
    uniform double out_error[],
    uniform double in_error[]
)
{
    foreach (i = 0 ... length) {
        varying double val = input[i];
        
        // 【优化】使用 select 消除分支
        varying double grad = select(val > 0.0, 1.0, 0.0);
        
        in_error[i] = out_error[i] * grad;
    }
}