//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// alphaCalc.cu
//
// Code generation for function 'alphaCalc'
//

// Include files
#include "alphaCalc.h"
#include "alphaCalc_data.h"
#include "alphaCalc_emxutil.h"
#include "alphaCalc_types.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include <cstring>

// Variable Definitions
static emlrtRTEInfo emlrtRTEI{
    11,          // lineNo
    5,           // colNo
    "alphaCalc", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\alphaCalc.m" // pName
};

static emlrtRTEInfo b_emlrtRTEI{
    7,           // lineNo
    23,          // colNo
    "alphaCalc", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\alphaCalc.m" // pName
};

static emlrtRTEInfo c_emlrtRTEI{
    5,           // lineNo
    29,          // colNo
    "alphaCalc", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\alphaCalc.m" // pName
};

static emlrtRTEInfo d_emlrtRTEI{
    12,          // lineNo
    5,           // colNo
    "alphaCalc", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\alphaCalc.m" // pName
};

static emlrtRTEInfo e_emlrtRTEI{
    8,           // lineNo
    21,          // colNo
    "alphaCalc", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\alphaCalc.m" // pName
};

// Function Declarations
static __global__ void
alphaCalc_kernel1(const int32_T i, const emxArray_real_T trans,
                  const emxArray_real_T alpha1, const int32_T t, int32_T b_i,
                  const int32_T alpha1_dim0, const int32_T trans_dim0,
                  emxArray_real_T x);

static __global__ void alphaCalc_kernel2(const emxArray_real_T alpha1,
                                         const int32_T vlen, int32_T i,
                                         const int32_T alpha1_dim0,
                                         emxArray_real_T x);

static __global__ void alphaCalc_kernel3(const real_T y,
                                         const emxArray_real_T alpha1,
                                         const int32_T vlen, int32_T i,
                                         const int32_T alpha1_dim0,
                                         emxArray_real_T b_alpha1);

static __global__ void alphaCalc_kernel4(const emxArray_real_T alpha1,
                                         const int32_T i1, int32_T b_alpha1,
                                         const int32_T alpha1_dim0,
                                         emxArray_real_T c_alpha1);

static __global__ void alphaCalc_kernel5(const emxArray_real_T alpha1,
                                         int32_T b_alpha1,
                                         emxArray_real_T alpha);

static __global__ void alphaCalc_kernel6(const emxArray_real_T scale1,
                                         int32_T b_scale1,
                                         emxArray_real_T scale);

static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2,
                             int32_T in3, const emxArray_real_T *in4,
                             int32_T in5);

static void gpuEmxEnsureCapacity_real_T(const emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

static void gpuEmxFree_real_T(emxArray_real_T *gpu);

static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu);

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

static void gpuEmxReset_real_T(emxArray_real_T *gpu);

// Function Definitions
static __global__ __launch_bounds__(1024, 1) void alphaCalc_kernel1(
    const int32_T i, const emxArray_real_T trans, const emxArray_real_T alpha1,
    const int32_T t, int32_T b_i, const int32_T alpha1_dim0,
    const int32_T trans_dim0, emxArray_real_T x)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_i);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i1;
    i1 = static_cast<int32_T>(idx);
    x.data[i1] =
        alpha1.data[t + alpha1_dim0 * i1] * trans.data[i1 + trans_dim0 * i];
  }
}

static __global__ __launch_bounds__(1024, 1) void alphaCalc_kernel2(
    const emxArray_real_T alpha1, const int32_T vlen, int32_T i,
    const int32_T alpha1_dim0, emxArray_real_T x)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(i);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i1;
    i1 = static_cast<int32_T>(idx);
    x.data[i1] = alpha1.data[vlen + alpha1_dim0 * i1];
  }
}

static __global__ __launch_bounds__(1024, 1) void alphaCalc_kernel3(
    const real_T y, const emxArray_real_T alpha1, const int32_T vlen, int32_T i,
    const int32_T alpha1_dim0, emxArray_real_T b_alpha1)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(i);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i1;
    i1 = static_cast<int32_T>(idx);
    b_alpha1.data[i1] = alpha1.data[vlen + alpha1_dim0 * i1] / y;
  }
}

static __global__ __launch_bounds__(1024, 1) void alphaCalc_kernel4(
    const emxArray_real_T alpha1, const int32_T i1, int32_T b_alpha1,
    const int32_T alpha1_dim0, emxArray_real_T c_alpha1)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_alpha1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T b_i1;
    b_i1 = static_cast<int32_T>(idx);
    c_alpha1.data[i1 + alpha1_dim0 * b_i1] = alpha1.data[b_i1];
  }
}

static __global__ __launch_bounds__(1024, 1) void alphaCalc_kernel5(
    const emxArray_real_T alpha1, int32_T b_alpha1, emxArray_real_T alpha)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_alpha1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i1;
    i1 = static_cast<int32_T>(idx);
    alpha.data[i1] = alpha1.data[i1];
  }
}

