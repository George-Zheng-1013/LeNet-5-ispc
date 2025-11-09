/*
@author : 范文捷
@data    : 2016-04-20
@note	: 根据Yann Lecun的论文《Gradient-based Learning Applied To Document Recognition》编写
@api	:

批量训练
void TrainBatch(LeNet5 *lenet, image *inputs, const char(*resMat)[OUTPUT],uint8 *labels, int batchSize);

训练
void Train(LeNet5 *lenet, image input, const char(*resMat)[OUTPUT],uint8 label);

预测
uint8 Predict(LeNet5 *lenet, image input, const char(*resMat)[OUTPUT], uint8 count);

初始化
void Initial(LeNet5 *lenet);
*/
#ifdef __cplusplus
extern "C" {
#endif

// ISPC 卷积前向传播
void conv_forward_ispc(
    int outC, int inC,
    int inH, int inW,
    int kH, int kW,
    int outH, int outW,
    float input[],
    float output[],
    float weight[],
    float bias[]
);

// ISPC 全连接前向传播
void dot_forward_ispc(
    int inLen, int outLen,
    float input[],
    float output[],
    float weight[],
    float bias[]
);

// ISPC Max Pooling 前向传播（新增）
void maxpool_forward_ispc(
    int channels,
    int inH, int inW,
    int outH, int outW,
    int poolSize,
    float input[],
    float output[],
    int indices[]  // 记录最大值位置
);

// ISPC Max Pooling 反向传播（新增）
void maxpool_backward_ispc(
    int channels,
    int inH, int inW,
    int outH, int outW,
    float out_error[],
    float in_error[],
    int indices[]  // 使用前向传播记录的位置
);

#ifdef __cplusplus
}
#endif


#pragma once

#define LENGTH_KERNEL	5

#define LENGTH_FEATURE0	32
#define LENGTH_FEATURE1	(LENGTH_FEATURE0 - LENGTH_KERNEL + 1)
#define LENGTH_FEATURE2	(LENGTH_FEATURE1 >> 1)
#define LENGTH_FEATURE3	(LENGTH_FEATURE2 - LENGTH_KERNEL + 1)
#define	LENGTH_FEATURE4	(LENGTH_FEATURE3 >> 1)
#define LENGTH_FEATURE5	(LENGTH_FEATURE4 - LENGTH_KERNEL + 1)

#define INPUT			1
#define LAYER1			6
#define LAYER2			6
#define LAYER3			16
#define LAYER4			16
#define LAYER5			120
#define OUTPUT          10

#define ALPHA 0.5
#define PADDING 2

typedef unsigned char uint8;
typedef uint8 image[28][28];


typedef struct LeNet5
{
	float weight0_1[INPUT][LAYER1][LENGTH_KERNEL][LENGTH_KERNEL];
	float weight2_3[LAYER2][LAYER3][LENGTH_KERNEL][LENGTH_KERNEL];
	float weight4_5[LAYER4][LAYER5][LENGTH_KERNEL][LENGTH_KERNEL];
	float weight5_6[LAYER5 * LENGTH_FEATURE5 * LENGTH_FEATURE5][OUTPUT];

	float bias0_1[LAYER1];
	float bias2_3[LAYER3];
	float bias4_5[LAYER5];
	float bias5_6[OUTPUT];

}LeNet5;

typedef struct Feature
{
	float input[INPUT][LENGTH_FEATURE0][LENGTH_FEATURE0];
	float layer1[LAYER1][LENGTH_FEATURE1][LENGTH_FEATURE1];
	float layer2[LAYER2][LENGTH_FEATURE2][LENGTH_FEATURE2];
	float layer3[LAYER3][LENGTH_FEATURE3][LENGTH_FEATURE3];
	float layer4[LAYER4][LENGTH_FEATURE4][LENGTH_FEATURE4];
	float layer5[LAYER5][LENGTH_FEATURE5][LENGTH_FEATURE5];
	float output[OUTPUT];
}Feature;

// Max Pooling 索引缓冲结构（新增）
typedef struct PoolIndices
{
	int layer2[LAYER2][LENGTH_FEATURE2][LENGTH_FEATURE2];
	int layer4[LAYER4][LENGTH_FEATURE4][LENGTH_FEATURE4];
}PoolIndices;

//void TrainBatch(LeNet5 *lenet, image *inputs, uint8 *labels, int batchSize);

void Train(LeNet5 *lenet, image input, uint8 label);

uint8 Predict(LeNet5 *lenet, image input, uint8 count);

void Initial(LeNet5 *lenet);

extern float (*relu_ptr)(float);
extern float (*relugrad_ptr)(float);

float relu(float x);
float relugrad(float y);

void forward(LeNet5* lenet, Feature* features, float(*action)(float));
void backward(LeNet5* lenet, LeNet5* deltas, Feature* errors, Feature* features, float(*actiongrad)(float));
void load_target(Feature* features, Feature* errors, int label);

void TrainBatch(LeNet5* lenet, image* inputs, uint8* labels, int batchSize);
void TrainBatch_parallel(LeNet5* lenet, image* inputs, uint8* labels, int batchSize);
void TrainBatch_serial(LeNet5* lenet, image* inputs, uint8* labels, int batchSize);