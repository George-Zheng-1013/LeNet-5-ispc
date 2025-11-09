//lenet.c
#include "lenet.h"
#include "lenet.ispc.h"
#include <memory.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include<stdio.h>

#define GETLENGTH(array) (sizeof(array)/sizeof(*(array)))

#define GETCOUNT(array)  (sizeof(array)/sizeof(float))

#define FOREACH(i,count) for (int i = 0; i < count; ++i)

#define CONVOLUTE_VALID(input,output,weight)											\
{																						\
	FOREACH(o0,GETLENGTH(output))														\
		FOREACH(o1,GETLENGTH(*(output)))												\
			FOREACH(w0,GETLENGTH(weight))												\
				FOREACH(w1,GETLENGTH(*(weight)))										\
					(output)[o0][o1] += (input)[o0 + w0][o1 + w1] * (weight)[w0][w1];	\
}

#define CONVOLUTE_FULL(input,output,weight)												\
{																						\
	FOREACH(i0,GETLENGTH(input))														\
		FOREACH(i1,GETLENGTH(*(input)))													\
			FOREACH(w0,GETLENGTH(weight))												\
				FOREACH(w1,GETLENGTH(*(weight)))										\
					(output)[i0 + w0][i1 + w1] += (input)[i0][i1] * (weight)[w0][w1];	\
}

#define CONVOLUTION_FORWARD(input,output,weight,bias,action)					\
{																				\
	for (int x = 0; x < GETLENGTH(weight); ++x)									\
		for (int y = 0; y < GETLENGTH(*weight); ++y)							\
			CONVOLUTE_VALID(input[x], output[y], weight[x][y]);					\
	FOREACH(j, GETLENGTH(output))												\
		FOREACH(i, GETCOUNT(output[j]))											\
		((float *)output[j])[i] = action(((float *)output[j])[i] + bias[j]);	\
}

#define CONVOLUTION_BACKWARD(input,inerror,outerror,weight,wd,bd,actiongrad)\
{																			\
	for (int x = 0; x < GETLENGTH(weight); ++x)								\
		for (int y = 0; y < GETLENGTH(*weight); ++y)						\
			CONVOLUTE_FULL(outerror[y], inerror[x], weight[x][y]);			\
	FOREACH(i, GETCOUNT(inerror))											\
		((float *)inerror)[i] *= actiongrad(((float *)input)[i]);			\
	FOREACH(j, GETLENGTH(outerror))											\
		FOREACH(i, GETCOUNT(outerror[j]))									\
		bd[j] += ((float *)outerror[j])[i];								\
	for (int x = 0; x < GETLENGTH(weight); ++x)								\
		for (int y = 0; y < GETLENGTH(*weight); ++y)						\
			CONVOLUTE_VALID(input[x], wd[x][y], outerror[y]);				\
}


#define SUBSAMP_MAX_FORWARD(input, output) \
{ \
    const int len0 = GETLENGTH(*(input)) / GETLENGTH(*(output)); \
    const int len1 = GETLENGTH(**(input)) / GETLENGTH(**(output)); \
    FOREACH(i, GETLENGTH(output)) \
    FOREACH(o0, GETLENGTH(*(output))) \
    FOREACH(o1, GETLENGTH(**(output))) \
    { \
        int x0 = 0, x1 = 0; \
        float maxval = input[i][o0*len0 + x0][o1*len1 + x1]; \
        FOREACH(l0, len0) \
        FOREACH(l1, len1) \
        { \
            float val = input[i][o0*len0 + l0][o1*len1 + l1]; \
            if (val > maxval) { \
                maxval = val; \
                x0 = l0; \
                x1 = l1; \
            } \
        } \
        output[i][o0][o1] = maxval; \
    } \
}

#define SUBSAMP_MAX_BACKWARD(input, inerror, outerror) \
{ \
    const int len0 = GETLENGTH(*(inerror)) / GETLENGTH(*(outerror)); \
    const int len1 = GETLENGTH(**(inerror)) / GETLENGTH(**(outerror)); \
    FOREACH(i, GETLENGTH(outerror)) \
    FOREACH(o0, GETLENGTH(*(outerror))) \
    FOREACH(o1, GETLENGTH(**(outerror))) \
    { \
        int x0 = 0, x1 = 0; \
        float maxval = input[i][o0*len0 + x0][o1*len1 + x1]; \
        FOREACH(l0, len0) \
        FOREACH(l1, len1) \
        { \
            float val = input[i][o0*len0 + l0][o1*len1 + l1]; \
            if (val > maxval) { \
                maxval = val; \
                x0 = l0; \
                x1 = l1; \
            } \
        } \
        inerror[i][o0*len0 + x0][o1*len1 + x1] = outerror[i][o0][o1]; \
    } \
}

