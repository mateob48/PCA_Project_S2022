//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// expectation.cu
//
// Code generation for function 'expectation'
//

// Include files
#include "expectation.h"
#include "expectation_data.h"
#include "expectation_emxutil.h"
#include "expectation_types.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include <cstring>

// Variable Definitions
static emlrtRTEInfo emlrtRTEI{
    3,             // lineNo
    5,             // colNo
    "expectation", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\expectation.m" // pName
};

static emlrtRTEInfo b_emlrtRTEI{
    13,            // lineNo
    5,             // colNo
    "expectation", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\expectation.m" // pName
};

static emlrtRTEInfo c_emlrtRTEI{
    170,                     // lineNo
    24,                      // colNo
    "combineVectorElements", // fName
    "C:\\Program "
    "Files\\MATLAB\\R2022a\\toolbox\\eml\\lib\\matlab\\datafun\\private\\combin"
    "eVectorElements.m" // pName
};

static emlrtRTEInfo d_emlrtRTEI{
    10,            // lineNo
    9,             // colNo
    "expectation", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\expectation.m" // pName
};

static emlrtRTEInfo e_emlrtRTEI{
    11,            // lineNo
    19,            // colNo
    "expectation", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\expectation.m" // pName
};

// Function Declarations
static __global__ void expectation_kernel1(real_T T, real_T N,
                                           emxArray_real_T Xi);

static __global__ void expectation_kernel2(
    const real_T beta[40000], const real_T B[40000], const real_T trans[16],
    const real_T alpha[40000], const int32_T t, const real_T N, int32_T xoffset,
    const int32_T Xi_dim0, const int32_T Xi_dim1, emxArray_real_T Xi);

static __global__ void
expectation_kernel3(const emxArray_real_T Xi, const int32_T t, const int32_T k,
                    int32_T vstride, const int32_T a_dim1,
                    const int32_T Xi_dim0, const int32_T Xi_dim1,
                    emxArray_real_T a);

static __global__ void expectation_kernel4(const emxArray_real_T Xi,
                                           const int32_T t, real_T *y);

static __global__ void
expectation_kernel5(const real_T *y, const emxArray_real_T Xi, const int32_T t,
                    const int32_T k, int32_T vstride, const int32_T Xi_dim1,
                    const int32_T Xi_dim0, const int32_T b_Xi_dim1,
                    emxArray_real_T b_Xi);

static __global__ void expectation_kernel6(const emxArray_real_T Xi,
                                           const int32_T t, const int32_T b_Xi,
                                           int32_T c_Xi, const int32_T Xi_dim0,
                                           const int32_T Xi_dim1,
                                           const int32_T b_Xi_dim1,
                                           emxArray_real_T d_Xi);

static __global__ void expectation_kernel7(const emxArray_real_T Xi,
                                           int32_T vstride,
                                           emxArray_real_T Gamma);

static __global__ void expectation_kernel8(const emxArray_real_T Xi,
                                           const int32_T xoffset,
                                           int32_T vstride,
                                           emxArray_real_T Gamma);

static __global__ void expectation_kernel9(int32_T sz, emxArray_real_T Gamma);

static void gpuEmxEnsureCapacity_real_T(const emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

static void gpuEmxFree_real_T(emxArray_real_T *gpu);

static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu);

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

static void gpuEmxReset_real_T(emxArray_real_T *gpu);

