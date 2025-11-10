//main.c
#include "lenet.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "lenet.ispc.h"
#include <string.h>
#include <omp.h>

// ==================== 常量定义 ====================
#define FILE_TRAIN_IMAGE    "train-images-idx3-ubyte"
#define FILE_TRAIN_LABEL    "train-labels-idx1-ubyte"
#define FILE_TEST_IMAGE     "t10k-images-idx3-ubyte"
#define FILE_TEST_LABEL     "t10k-labels-idx1-ubyte"
#define COUNT_TRAIN         60000
#define COUNT_TEST          10000

// ==================== 数据加载 ====================
int read_data(unsigned char(*data)[28][28], unsigned char label[], const int count, 
              const char data_file[], const char label_file[])
{
    FILE *fp_image = fopen(data_file, "rb");
    FILE *fp_label = fopen(label_file, "rb");
    
    if (!fp_image || !fp_label) {
        if (fp_image) fclose(fp_image);
        if (fp_label) fclose(fp_label);
        return 1;
    }
    
    fseek(fp_image, 16, SEEK_SET);
    fseek(fp_label, 8, SEEK_SET);
    fread(data, sizeof(*data) * count, 1, fp_image);
    fread(label, count, 1, fp_label);
    fclose(fp_image);
    fclose(fp_label);
    
    return 0;
}

// ==================== 测试评估 ====================
double test_accuracy(LeNet5 *lenet, image *test_data, uint8 *test_label, int total_size)
{
    int right = 0, percent = 0;
    
    for (int i = 0; i < total_size; ++i)
    {
        uint8 label = test_label[i];
        int prediction = Predict(lenet, test_data[i], 10);
        right += (label == prediction);
        
        int current_percent = i * 100 / total_size;
        if (current_percent > percent)
        {
            printf("test:%2d%%\n", percent = current_percent);
        }
    }
    
    return (double)right / total_size * 100.0;
}

// ==================== 主训练流程 ====================
void run_training_comparison()
{
    // 数据分配
    image* train_data = (image*)calloc(COUNT_TRAIN, sizeof(image));
    uint8* train_label = (uint8*)calloc(COUNT_TRAIN, sizeof(uint8));
    image* test_data = (image*)calloc(COUNT_TEST, sizeof(image));
    uint8* test_label = (uint8*)calloc(COUNT_TEST, sizeof(uint8));

    // 加载数据
    if (read_data(train_data, train_label, COUNT_TRAIN, FILE_TRAIN_IMAGE, FILE_TRAIN_LABEL))
    {
        printf("ERROR: Training dataset not found!\n");
        free(train_data);
        free(train_label);
        free(test_data);
        free(test_label);
        return;
    }
    
    if (read_data(test_data, test_label, COUNT_TEST, FILE_TEST_IMAGE, FILE_TEST_LABEL))
    {
        printf("ERROR: Test dataset not found!\n");
        free(train_data);
        free(train_label);
        free(test_data);
        free(test_label);
        return;
    }

    // 分配模型
    LeNet5* lenet_serial = (LeNet5*)malloc(sizeof(LeNet5));
    LeNet5* lenet_parallel = (LeNet5*)malloc(sizeof(LeNet5));

    // 初始化模型
    Initial(lenet_serial);
    memcpy(lenet_parallel, lenet_serial, sizeof(LeNet5));

    int batch_size = 300;

    // ==================== 串行训练 ====================
    printf("\n=== Serial Training (Pure C) ===\n");
    clock_t start_serial = clock();
    
    int percent = 0;
    for (int b = 0; b < COUNT_TRAIN; b += batch_size)
    {
        int actual_batch = (b + batch_size <= COUNT_TRAIN) ? batch_size : (COUNT_TRAIN - b);
        TrainBatch(lenet_serial, train_data + b, train_label + b, actual_batch);
        
        int current_percent = (b + actual_batch) * 100 / COUNT_TRAIN;
        if (current_percent > percent)
        {
            printf("batch_size:%d train:%2d%%\n", batch_size, current_percent);
            percent = current_percent;
        }
    }
    
    double accuracy_serial = test_accuracy(lenet_serial, test_data, test_label, COUNT_TEST);
    clock_t end_serial = clock();
    double time_serial = (double)(end_serial - start_serial) / CLOCKS_PER_SEC;
    
    printf("Serial Accuracy: %.2f%%\n", accuracy_serial);
    printf("Serial Time: %.3f s\n", time_serial);

    // ==================== ISPC并行训练 ====================
    printf("\n=== ISPC Parallel Training ===\n");
    clock_t start_parallel = clock();
    
    percent = 0;
    for (int b = 0; b < COUNT_TRAIN; b += batch_size)
    {
        int actual_batch = (b + batch_size <= COUNT_TRAIN) ? batch_size : (COUNT_TRAIN - b);
        TrainBatch_parallel(lenet_parallel, train_data + b, train_label + b, actual_batch);

        int current_percent = (b + actual_batch) * 100 / COUNT_TRAIN;
        if (current_percent > percent)
        {
            printf("batch_size:%d train:%2d%%\n", batch_size, current_percent);
            percent = current_percent;
        }
    }
    
    double accuracy_parallel = test_accuracy(lenet_parallel, test_data, test_label, COUNT_TEST);
    clock_t end_parallel = clock();
    double time_parallel = (double)(end_parallel - start_parallel) / CLOCKS_PER_SEC;
    
    printf("ISPC Accuracy: %.2f%%\n", accuracy_parallel);
    printf("ISPC Time: %.3f s\n", time_parallel);

    // ==================== 结果对比 ====================
    printf("\n================= PERFORMANCE SUMMARY =================\n");
    printf("Serial Implementation:\n");
    printf("  Accuracy: %.5f%%\n", accuracy_serial);
    printf("  Time:     %.3f s\n", time_serial);
    printf("-------------------------------------------------------\n");
    printf("ISPC Parallel Implementation:\n");
    printf("  Accuracy: %.5f%%\n", accuracy_parallel);
    printf("  Time:     %.3f s\n", time_parallel);
    printf("-------------------------------------------------------\n");
    printf("Speedup (Serial/Parallel): %.2fx\n", time_serial / time_parallel);
    printf("=======================================================\n\n");

    // 验证模型差异
    int models_identical = (memcmp(lenet_serial, lenet_parallel, sizeof(LeNet5)) == 0);
    printf("Models identical: %s\n", models_identical ? "YES" : "NO");

    // 释放内存
    free(lenet_serial);
    free(lenet_parallel);
    free(train_data);
    free(train_label);
    free(test_data);
    free(test_label);
}

// ==================== 主函数 ====================
int main()
{
    // 设置 OpenMP 线程数
    omp_set_num_threads(8);
    
    run_training_comparison();
    
    system("pause");
    return 0;
}