static __global__ __launch_bounds__(1024, 1) void alphaCalc_kernel6(
    const emxArray_real_T scale1, int32_T b_scale1, emxArray_real_T scale)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_scale1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i1;
    i1 = static_cast<int32_T>(idx);
    scale.data[i1] = scale1.data[i1];
  }
}

static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2,
                             int32_T in3, const emxArray_real_T *in4,
                             int32_T in5)
{
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T stride_0_1;
  int32_T stride_1_1;
  i = in2->size[1];
  i1 = in4->size[0];
  i2 = in1->size[0] * in1->size[1];
  in1->size[0] = 1;
  if (i1 == 1) {
    in1->size[1] = i;
  } else {
    in1->size[1] = i1;
  }
  emxEnsureCapacity_real_T(in1, i2, &c_emlrtRTEI);
  stride_0_1 = (i != 1);
  stride_1_1 = (i1 != 1);
  if (i1 == 1) {
    i1 = i;
  }
  for (i2 = 0; i2 < i1; i2++) {
    in1->data[i2] = in2->data[in3 + in2->size[0] * (i2 * stride_0_1)] *
                    in4->data[i2 * stride_1_1 + in4->size[0] * in5];
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

void alphaCalc(emxArray_real_T *alpha1, emxArray_real_T *scale1,
               const emxArray_real_T *trans, const emxArray_real_T *B, real_T N,
               real_T T, emxArray_real_T *alpha, emxArray_real_T *scale)
{
  dim3 block;
  dim3 grid;
  emxArray_real_T b_gpu_alpha1;
  emxArray_real_T b_gpu_x;
  emxArray_real_T gpu_alpha;
  emxArray_real_T gpu_alpha1;
  emxArray_real_T gpu_scale;
  emxArray_real_T gpu_scale1;
  emxArray_real_T gpu_trans;
  emxArray_real_T gpu_x;
  emxArray_real_T *b_alpha1;
  emxArray_real_T *b_x;
  emxArray_real_T *x;
  int32_T c_i;
  int32_T i;
  int32_T vlen;
  boolean_T alpha1_dirtyOnCpu;
  boolean_T alpha1_dirtyOnGpu;
  boolean_T alpha_dirtyOnGpu;
  boolean_T b_x_dirtyOnGpu;
  boolean_T scale_dirtyOnGpu;
  boolean_T trans_dirtyOnCpu;
  boolean_T validLaunchParams;
  boolean_T x_dirtyOnCpu;
  boolean_T x_dirtyOnGpu;
  gpuEmxReset_real_T(&b_gpu_alpha1);
  gpuEmxReset_real_T(&gpu_scale);
  gpuEmxReset_real_T(&gpu_scale1);
  gpuEmxReset_real_T(&b_gpu_x);
  gpuEmxReset_real_T(&gpu_trans);
  gpuEmxReset_real_T(&gpu_x);
  gpuEmxReset_real_T(&gpu_alpha);
  gpuEmxReset_real_T(&gpu_alpha1);
  b_x_dirtyOnGpu = false;
  x_dirtyOnGpu = false;
  x_dirtyOnCpu = false;
  scale_dirtyOnGpu = false;
  trans_dirtyOnCpu = true;
  alpha_dirtyOnGpu = false;
  alpha1_dirtyOnGpu = false;
  alpha1_dirtyOnCpu = true;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  i = static_cast<int32_T>(T + -1.0);
  emxInit_real_T(&x, 2, &b_emlrtRTEI, true);
  emxInit_real_T(&b_x, 2, &c_emlrtRTEI, true);
  emxInit_real_T(&b_alpha1, 2, &e_emlrtRTEI, true);
  for (int32_T t{0}; t < i; t++) {
    real_T y;
    int32_T i1;
    int32_T k;
    i1 = static_cast<int32_T>(N);
    for (int32_T b_i{0}; b_i < i1; b_i++) {
      if (trans->size[0] == alpha1->size[1]) {
        c_i = alpha1->size[1] - 1;
        k = b_x->size[0] * b_x->size[1];
        b_x->size[0] = 1;
        b_x->size[1] = alpha1->size[1];
        emxEnsureCapacity_real_T(b_x, k, &c_emlrtRTEI);
        if (!x_dirtyOnCpu) {
          gpuEmxEnsureCapacity_real_T(b_x, &b_gpu_x);
        }
        k = alpha1->size[0];
        vlen = trans->size[0];
        validLaunchParams = mwGetLaunchParameters1D(
            static_cast<real_T>(c_i + 1LL), &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          if (trans_dirtyOnCpu) {
            gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
          }
          trans_dirtyOnCpu = false;
          if (alpha1_dirtyOnCpu) {
            gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha1, alpha1);
          }
          if (x_dirtyOnCpu) {
            gpuEmxMemcpyCpuToGpu_real_T(&b_gpu_x, b_x);
          }
          alphaCalc_kernel1<<<grid, block>>>(b_i, gpu_trans, gpu_alpha1, t, c_i,
                                             k, vlen, b_gpu_x);
          x_dirtyOnCpu = false;
          b_x_dirtyOnGpu = true;
        }
      } else {
        if (b_x_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(b_x, &b_gpu_x);
        }
        if (alpha1_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(alpha1, &gpu_alpha1);
        }
        alpha1_dirtyOnGpu = false;
        binary_expand_op(b_x, alpha1, t, trans, b_i);
        b_x_dirtyOnGpu = false;
        x_dirtyOnCpu = true;
      }
      vlen = b_x->size[1];
      if (b_x->size[1] == 0) {
        y = 0.0;
      } else {
        if (b_x_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(b_x, &b_gpu_x);
        }
        b_x_dirtyOnGpu = false;
        y = b_x->data[0];
        for (k = 0; k <= vlen - 2; k++) {
          y += b_x->data[k + 1];
        }
      }
      if (alpha1_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(alpha1, &gpu_alpha1);
      }
      alpha1->data[(t + alpha1->size[0] * b_i) + 1] =
          y * B->data[(t + B->size[0] * b_i) + 1];
      alpha1_dirtyOnGpu = false;
      alpha1_dirtyOnCpu = true;
    }
    c_i = alpha1->size[1] - 1;
    k = x->size[0] * x->size[1];
    x->size[0] = 1;
    x->size[1] = alpha1->size[1];
    emxEnsureCapacity_real_T(x, k, &b_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(x, &gpu_x);
    k = alpha1->size[0];
    validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(c_i + 1LL),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (alpha1_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha1, alpha1);
      }
      alpha1_dirtyOnCpu = false;
      alphaCalc_kernel2<<<grid, block>>>(gpu_alpha1, t + 1, c_i, k, gpu_x);
      x_dirtyOnGpu = true;
    }
    vlen = alpha1->size[1];
    if (alpha1->size[1] == 0) {
      y = 0.0;
    } else {
      if (alpha1_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(alpha1, &gpu_alpha1);
      }
      alpha1_dirtyOnGpu = false;
      y = alpha1->data[t + 1];
      for (k = 0; k <= vlen - 2; k++) {
        if (x_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(x, &gpu_x);
        }
        x_dirtyOnGpu = false;
        y += x->data[k + 1];
      }
    }
    scale1->data[t + 1] = y;
    c_i = alpha1->size[1] - 1;
    k = b_alpha1->size[0] * b_alpha1->size[1];
    b_alpha1->size[0] = 1;
    b_alpha1->size[1] = alpha1->size[1];
    emxEnsureCapacity_real_T(b_alpha1, k, &e_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(b_alpha1, &b_gpu_alpha1);
    k = alpha1->size[0];
    validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(c_i + 1LL),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (alpha1_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha1, alpha1);
      }
      alpha1_dirtyOnCpu = false;
      alphaCalc_kernel3<<<grid, block>>>(y, gpu_alpha1, t + 1, c_i, k,
                                         b_gpu_alpha1);
    }
    vlen = b_alpha1->size[1] - 1;
    k = alpha1->size[0];
    validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(vlen + 1LL),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (alpha1_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha1, alpha1);
      }
      alphaCalc_kernel4<<<grid, block>>>(b_gpu_alpha1, t + 1, vlen, k,
                                         gpu_alpha1);
      alpha1_dirtyOnCpu = false;
      alpha1_dirtyOnGpu = true;
    }
  }
  emxFree_real_T(&b_alpha1);
  emxFree_real_T(&b_x);
  emxFree_real_T(&x);
  c_i = alpha->size[0] * alpha->size[1];
  alpha->size[0] = alpha1->size[0];
  alpha->size[1] = alpha1->size[1];
  emxEnsureCapacity_real_T(alpha, c_i, &emlrtRTEI);
  vlen = alpha1->size[0] * alpha1->size[1] - 1;
  validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(vlen + 1LL),
                                              &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    if (alpha1_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha1, alpha1);
    }
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
    alphaCalc_kernel5<<<grid, block>>>(gpu_alpha1, vlen, gpu_alpha);
    alpha_dirtyOnGpu = true;
  }
  c_i = scale->size[0] * scale->size[1];
  scale->size[0] = 1;
  scale->size[1] = scale1->size[1];
  emxEnsureCapacity_real_T(scale, c_i, &d_emlrtRTEI);
  vlen = scale1->size[1] - 1;
  validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(vlen + 1LL),
                                              &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_scale1, scale1);
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_scale, scale);
    alphaCalc_kernel6<<<grid, block>>>(gpu_scale1, vlen, gpu_scale);
    scale_dirtyOnGpu = true;
  }
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  if (alpha1_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(alpha1, &gpu_alpha1);
  }
  if (alpha_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(alpha, &gpu_alpha);
  }
  if (scale_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(scale, &gpu_scale);
  }
  gpuEmxFree_real_T(&gpu_alpha1);
  gpuEmxFree_real_T(&gpu_alpha);
  gpuEmxFree_real_T(&gpu_x);
  gpuEmxFree_real_T(&gpu_trans);
  gpuEmxFree_real_T(&b_gpu_x);
  gpuEmxFree_real_T(&gpu_scale1);
  gpuEmxFree_real_T(&gpu_scale);
  gpuEmxFree_real_T(&b_gpu_alpha1);
}

// End of code generation (alphaCalc.cu)
