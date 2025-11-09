#include "lenet.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>

#define FILE_TRAIN_IMAGE    "train-images-idx3-ubyte"
#define FILE_TRAIN_LABEL    "train-labels-idx1-ubyte"
#define FILE_TEST_IMAGE     "t10k-images-idx3-ubyte"
#define FILE_TEST_LABEL     "t10k-labels-idx1-ubyte"
#define LENET_FILE          "model.dat"
#define COUNT_TRAIN         60000
#define COUNT_TEST          10000

// 外部 ISPC 接口
extern void conv_forward_ispc(
    int outC, int inC,
    int inH, int inW,
    int kH, int kW,
    int outH, int outW,
    double input[],
    double output[],
    double weight[],
    double bias[]
);
extern void dot_forward_ispc(
    int inLen, int outLen,
    double input[],
    double output[],
    double weight[],
    double bias[]
);

// 数据读取函数
int read_data(unsigned char(*data)[28][28], unsigned char label[], const int count, const char data_file[], const char label_file[])
{
    FILE* fp_image = fopen(data_file, "rb");
    FILE* fp_label = fopen(label_file, "rb");
    if (!fp_image || !fp_label) return 1;
    fseek(fp_image, 16, SEEK_SET);
    fseek(fp_label, 8, SEEK_SET);
    fread(data, sizeof(*data) * count, 1, fp_image);
    fread(label, count, 1, fp_label);
    fclose(fp_image);
    fclose(fp_label);
    return 0;
}

// 测试函数
double testing(LeNet5* lenet, image* test_data, uint8* test_label, int total_size)
{
    int right = 0;
    for (int i = 0; i < total_size; ++i)
    {
        uint8 l = test_label[i];
        int p = Predict(lenet, test_data[i], 10);
        right += l == p;
    }
    return (double)right / total_size * 100.0;
}

// 测试串行与并行训练的时间、准确率及加速比
void run_comparison(int epochs)
{
    // ===== 分配训练和测试数据 =====
    image* train_data = (image*)calloc(COUNT_TRAIN, sizeof(image));
    uint8* train_label = (uint8*)calloc(COUNT_TRAIN, sizeof(uint8));
    image* test_data = (image*)calloc(COUNT_TEST, sizeof(image));
    uint8* test_label = (uint8*)calloc(COUNT_TEST, sizeof(uint8));

    if (read_data(train_data, train_label, COUNT_TRAIN, FILE_TRAIN_IMAGE, FILE_TRAIN_LABEL) ||
        read_data(test_data, test_label, COUNT_TEST, FILE_TEST_IMAGE, FILE_TEST_LABEL))
    {
        printf("ERROR: Dataset not found!\n");
        free(train_data); free(train_label); free(test_data); free(test_label);
        system("pause");
        return;
    }

    const int TRAIN_SUBSET = 6000;  // 适中训练量
    const int batchSize = 300;
    const int total_batches = TRAIN_SUBSET / batchSize;

    // ===== 创建两个模型并初始化（保证初始权重相同） =====
    LeNet5* lenet_serial = (LeNet5*)malloc(sizeof(LeNet5));
    LeNet5* lenet_parallel = (LeNet5*)malloc(sizeof(LeNet5));
    Initial(lenet_serial);
    Initial(lenet_parallel);

    // ===== 先单独训练串行模型 =====
    clock_t start_serial = clock();
    for (int e = 0; e < epochs; ++e)
    {
        printf("=== Epoch %d/%d (Serial) ===\n", e + 1, epochs);

        for (int b = 0; b < total_batches; ++b)
        {
            int offset = b * batchSize;
            TrainBatch(lenet_serial, train_data + offset, train_label + offset, batchSize);
        }

        double acc_serial = testing(lenet_serial, test_data, test_label, COUNT_TEST);
        printf("Serial   -> Accuracy: %.2f%%\n", acc_serial);
    }
    double time_serial = (double)(clock() - start_serial) / CLOCKS_PER_SEC;

    // ===== 再单独训练并行模型 =====
    clock_t start_parallel = clock();
    for (int e = 0; e < epochs; ++e)
    {
        printf("=== Epoch %d/%d (Parallel) ===\n", e + 1, epochs);

        for (int b = 0; b < total_batches; ++b)
        {
            int offset = b * batchSize;
            TrainBatch(lenet_parallel, train_data + offset, train_label + offset, batchSize);
        }

        double acc_parallel = testing(lenet_parallel, test_data, test_label, COUNT_TEST);
        printf("Parallel -> Accuracy: %.2f%%\n", acc_parallel);
    }
    double time_parallel = (double)(clock() - start_parallel) / CLOCKS_PER_SEC;

    // ===== 对比最终权重差异 =====
    double max_diff = 0.0;
    double* w1 = (double*)lenet_serial;
    double* w2 = (double*)lenet_parallel;
    if (w1 != NULL && w2 != NULL) {
        for (int i = 0; i < sizeof(LeNet5) / sizeof(double); i++)
        {
            double d = fabs(w1[i] - w2[i]);
            if (d > max_diff) max_diff = d;
        }
    }

    // ===== 输出最终结果 =====
    double final_acc_serial = testing(lenet_serial, test_data, test_label, COUNT_TEST);
    double final_acc_parallel = testing(lenet_parallel, test_data, test_label, COUNT_TEST);

    printf("\n===== FINAL RESULTS =====\n");
    printf("Serial   -> Accuracy: %.2f%%, Total Time: %.3fs\n", final_acc_serial, time_serial);
    printf("Parallel -> Accuracy: %.2f%%, Total Time: %.3fs\n", final_acc_parallel, time_parallel);
    printf("Speedup: %.2fx\n", time_serial / time_parallel);
    printf("Max weight difference: %.2e\n", max_diff);

    // ===== 释放内存 =====
    free(lenet_serial);
    free(lenet_parallel);
    free(train_data); free(train_label);
    free(test_data); free(test_label);

    printf("\nPress any key to exit...\n");
    system("pause");
}




int main()
{
    run_comparison(5);// 训练 ? 个 epoch
    return 0;
}
