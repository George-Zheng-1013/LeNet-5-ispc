// lenet.ispc - Optimized version

// 优化的无分支 ReLU（修复类型匹配）
inline varying double relu_ispc(varying double x) {
    return max(x, (double)0.0);  // 显式转换为 double
}

#define IDX3(c,h,w,H,W) ((c)*(H)*(W) + (h)*(W) + (w))
#define IDX4(o,c,kh,kw,C,KH,KW) ((o)*(C)*(KH)*(KW) + (c)*(KH)*(KW) + (kh)*(KW) + (kw))
#define IDX_OUT(o,h,w,H,W) ((o)*(H)*(W) + (h)*(W) + (w))

// ========================================
// 前向传播：Max Pooling（新增）
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
            // 向量化输出宽度
            foreach (ow = 0 ... outW) {
                varying double maxval = -1e30;  // 初始化为很小的值
                varying int maxIdx = 0;
                
                // 在池化窗口内寻找最大值
                #pragma unroll
                for (uniform int ph = 0; ph < poolSize; ph++) {
                    uniform int ih = oh * poolSize + ph;
                    if (ih < inH) {
                        #pragma unroll
                        for (uniform int pw = 0; pw < poolSize; pw++) {
                            varying int iw = ow * poolSize + pw;
                            varying bool valid = (iw < inW);
                            
                            if (valid) {
                                varying int inIdx = input_c_base + ih * inW + iw;
                                varying double val = input[inIdx];
                                
                                // 无分支更新最大值
                                varying bool is_greater = (val > maxval);
                                maxval = is_greater ? val : maxval;
                                maxIdx = is_greater ? inIdx : maxIdx;
                            }
                        }
                    }
                }
                
                varying int outIdx = output_c_base + oh * outW + ow;
                output[outIdx] = maxval;
                indices[outIdx] = maxIdx;  // 保存最大值的输入索引
            }
        }
    }
}

// ========================================
// 反向传播：Max Pooling（新增）
// ========================================
export void maxpool_backward_ispc(
    uniform int channels,
    uniform int inH, uniform int inW,
    uniform int outH, uniform int outW,
    uniform double out_error[],
    uniform double in_error[],
    uniform int indices[]  // 前向传播记录的最大值位置
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
            // 向量化输出宽度
            foreach (ow = 0 ... outW) {
                varying int outIdx = output_c_base + oh * outW + ow;
                varying int maxIdx = indices[outIdx];
                varying double err = out_error[outIdx];
                
                // 原子累加到对应位置（ISPC 自动处理冲突）
                in_error[maxIdx] = in_error[maxIdx] + err;
            }
        }
    }
}

// ========================================
// 前向传播：卷积（优化版）
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
    // 预计算 uniform strides
    uniform int stride_inHW = inH * inW;
    uniform int stride_outHW = outH * outW;
    uniform int stride_kHW = kH * kW;
    uniform int stride_inC_weight = inC * kH * kW;

    // 优化的向量化策略：只对输出宽度 w 向量化（连续内存）
    // 外层循环用 uniform，避免 varying 整数运算
    for (uniform int o = 0; o < outC; o++) {
        uniform double b = bias[o];
        uniform int out_base = o * stride_outHW;
        uniform int weight_o_base = o * stride_inC_weight;
        
        for (uniform int h = 0; h < outH; h++) {
            // w 向量化：每个 lane 处理不同的 w
            foreach (w = 0 ... outW) {
                varying double sum = b;
                
                for (uniform int c = 0; c < inC; c++) {
                    uniform int input_c_base = c * stride_inHW;
                    uniform int weight_oc_base = weight_o_base + c * stride_kHW;
                    
                    // 展开小核循环
                    #pragma unroll
                    for (uniform int kh = 0; kh < kH; kh++) {
                        uniform int ih = h + kh;
                        // 边界检查提升到 uniform 层
                        if (ih < inH) {
                            uniform int input_row_base = input_c_base + ih * inW;
                            uniform int weight_kh_base = weight_oc_base + kh * kW;
                            
                            #pragma unroll
                            for (uniform int kw = 0; kw < kW; kw++) {
                                varying int iw = w + kw;  // varying
                                // 使用掩码而非分支
                                varying bool valid = (iw < inW);
                                varying double inp = valid ? input[input_row_base + iw] : 0.0;
                                sum += inp * weight[weight_kh_base + kw];
                            }
                        }
                    }
                }
                output[out_base + h * outW + w] = relu_ispc(sum);
            }
        }
    }
}

// ========================================
// 前向传播：全连接（优化版）
// ========================================
export void dot_forward_ispc(
    uniform int inLen, uniform int outLen,
    uniform double input[], uniform double output[],
    uniform double weight[], uniform double bias[]
)
{
    // 向量化输出维度
    foreach (y = 0 ... outLen) {
        varying double sum = bias[y];
        
        // 内层循环保持 uniform，减少 gather 开销
        for (uniform int x = 0; x < inLen; x++) {
            uniform double inp = input[x];
            sum += inp * weight[x * outLen + y];
        }
        output[y] = relu_ispc(sum);
    }
}