// Function Definitions
static __global__
    __launch_bounds__(1024, 1) void expectation_kernel1(real_T T, real_T N,
                                                        emxArray_real_T Xi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(static_cast<int32_T>(T - 1.0) *
                                      static_cast<int32_T>(N) *
                                      static_cast<int32_T>(N) -
                                  1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    Xi.data[j] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void expectation_kernel2(
    const real_T beta[40000], const real_T B[40000], const real_T trans[16],
    const real_T alpha[40000], const int32_T t, const real_T N, int32_T xoffset,
    const int32_T Xi_dim0, const int32_T Xi_dim1, emxArray_real_T Xi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(static_cast<int32_T>(N) - 1) + 1ULL) *
                (static_cast<uint64_T>(xoffset) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T j;
    j = static_cast<int32_T>(
        idx % (static_cast<uint64_T>(static_cast<int32_T>(N) - 1) + 1ULL));
    i = static_cast<int32_T>(
        (idx - static_cast<uint64_T>(j)) /
        (static_cast<uint64_T>(static_cast<int32_T>(N) - 1) + 1ULL));
    Xi.data[(t + Xi_dim0 * i) + Xi_dim0 * Xi_dim1 * j] =
        alpha[t + 10000 * i] * trans[i + (j << 2)] * B[(t + 10000 * j) + 1] *
        beta[(t + 10000 * j) + 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void expectation_kernel3(
    const emxArray_real_T Xi, const int32_T t, const int32_T k, int32_T vstride,
    const int32_T a_dim1, const int32_T Xi_dim0, const int32_T Xi_dim1,
    emxArray_real_T a)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(k) + 1ULL) *
                (static_cast<uint64_T>(vstride) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T j;
    i = static_cast<int32_T>(idx % (static_cast<uint64_T>(k) + 1ULL));
    j = static_cast<int32_T>((idx - static_cast<uint64_T>(i)) /
                             (static_cast<uint64_T>(k) + 1ULL));
    a.data[i + a_dim1 * j] = Xi.data[(t + Xi_dim0 * i) + Xi_dim0 * Xi_dim1 * j];
  }
}

static __global__ __launch_bounds__(32, 1) void expectation_kernel4(
    const emxArray_real_T Xi, const int32_T t, real_T *y)
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    *y = Xi.data[t];
  }
}

static __global__ __launch_bounds__(1024, 1) void expectation_kernel5(
    const real_T *y, const emxArray_real_T Xi, const int32_T t, const int32_T k,
    int32_T vstride, const int32_T Xi_dim1, const int32_T Xi_dim0,
    const int32_T b_Xi_dim1, emxArray_real_T b_Xi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(k) + 1ULL) *
                (static_cast<uint64_T>(vstride) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T j;
    i = static_cast<int32_T>(idx % (static_cast<uint64_T>(k) + 1ULL));
    j = static_cast<int32_T>((idx - static_cast<uint64_T>(i)) /
                             (static_cast<uint64_T>(k) + 1ULL));
    b_Xi.data[i + Xi_dim1 * j] =
        Xi.data[(t + Xi_dim0 * i) + Xi_dim0 * b_Xi_dim1 * j] / *y;
  }
}

static __global__ __launch_bounds__(1024, 1) void expectation_kernel6(
    const emxArray_real_T Xi, const int32_T t, const int32_T b_Xi, int32_T c_Xi,
    const int32_T Xi_dim0, const int32_T Xi_dim1, const int32_T b_Xi_dim1,
    emxArray_real_T d_Xi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(b_Xi) + 1ULL) *
                (static_cast<uint64_T>(c_Xi) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T j;
    i = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_Xi) + 1ULL));
    j = static_cast<int32_T>((idx - static_cast<uint64_T>(i)) /
                             (static_cast<uint64_T>(b_Xi) + 1ULL));
    d_Xi.data[(t + Xi_dim0 * i) + Xi_dim0 * Xi_dim1 * j] =
        Xi.data[i + b_Xi_dim1 * j];
  }
}

static __global__ __launch_bounds__(1024, 1) void expectation_kernel7(
    const emxArray_real_T Xi, int32_T vstride, emxArray_real_T Gamma)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(vstride);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    Gamma.data[j] = Xi.data[j];
  }
}

static __global__ __launch_bounds__(1024, 1) void expectation_kernel8(
    const emxArray_real_T Xi, const int32_T xoffset, int32_T vstride,
    emxArray_real_T Gamma)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(vstride);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    Gamma.data[j] += Xi.data[xoffset + j];
  }
}

