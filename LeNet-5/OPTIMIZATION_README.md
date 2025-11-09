# ISPC 优化说明

## 优化内容

本次优化针对 `lenet.ispc` 文件进行了以下改进：

### 1. **无分支 ReLU**
- 将 `x > 0 ? x : 0` 改为 `max(x, 0.0)`
- 消除条件分支，使用 SIMD 友好的 max 指令

### 2. **优化向量化策略**
- **前向卷积**: 只对输出宽度 `w` 向量化（连续内存访问）
- **全连接**: 向量化输出维度 `y`
- 避免多维度同时向量化导致的 varying 整数运算开销

### 3. **减少 Varying 整数运算**
- 预计算所有 `uniform` stride:
  - `stride_inHW = inH * inW`
  - `stride_kHW = kH * kW`
  - `stride_inC_weight = inC * kH * kW`
- 使用 uniform 指针偏移替代 varying 索引计算

### 4. **循环展开**
- 对小核循环（kH, kW）使用 `#pragma unroll`
- 减少循环开销，提高指令级并行

### 5. **边界检查优化**
- 将 uniform 层的边界检查提升到外层
- 内层使用掩码（valid mask）替代分支

### 6. **反向传播优化**
- 使用 `reduce_add` 聚合向量化结果
- 改进内存访问模式，减少 gather/scatter 操作

## 编译命令

### 推荐编译选项（高性能）

```bash
# 1. 编译 ISPC 代码（AVX2）
ispc lenet.ispc -o lenet.ispc.o -h lenet.ispc.h \
  --target=avx2-i32x8 \
  -O3 \
  --opt=fast-math \
  --opt=fast-masked-vload

# 2. 编译 C 代码
gcc -O3 -march=native -ffast-math \
  main.c lenet.c lenet.ispc.o \
  -o LeNet5_optimized.exe -lm
```

### AVX-512 版本（如果硬件支持）

```bash
# 1. 编译 ISPC 代码（AVX-512）
ispc lenet.ispc -o lenet.ispc.o -h lenet.ispc.h \
  --target=avx512skx-i32x16 \
  -O3 \
  --opt=fast-math \
  --opt=fast-masked-vload

# 2. 编译 C 代码
gcc -O3 -march=native -ffast-math \
  main.c lenet.c lenet.ispc.o \
  -o LeNet5_avx512.exe -lm
```

## 性能优化选项说明

### ISPC 编译选项

- `--target=avx2-i32x8`: 
  - 使用 AVX2 指令集，8-wide 向量
  - 适用于大多数现代 CPU（2013年后）

- `--target=avx512skx-i32x16`:
  - 使用 AVX-512 指令集，16-wide 向量
  - 需要 Skylake-X 或更新的 CPU

- `-O3`: 最高优化级别

- `--opt=fast-math`: 
  - 启用快速数学优化
  - 允许重新排列浮点运算

- `--opt=fast-masked-vload`:
  - 优化掩码向量加载
  - 减少条件分支开销

### GCC 编译选项

- `-O3`: 最高优化级别
- `-march=native`: 针对当前 CPU 优化
- `-ffast-math`: 快速数学运算（与 ISPC 保持一致）

## 预期性能提升

根据优化内容，预期性能提升：

| 优化项 | 预期加速比 |
|--------|-----------|
| 无分支 ReLU | 1.1-1.2x |
| 向量化策略优化 | 1.3-1.5x |
| 减少 varying 运算 | 1.2-1.3x |
| 循环展开 | 1.1-1.15x |
| **综合加速** | **1.8-2.5x** |

实际性能提升取决于：
- CPU 架构（AVX2 vs AVX-512）
- 内存带宽
- 数据尺寸
- 编译器版本

## 验证优化效果

运行以下命令对比性能：

```bash
# 原始版本
./LeNet5.exe

# 优化版本
./LeNet5_optimized.exe
```

查看输出中的 `Speedup` 值，应该看到明显提升。

## 进一步优化建议

如果需要更高性能，可以考虑：

1. **数据布局转换**: 将 NCHW 改为 NHWC（某些操作更友好）
2. **分块处理**: 对大张量进行 cache-friendly 分块
3. **任务并行**: 使用 ISPC 的 `launch` 关键字进行多核并行
4. **混合精度**: 如果精度允许，使用 float 替代 double

## 注意事项

1. **数值精度**: fast-math 可能影响数值精度，如果精度要求高，移除该选项
2. **编译时间**: 高级优化会增加编译时间
3. **兼容性**: AVX-512 版本只能在支持的 CPU 上运行

## 故障排除

### 如果遇到编译错误

1. 检查 ISPC 版本（建议 1.16+）
2. 确认 GCC 版本（建议 7.0+）
3. 移除 `--opt=fast-masked-vload` 选项（某些旧版本不支持）

### 如果性能没有提升

1. 确认使用了 `-O3 -march=native`
2. 检查是否使用了正确的 ISPC target
3. 使用 `perf stat` 或 VTune 分析瓶颈

## 更新日志

- 2024-01: 初始优化版本
  - 无分支 ReLU
  - 优化向量化策略
  - 减少 varying 运算
  - 循环展开