#define DOT_PRODUCT_FORWARD(input,output,weight,bias,action)				\
{																			\
	for (int x = 0; x < GETLENGTH(weight); ++x)								\
		for (int y = 0; y < GETLENGTH(*weight); ++y)						\
			((float *)output)[y] += ((float *)input)[x] * weight[x][y];	\
	FOREACH(j, GETLENGTH(bias))												\
		((float *)output)[j] = action(((float *)output)[j] + bias[j]);	\
}

#define DOT_PRODUCT_BACKWARD(input,inerror,outerror,weight,wd,bd,actiongrad)	\
{																				\
	for (int x = 0; x < GETLENGTH(weight); ++x)									\
		for (int y = 0; y < GETLENGTH(*weight); ++y)							\
			((float *)inerror)[x] += ((float *)outerror)[y] * weight[x][y];	\
	FOREACH(i, GETCOUNT(inerror))												\
		((float *)inerror)[i] *= actiongrad(((float *)input)[i]);				\
	FOREACH(j, GETLENGTH(outerror))												\
		bd[j] += ((float *)outerror)[j];										\
	for (int x = 0; x < GETLENGTH(weight); ++x)									\
		for (int y = 0; y < GETLENGTH(*weight); ++y)							\
			wd[x][y] += ((float *)input)[x] * ((float *)outerror)[y];			\
}

float relu(float x)
{
	return x*(x > 0);
}

float relugrad(float y)
{
	return y > 0;
}
// 函数指针初始化
float (*relu_ptr)(float) = relu;
float (*relugrad_ptr)(float) = relugrad;

void forward(LeNet5 *lenet, Feature *features, float(*action)(float))
{
	CONVOLUTION_FORWARD(features->input, features->layer1, lenet->weight0_1, lenet->bias0_1, action);
	SUBSAMP_MAX_FORWARD(features->layer1, features->layer2);
	CONVOLUTION_FORWARD(features->layer2, features->layer3, lenet->weight2_3, lenet->bias2_3, action);
	SUBSAMP_MAX_FORWARD(features->layer3, features->layer4);
	CONVOLUTION_FORWARD(features->layer4, features->layer5, lenet->weight4_5, lenet->bias4_5, action);
	DOT_PRODUCT_FORWARD(features->layer5, features->output, lenet->weight5_6, lenet->bias5_6, action);
}

void backward(LeNet5 *lenet, LeNet5 *deltas, Feature *errors, Feature *features, float(*actiongrad)(float))
{
	DOT_PRODUCT_BACKWARD(features->layer5, errors->layer5, errors->output, lenet->weight5_6, deltas->weight5_6, deltas->bias5_6, actiongrad);
	CONVOLUTION_BACKWARD(features->layer4, errors->layer4, errors->layer5, lenet->weight4_5, deltas->weight4_5, deltas->bias4_5, actiongrad);
	SUBSAMP_MAX_BACKWARD(features->layer3, errors->layer3, errors->layer4);
	CONVOLUTION_BACKWARD(features->layer2, errors->layer2, errors->layer3, lenet->weight2_3, deltas->weight2_3, deltas->bias2_3, actiongrad);
	SUBSAMP_MAX_BACKWARD(features->layer1, errors->layer1, errors->layer2);
	CONVOLUTION_BACKWARD(features->input, errors->input, errors->layer1, lenet->weight0_1, deltas->weight0_1, deltas->bias0_1, actiongrad);
}

static inline void load_input(Feature *features, image input)
{
	float (*layer0)[LENGTH_FEATURE0][LENGTH_FEATURE0] = features->input;
	const long sz = sizeof(image) / sizeof(**input);
	float mean = 0, std = 0;
	FOREACH(j, sizeof(image) / sizeof(*input))
		FOREACH(k, sizeof(*input) / sizeof(**input))
	{
		mean += input[j][k];
		std += input[j][k] * input[j][k];
	}
	mean /= sz;
	std = sqrt(std / sz - mean*mean);
	FOREACH(j, sizeof(image) / sizeof(*input))
		FOREACH(k, sizeof(*input) / sizeof(**input))
	{
		layer0[0][j + PADDING][k + PADDING] = (input[j][k] - mean) / std;
	}
}