// ========================================
// 反向传播：卷积（优化版）
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
    // 预计算 uniform strides
    uniform int stride_inHW = inH * inW;
    uniform int stride_outHW = outH * outW;
    uniform int stride_kHW = kH * kW;
    uniform int stride_inC_weight = inC * kH * kW;
    uniform int total_weight = outC * inC * kH * kW;
    uniform int total_input = inC * inH * inW;

    // 清零 - 使用更高效的方式
    foreach (i = 0 ... outC) {
        dbias[i] = 0.0;
    }
    foreach (i = 0 ... total_weight) {
        dweight[i] = 0.0;
    }
    foreach (i = 0 ... total_input) {
        in_error[i] = 0.0;
    }

    // 1. 偏置梯度（优化版）
    for (uniform int o = 0; o < outC; o++) {
        uniform int out_base = o * stride_outHW;
        varying double sum = 0.0;
        
        foreach (hw = 0 ... (outH * outW)) {
            sum += out_error[out_base + hw];
        }
        dbias[o] = reduce_add(sum);
    }

    // 2. 权重梯度（优化版 - 修复 varying 问题）
    for (uniform int o = 0; o < outC; o++) {
        uniform int out_base = o * stride_outHW;
        uniform int weight_o_base = o * stride_inC_weight;
        
        for (uniform int c = 0; c < inC; c++) {
            uniform int input_c_base = c * stride_inHW;
            uniform int weight_oc_base = weight_o_base + c * stride_kHW;
            
            for (uniform int kh = 0; kh < kH; kh++) {
                for (uniform int kw = 0; kw < kW; kw++) {
                    varying double sum = 0.0;
                    
                    // 分离 h 和 w 的循环，避免 varying 取模
                    for (uniform int h = 0; h < outH; h++) {
                        foreach (w = 0 ... outW) {
                            varying int ih = h + kh;
                            varying int iw = w + kw;
                            varying bool valid = (ih < inH && iw < inW);
                            
                            if (valid) {
                                varying double inp = input[input_c_base + ih * inW + iw];
                                varying double err = out_error[out_base + h * outW + w];
                                sum += inp * err;
                            }
                        }
                    }
                    dweight[weight_oc_base + kh * kW + kw] = reduce_add(sum);
                }
            }
        }
    }

    // 3. 输入误差（优化版）
    for (uniform int c = 0; c < inC; c++) {
        uniform int input_c_base = c * stride_inHW;
        
        for (uniform int ih = 0; ih < inH; ih++) {
            foreach (iw = 0 ... inW) {
                varying double sum = 0.0;
                
                for (uniform int o = 0; o < outC; o++) {
                    uniform int out_base = o * stride_outHW;
                    uniform int weight_oc_base = o * stride_inC_weight + c * stride_kHW;
                    
                    #pragma unroll
                    for (uniform int kh = 0; kh < kH; kh++) {
                        varying int oh = ih - kh;
                        if (oh >= 0 && oh < outH) {
                            #pragma unroll
                            for (uniform int kw = 0; kw < kW; kw++) {
                                varying int ow = iw - kw;
                                if (ow >= 0 && ow < outW) {
                                    varying int out_idx = out_base + oh * outW + ow;
                                    varying double err = out_error[out_idx];
                                    varying double out_val = output[out_idx];
                                    // ReLU 梯度
                                    varying double grad = err * (out_val > 0.0 ? 1.0 : 0.0);
                                    sum += weight[weight_oc_base + kh * kW + kw] * grad;
                                }
                            }
                        }
                    }
                }
                in_error[input_c_base + ih * inW + iw] = sum;
            }
        }
    }
}

// ========================================
// 反向传播：全连接（优化版）
// ========================================
export void dot_backward_ispc(
    uniform int inLen, uniform int outLen,
    uniform double input[], uniform double output[],
    uniform double out_error[], uniform double in_error[],
    uniform double weight[], uniform double dweight[],
    uniform double dbias[]
)
{
    // 1. 偏置梯度（简单复制）
    foreach (y = 0 ... outLen) {
        dbias[y] = out_error[y];
    }

    // 2. 权重梯度（优化版）
    foreach (x = 0 ... inLen, y = 0 ... outLen) {
        varying double err = out_error[y];
        varying double out_val = output[y];
        varying double grad = err * (out_val > 0.0 ? 1.0 : 0.0);
        dweight[x * outLen + y] = input[x] * grad;
    }

    // 3. 输入误差（优化版）
    foreach (x = 0 ... inLen) {
        varying double sum = 0.0;
        
        for (uniform int y = 0; y < outLen; y++) {
            uniform double err = out_error[y];
            uniform double out_val = output[y];
            uniform double grad = err * (out_val > 0.0 ? 1.0 : 0.0);
            sum += weight[x * outLen + y] * grad;
        }
        in_error[x] = sum;
    }
}