static __global__
    __launch_bounds__(1024, 1) void expectation_kernel9(int32_T sz,
                                                        emxArray_real_T Gamma)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(sz);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    Gamma.data[j] = 0.0;
  }
}

static void gpuEmxEnsureCapacity_real_T(const emxArray_real_T *cpu,
                                        emxArray_real_T *gpu)
{
  real_T *newData;
  if (gpu->data == 0) {
    newData = 0ULL;
    cudaMalloc(&newData, cpu->allocatedSize * sizeof(real_T));
    gpu->numDimensions = cpu->numDimensions;
    gpu->size = static_cast<int32_T *>(emlrtCallocMex(
        static_cast<uint32_T>(gpu->numDimensions), sizeof(int32_T)));
    for (int32_T i{0}; i < cpu->numDimensions; i++) {
      gpu->size[i] = cpu->size[i];
    }
    gpu->allocatedSize = cpu->allocatedSize;
    gpu->canFreeData = true;
    gpu->data = newData;
  } else {
    int32_T actualSizeCpu;
    int32_T actualSizeGpu;
    actualSizeCpu = 1;
    actualSizeGpu = 1;
    for (int32_T i{0}; i < cpu->numDimensions; i++) {
      actualSizeGpu *= gpu->size[i];
      actualSizeCpu *= cpu->size[i];
      gpu->size[i] = cpu->size[i];
    }
    if (gpu->allocatedSize < actualSizeCpu) {
      newData = 0ULL;
      cudaMalloc(&newData, cpu->allocatedSize * sizeof(real_T));
      cudaMemcpy(newData, gpu->data, actualSizeGpu * sizeof(real_T),
                 cudaMemcpyDeviceToDevice);
      gpu->allocatedSize = cpu->allocatedSize;
      if (gpu->canFreeData) {
        cudaFree(gpu->data);
      }
      gpu->canFreeData = true;
      gpu->data = newData;
    }
  }
}

static void gpuEmxFree_real_T(emxArray_real_T *gpu)
{
  if (gpu->data != (void *)4207599121ULL) {
    cudaFree(gpu->data);
  }
  emlrtFreeMex(gpu->size);
}

static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu)
{
  int32_T actualSize;
  int32_T i;
  if (gpu->numDimensions < cpu->numDimensions) {
    gpu->numDimensions = cpu->numDimensions;
    emlrtFreeMex(gpu->size);
    gpu->size = static_cast<int32_T *>(emlrtCallocMex(
        static_cast<uint32_T>(gpu->numDimensions), sizeof(int32_T)));
  } else {
    gpu->numDimensions = cpu->numDimensions;
  }
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
    gpu->size[i] = cpu->size[i];
  }
  if (gpu->allocatedSize < actualSize) {
    if (gpu->canFreeData) {
      cudaFree(gpu->data);
    }
    i = cpu->allocatedSize;
    if (i < actualSize) {
      i = actualSize;
    }
    gpu->allocatedSize = i;
    gpu->canFreeData = true;
    cudaMalloc(&gpu->data, gpu->allocatedSize * sizeof(real_T));
  }
  cudaMemcpy(gpu->data, cpu->data, actualSize * sizeof(real_T),
             cudaMemcpyHostToDevice);
}

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu)
{
  int32_T actualSize;
  actualSize = 1;
  for (int32_T i{0}; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }
  cudaMemcpy(cpu->data, gpu->data, actualSize * sizeof(real_T),
             cudaMemcpyDeviceToHost);
}

static void gpuEmxReset_real_T(emxArray_real_T *gpu)
{
  std::memset(gpu, 0, sizeof(emxArray_real_T));
}

