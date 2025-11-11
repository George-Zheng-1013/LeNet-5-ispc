#include "lenet.h"
#include "lenet.ispc.h"
#include <memory.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <omp.h>

#define GETLENGTH(array) (sizeof(array)/sizeof(*(array)))

#define GETCOUNT(array)  (sizeof(array)/sizeof(double))

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
		((double *)output[j])[i] = action(((double *)output[j])[i] + bias[j]);	\
}

#define CONVOLUTION_BACKWARD(input,inerror,outerror,weight,wd,bd,actiongrad)\
{																			\
	for (int x = 0; x < GETLENGTH(weight); ++x)								\
		for (int y = 0; y < GETLENGTH(*weight); ++y)						\
			CONVOLUTE_FULL(outerror[y], inerror[x], weight[x][y]);			\
	FOREACH(i, GETCOUNT(inerror))											\
		((double *)inerror)[i] *= actiongrad(((double *)input)[i]);			\
	FOREACH(j, GETLENGTH(outerror))											\
		FOREACH(i, GETCOUNT(outerror[j]))									\
		bd[j] += ((double *)outerror[j])[i];								\
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
        double maxval = input[i][o0*len0 + x0][o1*len1 + x1]; \
        FOREACH(l0, len0) \
        FOREACH(l1, len1) \
        { \
            double val = input[i][o0*len0 + l0][o1*len1 + l1]; \
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
        double maxval = input[i][o0*len0 + x0][o1*len1 + x1]; \
        FOREACH(l0, len0) \
        FOREACH(l1, len1) \
        { \
            double val = input[i][o0*len0 + l0][o1*len1 + l1]; \
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
			((double *)output)[y] += ((double *)input)[x] * weight[x][y];	\
	FOREACH(j, GETLENGTH(bias))												\
		((double *)output)[j] = action(((double *)output)[j] + bias[j]);	\
}

#define DOT_PRODUCT_BACKWARD(input,inerror,outerror,weight,wd,bd,actiongrad)	\
{																				\
	for (int x = 0; x < GETLENGTH(weight); ++x)									\
		for (int y = 0; y < GETLENGTH(*weight); ++y)							\
			((double *)inerror)[x] += ((double *)outerror)[y] * weight[x][y];	\
	FOREACH(i, GETCOUNT(inerror))												\
		((double *)inerror)[i] *= actiongrad(((double *)input)[i]);				\
	FOREACH(j, GETLENGTH(outerror))												\
		bd[j] += ((double *)outerror)[j];										\
	for (int x = 0; x < GETLENGTH(weight); ++x)									\
		for (int y = 0; y < GETLENGTH(*weight); ++y)							\
			wd[x][y] += ((double *)input)[x] * ((double *)outerror)[y];			\
}

double relu(double x)
{
	return x*(x > 0);
}

double relugrad(double y)
{
	return y > 0;
}
// 函数指针初始化
double (*relu_ptr)(double) = relu;
double (*relugrad_ptr)(double) = relugrad;

void forward(LeNet5 *lenet, Feature *features, double(*action)(double))
{
	CONVOLUTION_FORWARD(features->input, features->layer1, lenet->weight0_1, lenet->bias0_1, action);
	SUBSAMP_MAX_FORWARD(features->layer1, features->layer2);
	CONVOLUTION_FORWARD(features->layer2, features->layer3, lenet->weight2_3, lenet->bias2_3, action);
	SUBSAMP_MAX_FORWARD(features->layer3, features->layer4);
	CONVOLUTION_FORWARD(features->layer4, features->layer5, lenet->weight4_5, lenet->bias4_5, action);
	DOT_PRODUCT_FORWARD(features->layer5, features->output, lenet->weight5_6, lenet->bias5_6, action);
}

void backward(LeNet5 *lenet, LeNet5 *deltas, Feature *errors, Feature *features, double(*actiongrad)(double))
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
	double (*layer0)[LENGTH_FEATURE0][LENGTH_FEATURE0] = features->input;
	const long sz = sizeof(image) / sizeof(**input);
	double mean = 0, std = 0;
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

static inline void softmax(double input[OUTPUT], double loss[OUTPUT], int label, int count)
{
	double inner = 0;
	for (int i = 0; i < count; ++i)
	{
		double res = 0;
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
	double *output = (double *)features->output;
	double *error = (double *)errors->output;
	softmax(output, error, label, GETCOUNT(features->output));
}

static uint8 get_result(Feature *features, uint8 count)
{
	double *output = (double *)features->output; 
	const int outlen = GETCOUNT(features->output);
	uint8 result = 0;
	double maxvalue = *output;
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

static double f64rand()
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
	return *(double *)&lvalue - 3;
}


void TrainBatch_serial(LeNet5* lenet, image* inputs, uint8* labels, int batchSize)
{
	double buffer[GETCOUNT(LeNet5)] = { 0 };
	int i;
	// 去掉 #pragma omp parallel for，改为普通 for 循环
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
			buffer[j] += ((double*)&deltas)[j];
	}

	// 应用梯度更新
	double k = ALPHA / batchSize;
	for (int i = 0; i < GETCOUNT(LeNet5); ++i)
		((double*)lenet)[i] += k * buffer[i];
}

// ============================================================
// ISPC + OpenMP 并行训练（C1/C3/C5/FC 前向）
// 反向传播完全复用 backward() → 准确率与串行一致
// ============================================================
void TrainBatch_parallel(LeNet5* lenet, image* inputs, uint8* labels, int batchSize)
{
	double* buffer = (double*)calloc(GETCOUNT(LeNet5), sizeof(double));
	if (!buffer) return;

	int i;

	#pragma omp parallel private(i)
	{
		double* local_buffer = (double*)calloc(GETCOUNT(LeNet5), sizeof(double));
		if (!local_buffer) goto merge;

		#pragma omp for
		for (i = 0; i < batchSize; ++i)
		{
			Feature features = { 0 };
			Feature errors = { 0 };
			LeNet5  deltas = { 0 };

			// === 1. 输入归一化 + 填充 ===
			double mean = 0, std = 0;
			for (int h = 0; h < 28; ++h)
				for (int w = 0; w < 28; ++w) {
					double val = inputs[i][h][w];
					mean += val;
					std += val * val;
				}
			mean /= (28 * 28);
			std = sqrt(std / (28 * 28) - mean * mean);
			if (std < 1e-8) std = 1.0;

			// flatten + padding (C1输入 1*32*32)
			double input_flat[1 * 32 * 32] = { 0 };
			for (int h = 0; h < 28; ++h)
				for (int w = 0; w < 28; ++w)
					input_flat[0 * 32 * 32 + (h + 2) * 32 + (w + 2)] = (inputs[i][h][w] - mean) / std;

			// === 2. 权重展平 ===
			double w0_1[6 * 1 * 5 * 5] = { 0 };
			double w2_3[16 * 6 * 5 * 5] = { 0 };
			double w4_5[120 * 16 * 5 * 5] = { 0 };

			for (int o = 0; o < 6; o++) for (int c = 0; c < 1; c++) for (int kh = 0; kh < 5; kh++) for (int kw = 0; kw < 5; kw++)
				w0_1[o * 1 * 25 + c * 25 + kh * 5 + kw] = lenet->weight0_1[c][o][kh][kw];

			for (int o = 0; o < 16; o++) for (int c = 0; c < 6; c++) for (int kh = 0; kh < 5; kh++) for (int kw = 0; kw < 5; kw++)
				w2_3[o * 6 * 25 + c * 25 + kh * 5 + kw] = lenet->weight2_3[c][o][kh][kw];

			for (int o = 0; o < 120; o++) for (int c = 0; c < 16; c++) for (int kh = 0; kh < 5; kh++) for (int kw = 0; kw < 5; kw++)
				w4_5[o * 16 * 25 + c * 25 + kh * 5 + kw] = lenet->weight4_5[c][o][kh][kw];

			// === 3. ISPC 前向传播 ===
			conv_forward_ispc(6, 1, 32, 32, 5, 5, 28, 28, input_flat, (double*)features.layer1, w0_1, lenet->bias0_1);
			SUBSAMP_MAX_FORWARD(features.layer1, features.layer2);

			conv_forward_ispc(16, 6, 14, 14, 5, 5, 10, 10, (double*)features.layer2, (double*)features.layer3, w2_3, lenet->bias2_3);
			SUBSAMP_MAX_FORWARD(features.layer3, features.layer4);

			conv_forward_ispc(120, 16, 5, 5, 5, 5, 1, 1, (double*)features.layer4, (double*)features.layer5, w4_5, lenet->bias4_5);

			dot_forward_ispc(120, 10, (double*)features.layer5, features.output, (double*)lenet->weight5_6, (double*)lenet->bias5_6);

			// === 4. 反向传播 ===
			load_target(&features, &errors, labels[i]);
			backward(lenet, &deltas, &errors, &features, relugrad);

			// === 5. 累加梯度 ===
			for (int j = 0; j < GETCOUNT(LeNet5); j++)
				local_buffer[j] += ((double*)&deltas)[j];
		}

	merge:
		if (local_buffer) {
		#pragma omp critical
			for (int j = 0; j < GETCOUNT(LeNet5); j++)
				buffer[j] += local_buffer[j];
			free(local_buffer);
		}
	}

	// === 6. 更新模型 ===
	double k = ALPHA / batchSize;
	for (int i = 0; i < GETCOUNT(LeNet5); i++)
		((double*)lenet)[i] += k * buffer[i];

	free(buffer);
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
		((double *)lenet)[i] += ALPHA * ((double *)&deltas)[i];
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
	for (double *pos = (double *)lenet->weight0_1; pos < (double *)lenet->bias0_1; *pos++ = f64rand());
	for (double *pos = (double *)lenet->weight0_1; pos < (double *)lenet->weight2_3; *pos++ *= sqrt(6.0 / (LENGTH_KERNEL * LENGTH_KERNEL * (INPUT + LAYER1))));
	for (double *pos = (double *)lenet->weight2_3; pos < (double *)lenet->weight4_5; *pos++ *= sqrt(6.0 / (LENGTH_KERNEL * LENGTH_KERNEL * (LAYER2 + LAYER3))));
	for (double *pos = (double *)lenet->weight4_5; pos < (double *)lenet->weight5_6; *pos++ *= sqrt(6.0 / (LENGTH_KERNEL * LENGTH_KERNEL * (LAYER4 + LAYER5))));
	for (double *pos = (double *)lenet->weight5_6; pos < (double *)lenet->bias0_1; *pos++ *= sqrt(6.0 / (LAYER5 + OUTPUT)));
	for (int *pos = (int *)lenet->bias0_1; pos < (int *)(lenet + 1); *pos++ = 0);
}