static inline void softmax(float input[OUTPUT], float loss[OUTPUT], int label, int count)
{
	float inner = 0;
	for (int i = 0; i < count; ++i)
	{
		float res = 0;
		for (int j = 0; j < count; ++j)
		{
			res += exp(input[j] - input[i]);
		}
		loss[i] = 1. / res;
		inner -= loss[i] * loss[i];
	}
	inner += loss[label];
	for (int i = 0; i < count; ++i)
	{
		loss[i] *= (i == label) - loss[i] - inner;
	}
}

void load_target(Feature *features, Feature *errors, int label)
{
	float *output = (float *)features->output;
	float *error = (float *)errors->output;
	softmax(output, error, label, GETCOUNT(features->output));
}

static uint8 get_result(Feature *features, uint8 count)
{
	float *output = (float *)features->output; 
	const int outlen = GETCOUNT(features->output);
	uint8 result = 0;
	float maxvalue = *output;
	for (uint8 i = 1; i < count; ++i)
	{
		if (output[i] > maxvalue)
		{
		 maxvalue = output[i];
		 result = i;
		}
	}
	return result;
}

static float f64rand()
{
	static int randbit = 0;
	if (!randbit)
	{
		srand((unsigned)time(0));
		for (int i = RAND_MAX; i; i >>= 1, ++randbit);
	}
	unsigned long long lvalue = 0x4000000000000000L;
	int i = 52 - randbit;
	for (; i > 0; i -= randbit)
		lvalue |= (unsigned long long)rand() << i;
	lvalue |= (unsigned long long)rand() >> -i;
	return *(float *)&lvalue - 3;
}

// 纯串行训练函数（无OpenMP）
void TrainBatch(LeNet5* lenet, image* inputs, uint8* labels, int batchSize)
{
	float buffer[GETCOUNT(LeNet5)] = { 0 };
	int i;
	for (i = 0; i < batchSize; ++i)
	{
		Feature features = { 0 };
		Feature errors = { 0 };
		LeNet5 deltas = { 0 };

		load_input(&features, inputs[i]);
		forward(lenet, &features, relu);
		load_target(&features, &errors, labels[i]);
		backward(lenet, &deltas, &errors, &features, relugrad);

		// 累加梯度
		for (int j = 0; j < GETCOUNT(LeNet5); ++j)
			buffer[j] += ((float*)&deltas)[j];
	}

	// 应用梯度更新
	float k = ALPHA / batchSize;
	for (int i = 0; i < GETCOUNT(LeNet5); ++i)
		((float*)lenet)[i] += k * buffer[i];
}

