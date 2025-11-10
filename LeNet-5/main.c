//main.c
#include "lenet.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "lenet.ispc.h"  // ISPC 头文件
#include <string.h>
#include <omp.h>

#define FILE_TRAIN_IMAGE		"train-images-idx3-ubyte"
#define FILE_TRAIN_LABEL		"train-labels-idx1-ubyte"
#define FILE_TEST_IMAGE		"t10k-images-idx3-ubyte"
#define FILE_TEST_LABEL		"t10k-labels-idx1-ubyte"
#define LENET_FILE 		"model.dat"
#define COUNT_TRAIN		60000
#define COUNT_TEST		10000


int read_data(unsigned char(*data)[28][28], unsigned char label[], const int count, const char data_file[], const char label_file[])
{
    FILE *fp_image = fopen(data_file, "rb");
    FILE *fp_label = fopen(label_file, "rb");
    if (!fp_image||!fp_label) return 1;
	fseek(fp_image, 16, SEEK_SET);
	fseek(fp_label, 8, SEEK_SET);
	fread(data, sizeof(*data)*count, 1, fp_image);
	fread(label,count, 1, fp_label);
	fclose(fp_image);
	fclose(fp_label);
	return 0;
}

double testing(LeNet5 *lenet, image *test_data, uint8 *test_label,int total_size)
{
	int right = 0, percent = 0;
	for (int i = 0; i < total_size; ++i)
	{
		uint8 l = test_label[i];
		int p = Predict(lenet, test_data[i], 10);
		right += l == p;
		if (i * 100 / total_size > percent)
			printf("test:%2d%%\n", percent = i * 100 / total_size);
	}
	return (double)right / total_size * 100.0;
}

int save(LeNet5 *lenet, char filename[])
{
	FILE *fp = fopen(filename, "wb");
	if (!fp) return 1;
	fwrite(lenet, sizeof(LeNet5), 1, fp);
	fclose(fp);
	return 0;
}

int load(LeNet5 *lenet, char filename[])
{
	FILE *fp = fopen(filename, "rb");
	if (!fp) return 1;
	fread(lenet, sizeof(LeNet5), 1, fp);
	fclose(fp);
	return 0;
}



void foo()
{
    image* train_data = (image*)calloc(COUNT_TRAIN, sizeof(image));
    uint8* train_label = (uint8*)calloc(COUNT_TRAIN, sizeof(uint8));
    image* test_data = (image*)calloc(COUNT_TEST, sizeof(image));
    uint8* test_label = (uint8*)calloc(COUNT_TEST, sizeof(uint8));

    if (read_data(train_data, train_label, COUNT_TRAIN, FILE_TRAIN_IMAGE, FILE_TRAIN_LABEL))
    {
        printf("ERROR!!! Dataset File Not Find!\n");
        system("pause");
        return;
    }
    if (read_data(test_data, test_label, COUNT_TEST, FILE_TEST_IMAGE, FILE_TEST_LABEL))
    {
        printf("ERROR!!! Dataset File Not Find!\n");
        system("pause");
        return;
    }

    LeNet5* lenet_serial = (LeNet5*)malloc(sizeof(LeNet5));
    LeNet5* lenet_parallel = (LeNet5*)malloc(sizeof(LeNet5));

    // ===== 强制每次都重新初始化！避免 load 旧模型 =====
    Initial(lenet_serial);
    memcpy(lenet_parallel, lenet_serial, sizeof(LeNet5));

    // 可选：删除旧模型文件，防止干扰
    remove(LENET_FILE);

    int batches[] = { 300 };

    // ==================== 串行训练（纯串行，无OpenMP）================
    printf("=== Serial Training ===\n");
    clock_t start_s = clock();
    for (int i = 0; i < sizeof(batches) / sizeof(*batches); ++i)
    {
        int batch_size = batches[i];
        int percent = 0;
        for (int b = 0; b < COUNT_TRAIN; b += batch_size)
        {
            int actual_batch = (b + batch_size <= COUNT_TRAIN) ? batch_size : (COUNT_TRAIN - b);
            TrainBatch(lenet_serial, train_data + b, train_label + b, actual_batch);
            int current_percent = (b + actual_batch) * 100 / COUNT_TRAIN;
            if (current_percent > percent)
            {
                printf("batchsize:%d train:%2d%%\n", batch_size, current_percent);
                percent = current_percent;
            }
        }
    }
    double acc_s = testing(lenet_serial, test_data, test_label, COUNT_TEST);
    clock_t end_s = clock();
    double elapsed_s = (double)(end_s - start_s) / CLOCKS_PER_SEC;
    printf("Serial  Accuracy: %.2f%%\n", acc_s);
    printf("Serial  Time: %.3f s\n", elapsed_s);

    // ==================== ISPC并行训练 ====================
    printf("\n=== ISPC Parallel Training ===\n");
    clock_t start_p = clock();
    for (int i = 0; i < sizeof(batches) / sizeof(*batches); ++i)
    {
        int batch_size = batches[i];
        int percent = 0;
        for (int b = 0; b < COUNT_TRAIN; b += batch_size)
        {
            int actual_batch = (b + batch_size <= COUNT_TRAIN) ? batch_size : (COUNT_TRAIN - b);
            TrainBatch_parallel(lenet_parallel, train_data + b, train_label + b, actual_batch);

            int current_percent = (b + actual_batch) * 100 / COUNT_TRAIN;
            if (current_percent > percent)
            {
                printf("batchsize:%d train:%2d%%\n", batch_size, current_percent);
                percent = current_percent;
            }
        }
    }
    double acc_p = testing(lenet_parallel, test_data, test_label, COUNT_TEST);
    clock_t end_p = clock();
    double elapsed_p = (double)(end_p - start_p) / CLOCKS_PER_SEC;
    printf("ISPC  Accuracy: %.2f%%\n", acc_p);
    printf("ISPC  Time: %.3f s\n", elapsed_p);
    printf("Speedup: %.2fx\n", elapsed_s / elapsed_p);

    printf("\n================= SUMMARY =================\n");
    printf("Serial  Accuracy : %.5f%%\n", acc_s);
    printf("Serial  Time     : %.3f s\n", elapsed_s);
    printf("-------------------------------------------\n");
    printf("ISPC    Accuracy : %.5f%%\n", acc_p);
    printf("ISPC    Time     : %.3f s\n", elapsed_p);
    printf("-------------------------------------------\n");
    printf("Speedup (S/P)    : %.2fx\n", elapsed_s / elapsed_p);
    printf("===========================================\n\n");

    // 保存并行模型（用于调试，不影响下次运行）
    save(lenet_parallel, LENET_FILE);

    // 可选：验证两个模型是否一致（应略有不同）
    int diff = memcmp(lenet_serial, lenet_parallel, sizeof(LeNet5));
    printf("Models identical: %s\n", diff ? "NO" : "YES");

    // 释放内存
    free(lenet_serial);
    free(lenet_parallel);
    free(train_data);
    free(train_label);
    free(test_data);
    free(test_label);

    system("pause");
}

int main()
{
    // 设置 OpenMP 线程数（根据 CPU 核心数调整）
    omp_set_num_threads(8);
    
	foo();
	return 0;
}