void expectation(const real_T alpha[40000], const real_T trans[16],
                 const real_T B[40000], const real_T beta[40000], real_T T,
                 real_T N, emxArray_real_T *Xi, emxArray_real_T *Gamma)
{
  dim3 block;
  dim3 grid;
  emxArray_real_T b_gpu_Xi;
  emxArray_real_T gpu_Gamma;
  emxArray_real_T gpu_Xi;
  emxArray_real_T gpu_a;
  emxArray_real_T *a;
  emxArray_real_T *b_Xi;
  real_T(*gpu_B)[40000];
  real_T(*gpu_alpha)[40000];
  real_T(*gpu_beta)[40000];
  real_T(*gpu_trans)[16];
  real_T y;
  real_T *gpu_y;
  int32_T b_Xi_dim1;
  int32_T i;
  int32_T k;
  int32_T vstride;
  int32_T xoffset;
  boolean_T B_dirtyOnCpu;
  boolean_T Gamma_dirtyOnCpu;
  boolean_T Gamma_dirtyOnGpu;
  boolean_T Xi_dirtyOnCpu;
  boolean_T Xi_dirtyOnGpu;
  boolean_T a_dirtyOnGpu;
  boolean_T alpha_dirtyOnCpu;
  boolean_T beta_dirtyOnCpu;
  boolean_T trans_dirtyOnCpu;
  boolean_T validLaunchParams;
  boolean_T y_dirtyOnCpu;
  gpuEmxReset_real_T(&b_gpu_Xi);
  cudaMalloc(&gpu_y, 8ULL);
  gpuEmxReset_real_T(&gpu_a);
  gpuEmxReset_real_T(&gpu_Gamma);
  cudaMalloc(&gpu_alpha, 320000ULL);
  cudaMalloc(&gpu_trans, 128ULL);
  cudaMalloc(&gpu_B, 320000ULL);
  cudaMalloc(&gpu_beta, 320000ULL);
  gpuEmxReset_real_T(&gpu_Xi);
  a_dirtyOnGpu = false;
  y_dirtyOnCpu = false;
  Gamma_dirtyOnGpu = false;
  Gamma_dirtyOnCpu = true;
  alpha_dirtyOnCpu = true;
  trans_dirtyOnCpu = true;
  B_dirtyOnCpu = true;
  beta_dirtyOnCpu = true;
  Xi_dirtyOnGpu = false;
  Xi_dirtyOnCpu = true;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  k = Xi->size[0] * Xi->size[1] * Xi->size[2];
  Xi->size[0] = static_cast<int32_T>(T - 1.0);
  Xi->size[1] = static_cast<int32_T>(N);
  Xi->size[2] = static_cast<int32_T>(N);
  emxEnsureCapacity_real_T(Xi, k, &emlrtRTEI);
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<real_T>(
          (static_cast<int32_T>(T - 1.0) * static_cast<int32_T>(N) *
               static_cast<int32_T>(N) -
           1) +
          1LL),
      &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
    expectation_kernel1<<<grid, block>>>(T, N, gpu_Xi);
    Xi_dirtyOnCpu = false;
    Xi_dirtyOnGpu = true;
  }
  i = static_cast<int32_T>(T - 1.0);
  emxInit_real_T(&a, 3, &d_emlrtRTEI, true);
  emxInit_real_T(&b_Xi, 3, &e_emlrtRTEI, true);
  for (int32_T t{0}; t < i; t++) {
    int32_T Xi_dim0;
    int32_T Xi_dim1;
    Xi_dim0 = Xi->size[0];
    Xi_dim1 = Xi->size[1];
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>(((static_cast<int32_T>(N) - 1) + 1LL) *
                            ((static_cast<int32_T>(N) - 1) + 1LL)),
        &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (beta_dirtyOnCpu) {
        cudaMemcpy(*gpu_beta, beta, 320000ULL, cudaMemcpyHostToDevice);
      }
      beta_dirtyOnCpu = false;
      if (B_dirtyOnCpu) {
        cudaMemcpy(*gpu_B, B, 320000ULL, cudaMemcpyHostToDevice);
      }
      B_dirtyOnCpu = false;
      if (trans_dirtyOnCpu) {
        cudaMemcpy(*gpu_trans, trans, 128ULL, cudaMemcpyHostToDevice);
      }
      trans_dirtyOnCpu = false;
      if (alpha_dirtyOnCpu) {
        cudaMemcpy(*gpu_alpha, alpha, 320000ULL, cudaMemcpyHostToDevice);
      }
      alpha_dirtyOnCpu = false;
      if (Xi_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
      }
      expectation_kernel2<<<grid, block>>>(
          *gpu_beta, *gpu_B, *gpu_trans, *gpu_alpha, t, N,
          static_cast<int32_T>(N) - 1, Xi_dim0, Xi_dim1, gpu_Xi);
      Xi_dirtyOnCpu = false;
      Xi_dirtyOnGpu = true;
    }
    k = Xi->size[1] - 1;
    vstride = Xi->size[2] - 1;
    xoffset = a->size[0] * a->size[1] * a->size[2];
    a->size[0] = 1;
    a->size[1] = Xi->size[1];
    a->size[2] = Xi->size[2];
    emxEnsureCapacity_real_T(a, xoffset, &d_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(a, &gpu_a);
    xoffset = a->size[1];
    Xi_dim0 = Xi->size[0];
    Xi_dim1 = Xi->size[1];
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((k + 1LL) * (vstride + 1LL)), &grid, &block, 1024U,
        65535U);
    if (validLaunchParams) {
      if (Xi_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
      }
      Xi_dirtyOnCpu = false;
      expectation_kernel3<<<grid, block>>>(gpu_Xi, t, k, vstride, xoffset,
                                           Xi_dim0, Xi_dim1, gpu_a);
      a_dirtyOnGpu = true;
    }
    xoffset = Xi->size[1] * Xi->size[2];
    if (Xi->size[1] * Xi->size[2] == 0) {
      y = 0.0;
      y_dirtyOnCpu = true;
    } else {
      if (Xi_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
      }
      Xi_dirtyOnCpu = false;
      if (y_dirtyOnCpu) {
        cudaMemcpy(gpu_y, &y, 8ULL, cudaMemcpyHostToDevice);
      }
      expectation_kernel4<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_Xi, t,
                                                                   gpu_y);
      y_dirtyOnCpu = false;
      validLaunchParams = true;
      for (k = 0; k <= xoffset - 2; k++) {
        if (validLaunchParams) {
          cudaMemcpy(&y, gpu_y, 8ULL, cudaMemcpyDeviceToHost);
        }
        if (a_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(a, &gpu_a);
        }
        a_dirtyOnGpu = false;
        y += a->data[k + 1];
        validLaunchParams = false;
        y_dirtyOnCpu = true;
      }
    }
    k = Xi->size[1] - 1;
    vstride = Xi->size[2] - 1;
    xoffset = b_Xi->size[0] * b_Xi->size[1] * b_Xi->size[2];
    b_Xi->size[0] = 1;
    b_Xi->size[1] = Xi->size[1];
    b_Xi->size[2] = Xi->size[2];
    emxEnsureCapacity_real_T(b_Xi, xoffset, &e_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(b_Xi, &b_gpu_Xi);
    Xi_dim1 = b_Xi->size[1];
    Xi_dim0 = Xi->size[0];
    b_Xi_dim1 = Xi->size[1];
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((k + 1LL) * (vstride + 1LL)), &grid, &block, 1024U,
        65535U);
    if (validLaunchParams) {
      if (y_dirtyOnCpu) {
        cudaMemcpy(gpu_y, &y, 8ULL, cudaMemcpyHostToDevice);
      }
      y_dirtyOnCpu = false;
      if (Xi_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
      }
      Xi_dirtyOnCpu = false;
      expectation_kernel5<<<grid, block>>>(
          gpu_y, gpu_Xi, t, k, vstride, Xi_dim1, Xi_dim0, b_Xi_dim1, b_gpu_Xi);
    }
    xoffset = b_Xi->size[2] - 1;
    vstride = b_Xi->size[1] - 1;
    Xi_dim0 = Xi->size[0];
    Xi_dim1 = Xi->size[1];
    b_Xi_dim1 = b_Xi->size[1];
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((vstride + 1LL) * (xoffset + 1LL)), &grid, &block,
        1024U, 65535U);
    if (validLaunchParams) {
      if (Xi_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
      }
      expectation_kernel6<<<grid, block>>>(b_gpu_Xi, t, vstride, xoffset,
                                           Xi_dim0, Xi_dim1, b_Xi_dim1, gpu_Xi);
      Xi_dirtyOnCpu = false;
      Xi_dirtyOnGpu = true;
    }
  }
  emxFree_real_T(&b_Xi);
  emxFree_real_T(&a);
  xoffset = Xi->size[2];
  if ((Xi->size[0] == 0) || (Xi->size[1] == 0) || (Xi->size[2] == 0)) {
    uint32_T sz[3];
    for (b_Xi_dim1 = 0; b_Xi_dim1 < 3; b_Xi_dim1++) {
      sz[b_Xi_dim1] = static_cast<uint32_T>(Xi->size[b_Xi_dim1]);
    }
    k = Gamma->size[0] * Gamma->size[1];
    Gamma->size[0] = static_cast<int32_T>(sz[0]);
    Gamma->size[1] = static_cast<int32_T>(sz[1]);
    emxEnsureCapacity_real_T(Gamma, k, &b_emlrtRTEI);
    xoffset = static_cast<int32_T>(sz[0]) * static_cast<int32_T>(sz[1]) - 1;
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>(xoffset + 1LL), &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      gpuEmxMemcpyCpuToGpu_real_T(&gpu_Gamma, Gamma);
      expectation_kernel9<<<grid, block>>>(xoffset, gpu_Gamma);
      Gamma_dirtyOnGpu = true;
    }
  } else {
    uint32_T sz[3];
    vstride = Xi->size[0] * Xi->size[1] - 1;
    for (b_Xi_dim1 = 0; b_Xi_dim1 < 3; b_Xi_dim1++) {
      sz[b_Xi_dim1] = static_cast<uint32_T>(Xi->size[b_Xi_dim1]);
    }
    k = Gamma->size[0] * Gamma->size[1];
    Gamma->size[0] = static_cast<int32_T>(sz[0]);
    Gamma->size[1] = static_cast<int32_T>(sz[1]);
    emxEnsureCapacity_real_T(Gamma, k, &c_emlrtRTEI);
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>(vstride + 1LL), &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (Xi_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
      }
      Xi_dirtyOnCpu = false;
      gpuEmxMemcpyCpuToGpu_real_T(&gpu_Gamma, Gamma);
      expectation_kernel7<<<grid, block>>>(gpu_Xi, vstride, gpu_Gamma);
      Gamma_dirtyOnCpu = false;
      Gamma_dirtyOnGpu = true;
    }
    for (k = 0; k <= xoffset - 2; k++) {
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(vstride + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        if (Xi_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_Xi, Xi);
        }
        Xi_dirtyOnCpu = false;
        if (Gamma_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_Gamma, Gamma);
        }
        expectation_kernel8<<<grid, block>>>(gpu_Xi, (k + 1) * (vstride + 1),
                                             vstride, gpu_Gamma);
        Gamma_dirtyOnCpu = false;
        Gamma_dirtyOnGpu = true;
      }
    }
  }
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  if (Xi_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(Xi, &gpu_Xi);
  }
  if (Gamma_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(Gamma, &gpu_Gamma);
  }
  gpuEmxFree_real_T(&gpu_Xi);
  cudaFree(*gpu_beta);
  cudaFree(*gpu_B);
  cudaFree(*gpu_trans);
  cudaFree(*gpu_alpha);
  gpuEmxFree_real_T(&gpu_Gamma);
  gpuEmxFree_real_T(&gpu_a);
  cudaFree(gpu_y);
  gpuEmxFree_real_T(&b_gpu_Xi);
}

// End of code generation (expectation.cu)