// ============================================================
// ISPC 并行训练（优化版 - 使用 Max Pooling ISPC）
// ============================================================
void TrainBatch_parallel(LeNet5* lenet, image* inputs, uint8* labels, int batchSize)
{
	// 一次性分配所有需要的内存
	float* buffer = (float*)calloc(GETCOUNT(LeNet5), sizeof(float));
	if (!buffer) return;

	// === 预先展平所有权重（只做一次）===
	float* w0_1 = (float*)malloc(6 * 1 * 5 * 5 * sizeof(float));
	float* w2_3 = (float*)malloc(16 * 6 * 5 * 5 * sizeof(float));
	float* w4_5 = (float*)malloc(120 * 16 * 5 * 5 * sizeof(float));
	
	if (!w0_1 || !w2_3 || !w4_5) {
		free(buffer);
		free(w0_1); free(w2_3); free(w4_5);
		return;
	}

	for (int o = 0; o < 6; o++)
		for (int c = 0; c < 1; c++)
			for (int kh = 0; kh < 5; kh++)
				for (int kw = 0; kw < 5; kw++)
					w0_1[o * 1 * 25 + c * 25 + kh * 5 + kw] = lenet->weight0_1[c][o][kh][kw];

	for (int o = 0; o < 16; o++)
		for (int c = 0; c < 6; c++)
			for (int kh = 0; kh < 5; kh++)
				for (int kw = 0; kw < 5; kw++)
					w2_3[o * 6 * 25 + c * 25 + kh * 5 + kw] = lenet->weight2_3[c][o][kh][kw];

	for (int o = 0; o < 120; o++)
		for (int c = 0; c < 16; c++)
			for (int kh = 0; kh < 5; kh++)
				for (int kw = 0; kw < 5; kw++)
					w4_5[o * 16 * 25 + c * 25 + kh * 5 + kw] = lenet->weight4_5[c][o][kh][kw];

	// === 预分配反向传播权重梯度缓冲 ===
	float* dw0_1 = (float*)malloc(6 * 1 * 5 * 5 * sizeof(float));
	float* dw2_3 = (float*)malloc(16 * 6 * 5 * 5 * sizeof(float));
	float* dw4_5 = (float*)malloc(120 * 16 * 5 * 5 * sizeof(float));
	
	if (!dw0_1 || !dw2_3 || !dw4_5) {
		free(buffer); free(w0_1); free(w2_3); free(w4_5);
		free(dw0_1); free(dw2_3); free(dw4_5);
		return;
	}

	// === 预分配特征和误差缓冲（复用）===
	float* input_flat = (float*)calloc(1 * 32 * 32, sizeof(float));
	float* layer1_flat = (float*)calloc(6 * 28 * 28, sizeof(float));
	float* layer2_flat = (float*)calloc(6 * 14 * 14, sizeof(float));
	float* layer3_flat = (float*)calloc(16 * 10 * 10, sizeof(float));
	float* layer4_flat = (float*)calloc(16 * 5 * 5, sizeof(float));
	float* layer5_flat = (float*)calloc(120, sizeof(float));
	
	float* err_layer5 = (float*)calloc(120, sizeof(float));
	float* err_layer4 = (float*)calloc(16 * 5 * 5, sizeof(float));
	float* err_layer3 = (float*)calloc(16 * 10 * 10, sizeof(float));
	float* err_layer2 = (float*)calloc(6 * 14 * 14, sizeof(float));
	float* err_layer1 = (float*)calloc(6 * 28 * 28, sizeof(float));
	
	// === 预分配 Max Pooling 索引缓冲（新增）===
	int* pool2_indices = (int*)malloc(6 * 14 * 14 * sizeof(int));
	int* pool4_indices = (int*)malloc(16 * 5 * 5 * sizeof(int));
	
	if (!input_flat || !layer1_flat || !layer2_flat || !layer3_flat || 
	    !layer4_flat || !layer5_flat || !err_layer5 || !err_layer4 || 
	    !err_layer3 || !err_layer2 || !err_layer1 || !pool2_indices || !pool4_indices) {
		free(buffer); free(w0_1); free(w2_3); free(w4_5);
		free(dw0_1); free(dw2_3); free(dw4_5);
		free(input_flat); free(layer1_flat); free(layer2_flat);
		free(layer3_flat); free(layer4_flat); free(layer5_flat);
		free(err_layer5); free(err_layer4); free(err_layer3);
		free(err_layer2); free(err_layer1);
		free(pool2_indices); free(pool4_indices);
		return;
	}

	// === 处理每个样本 ===
	for (int i = 0; i < batchSize; ++i)
	{
		Feature features = { 0 };
		Feature errors = { 0 };
		LeNet5  deltas = { 0 };

		// === 1. 输入归一化 + padding ===
		float mean = 0, std = 0;
		for (int h = 0; h < 28; ++h)
			for (int w = 0; w < 28; ++w) {
				float val = inputs[i][h][w];
				mean += val;
				std += val * val;
			}
		mean /= (28 * 28);
		std = sqrt(std / (28 * 28) - mean * mean);
		if (std < 1e-8) std = 1.0;

		// 清零 input_flat（避免残留）
		memset(input_flat, 0, 1 * 32 * 32 * sizeof(float));
		for (int h = 0; h < 28; ++h)
			for (int w = 0; w < 28; ++w)
				input_flat[0 * 32 * 32 + (h + 2) * 32 + (w + 2)] = (inputs[i][h][w] - mean) / std;

		// === 2. ISPC 前向传播 ===
		// C1: 卷积层
		memset(layer1_flat, 0, 6 * 28 * 28 * sizeof(float));
		conv_forward_ispc(6, 1, 32, 32, 5, 5, 28, 28, input_flat, layer1_flat, w0_1, lenet->bias0_1);
		memcpy(features.layer1, layer1_flat, 6 * 28 * 28 * sizeof(float));
		
		// S2: Max Pooling 层（使用 ISPC）
		memset(pool2_indices, 0, 6 * 14 * 14 * sizeof(int));
		maxpool_forward_ispc(6, 28, 28, 14, 14, 2, layer1_flat, layer2_flat, pool2_indices);
		memcpy(features.layer2, layer2_flat, 6 * 14 * 14 * sizeof(float));

		// C3: 卷积层
		memset(layer3_flat, 0, 16 * 10 * 10 * sizeof(float));
		conv_forward_ispc(16, 6, 14, 14, 5, 5, 10, 10, layer2_flat, layer3_flat, w2_3, lenet->bias2_3);
		memcpy(features.layer3, layer3_flat, 16 * 10 * 10 * sizeof(float));
		
		// S4: Max Pooling 层（使用 ISPC）
		memset(pool4_indices, 0, 16 * 5 * 5 * sizeof(int));
		maxpool_forward_ispc(16, 10, 10, 5, 5, 2, layer3_flat, layer4_flat, pool4_indices);
		memcpy(features.layer4, layer4_flat, 16 * 5 * 5 * sizeof(float));

		// C5: 卷积层
		memset(layer5_flat, 0, 120 * sizeof(float));
		conv_forward_ispc(120, 16, 5, 5, 5, 5, 1, 1, layer4_flat, layer5_flat, w4_5, lenet->bias4_5);
		memcpy(features.layer5, layer5_flat, 120 * sizeof(float));

		// FC6: 全连接层
		dot_forward_ispc(120, 10, layer5_flat, features.output, (float*)lenet->weight5_6, (float*)lenet->bias5_6);

		// === 3. 反向传播（使用 ISPC）===
		load_target(&features, &errors, labels[i]);
		
		// FC 层反向（ISPC）
		memset(err_layer5, 0, 120 * sizeof(float));
		memset(deltas.bias5_6, 0, sizeof(deltas.bias5_6));
		memset(deltas.weight5_6, 0, sizeof(deltas.weight5_6));
		
		dot_backward_ispc(120, 10, layer5_flat, features.output, 
		                  errors.output, err_layer5,
		                  (float*)lenet->weight5_6, 
		                  (float*)deltas.weight5_6, 
		                  deltas.bias5_6);
		
		memcpy(errors.layer5, err_layer5, 120 * sizeof(float));
		
		// C5 反向（ISPC）
		memset(err_layer4, 0, 16 * 5 * 5 * sizeof(float));
		memset(dw4_5, 0, 120 * 16 * 5 * 5 * sizeof(float));
		memset(deltas.bias4_5, 0, sizeof(deltas.bias4_5));
		
		conv_backward_ispc(120, 16, 5, 5, 5, 5, 1, 1,
		                   layer4_flat, layer5_flat,
		                   err_layer5, err_layer4,
		                   w4_5, dw4_5, deltas.bias4_5);
		
		memcpy(errors.layer4, err_layer4, 16 * 5 * 5 * sizeof(float));
		
		// 将展平的梯度复制回原始结构
		for (int o = 0; o < 120; o++)
			for (int c = 0; c < 16; c++)
				for (int kh = 0; kh < 5; kh++)
					for (int kw = 0; kw < 5; kw++)
						deltas.weight4_5[c][o][kh][kw] = dw4_5[o * 16 * 25 + c * 25 + kh * 5 + kw];
		
		// S4 反向（Max Pooling - 使用 ISPC）
		memset(err_layer3, 0, 16 * 10 * 10 * sizeof(float));
		maxpool_backward_ispc(16, 10, 10, 5, 5, err_layer4, err_layer3, pool4_indices);
		memcpy(errors.layer3, err_layer3, 16 * 10 * 10 * sizeof(float));
		
		// C3 反向（ISPC）
		memset(err_layer2, 0, 6 * 14 * 14 * sizeof(float));
		memset(dw2_3, 0, 16 * 6 * 5 * 5 * sizeof(float));
		memset(deltas.bias2_3, 0, sizeof(deltas.bias2_3));
		
		conv_backward_ispc(16, 6, 14, 14, 5, 5, 10, 10,
		                   layer2_flat, layer3_flat,
		                   err_layer3, err_layer2,
		                   w2_3, dw2_3, deltas.bias2_3);
		
		memcpy(errors.layer2, err_layer2, 6 * 14 * 14 * sizeof(float));
		
		for (int o = 0; o < 16; o++)
			for (int c = 0; c < 6; c++)
				for (int kh = 0; kh < 5; kh++)
					for (int kw = 0; kw < 5; kw++)
						deltas.weight2_3[c][o][kh][kw] = dw2_3[o * 6 * 25 + c * 25 + kh * 5 + kw];
		
		// S2 反向（Max Pooling - 使用 ISPC）
		memset(err_layer1, 0, 6 * 28 * 28 * sizeof(float));
		maxpool_backward_ispc(6, 28, 28, 14, 14, err_layer2, err_layer1, pool2_indices);
		memcpy(errors.layer1, err_layer1, 6 * 28 * 28 * sizeof(float));
		
		// C1 反向（ISPC）
		memset(dw0_1, 0, 6 * 1 * 5 * 5 * sizeof(float));
		memset(deltas.bias0_1, 0, sizeof(deltas.bias0_1));
		
		float* err_input = (float*)calloc(1 * 32 * 32, sizeof(float));
		if (err_input) {
			conv_backward_ispc(6, 1, 32, 32, 5, 5, 28, 28,
			                   input_flat, layer1_flat,
			                   err_layer1, err_input,
			                   w0_1, dw0_1, deltas.bias0_1);
			
			for (int o = 0; o < 6; o++)
				for (int c = 0; c < 1; c++)
					for (int kh = 0; kh < 5; kh++)
						for (int kw = 0; kw < 5; kw++)
							deltas.weight0_1[c][o][kh][kw] = dw0_1[o * 1 * 25 + c * 25 + kh * 5 + kw];
			
			free(err_input);
		}

		// === 4. 累积梯度 ===
		for (int j = 0; j < GETCOUNT(LeNet5); j++)
			buffer[j] += ((float*)&deltas)[j];
	}

	// === 5. 更新模型 ===
	float k = ALPHA / batchSize;
	for (int i = 0; i < GETCOUNT(LeNet5); i++)
		((float*)lenet)[i] += k * buffer[i];

	// 释放所有内存
	free(buffer);
	free(w0_1); free(w2_3); free(w4_5);
	free(dw0_1); free(dw2_3); free(dw4_5);
	free(input_flat); free(layer1_flat); free(layer2_flat);
	free(layer3_flat); free(layer4_flat); free(layer5_flat);
	free(err_layer5); free(err_layer4); free(err_layer3);
	free(err_layer2); free(err_layer1);
	free(pool2_indices); free(pool4_indices);
}

void Train(LeNet5 *lenet, image input, uint8 label)
{
	Feature features = { 0 };
	Feature errors = { 0 };
	LeNet5 deltas = { 0 };
	load_input(&features, input);
	forward(lenet, &features, relu);
	load_target(&features, &errors, label);
	backward(lenet, &deltas, &errors, &features, relugrad);
	FOREACH(i, GETCOUNT(LeNet5))
		((float *)lenet)[i] += ALPHA * ((float *)&deltas)[i];
}

uint8 Predict(LeNet5 *lenet, image input,uint8 count)
{
	Feature features = { 0 };
	load_input(&features, input);
	forward(lenet, &features, relu);
	return get_result(&features, count);
}

void Initial(LeNet5 *lenet)
{
	for (float *pos = (float *)lenet->weight0_1; pos < (float *)lenet->bias0_1; *pos++ = f64rand());
	for (float *pos = (float *)lenet->weight0_1; pos < (float *)lenet->weight2_3; *pos++ *= sqrt(6.0 / (LENGTH_KERNEL * LENGTH_KERNEL * (INPUT + LAYER1))));
	for (float *pos = (float *)lenet->weight2_3; pos < (float *)lenet->weight4_5; *pos++ *= sqrt(6.0 / (LENGTH_KERNEL * LENGTH_KERNEL * (LAYER2 + LAYER3))));
	for (float *pos = (float *)lenet->weight4_5; pos < (float *)lenet->weight5_6; *pos++ *= sqrt(6.0 / (LENGTH_KERNEL * LENGTH_KERNEL * (LAYER4 + LAYER5))));
	for (float *pos = (float *)lenet->weight5_6; pos < (float *)lenet->bias0_1; *pos++ *= sqrt(6.0 / (LAYER5 + OUTPUT)));
	for (int *pos = (int *)lenet->bias0_1; pos < (int *)(lenet + 1); *pos++ = 0);
}


