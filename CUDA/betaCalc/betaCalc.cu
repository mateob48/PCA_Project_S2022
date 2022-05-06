//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// betaCalc.cu
//
// Code generation for function 'betaCalc'
//

// Include files
#include "betaCalc.h"
#include "rt_nonfinite.h"
#include "MWCudaDimUtility.hpp"

// Function Declarations
static __device__ real_T atomicOpreal_T(real_T *address, real_T value);

static __global__ void betaCalc_kernel1(const real_T beta1[40000],
                                        const int32_T i1, const real_T B[40000],
                                        const int32_T i, const real_T trans[16],
                                        const int32_T b_i, real_T x[4]);

static __global__ void betaCalc_kernel2(const real_T x[4], real_T *y);

static __global__ void betaCalc_kernel3(const real_T scale1[10000],
                                        const real_T *y, const int32_T t,
                                        const int32_T i, real_T beta1[40000]);

static __global__ void betaCalc_kernel4(const real_T beta1[40000],
                                        real_T beta[40000]);

static __device__ real_T shflDown2(real_T in1, uint32_T offset, uint32_T mask);

static __device__ real_T threadGroupReduction(real_T val, uint32_T lane,
                                              uint32_T mask);

static __device__ real_T workGroupReduction(real_T val, uint32_T mask,
                                            uint32_T numActiveWarps);

// Function Definitions
static __device__ real_T atomicOpreal_T(real_T *address, real_T value)
{
  unsigned long long int old;
  unsigned long long int *address_as_up;
  address_as_up = (unsigned long long int *)address;
  old = *address_as_up;
  unsigned long long int assumed;
  do {
    assumed = old;
    old = atomicCAS(address_as_up, old,
                    __double_as_longlong(value + __longlong_as_double(old)));
  } while (assumed != old);
  return __longlong_as_double(old);
}

static __global__ __launch_bounds__(32, 1) void betaCalc_kernel1(
    const real_T beta1[40000], const int32_T i1, const real_T B[40000],
    const int32_T i, const real_T trans[16], const int32_T b_i, real_T x[4])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 4) {
    x[k] = trans[b_i + (k << 2)] * B[i + 10000 * k] * beta1[i1 + 10000 * k];
  }
}

static __global__
    __launch_bounds__(32, 1) void betaCalc_kernel2(const real_T x[4], real_T *y)
{
  real_T tmpRed0;
  uint32_T blockStride;
  uint32_T mask;
  uint32_T thBlkId;
  uint32_T threadId;
  uint32_T threadStride;
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  blockStride = static_cast<uint32_T>(mwGetThreadsPerBlock());
  if (static_cast<uint32_T>(mwGetBlockIndex()) == 4U / blockStride) {
    int32_T m;
    m = static_cast<int32_T>(4U % blockStride);
    if (static_cast<uint32_T>(m) > 0U) {
      blockStride = static_cast<uint32_T>(m);
    }
  }
  blockStride = ((blockStride + warpSize) - 1U) / warpSize;
  if (threadId <= 3U) {
    tmpRed0 = x[static_cast<int32_T>(threadId)];
  }
  mask = __ballot_sync(MAX_uint32_T, threadId <= 3U);
  for (uint32_T idx{threadId + threadStride}; idx <= 3U; idx += threadStride) {
    tmpRed0 += x[static_cast<int32_T>(idx)];
  }
  tmpRed0 = workGroupReduction(tmpRed0, mask, blockStride);
  if ((static_cast<int32_T>(threadId <= 3U)) &&
      (static_cast<int32_T>(thBlkId == 0U))) {
    atomicOpreal_T(&y[0], tmpRed0);
  }
}

static __global__ __launch_bounds__(32, 1) void betaCalc_kernel3(
    const real_T scale1[10000], const real_T *y, const int32_T t,
    const int32_T i, real_T beta1[40000])
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    beta1[(10000 * i - t) + 9998] = *y / scale1[9998 - t];
  }
}

static __global__
    __launch_bounds__(512, 1) void betaCalc_kernel4(const real_T beta1[40000],
                                                    real_T beta[40000])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 40000) {
    beta[k] = beta1[k];
  }
}

static __device__ real_T shflDown2(real_T in1, uint32_T offset, uint32_T mask)
{
  int2 tmp;
  tmp.x = __shfl_down_sync(mask, ((int2 *)&in1)->x, offset);
  tmp.y = __shfl_down_sync(mask, ((int2 *)&in1)->y, offset);
  return *(real_T *)&tmp;
}

static __device__ real_T threadGroupReduction(real_T val, uint32_T lane,
                                              uint32_T mask)
{
  uint32_T activeSize;
  uint32_T offset;
  activeSize = __popc(mask);
  offset = (activeSize + 1U) / 2U;
  while (activeSize > 1U) {
    real_T other;
    other = shflDown2(val, offset, mask);
    if (lane + offset < activeSize) {
      val += other;
    }
    activeSize = offset;
    offset = (offset + 1U) / 2U;
  }
  return val;
}

static __device__ real_T workGroupReduction(real_T val, uint32_T mask,
                                            uint32_T numActiveWarps)
{
  __shared__ real_T shared[32];
  uint32_T lane;
  uint32_T thBlkId;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  lane = thBlkId % warpSize;
  thBlkId /= warpSize;
  val = threadGroupReduction(val, lane, mask);
  if (lane == 0U) {
    shared[thBlkId] = val;
  }
  __syncthreads();
  mask = __ballot_sync(MAX_uint32_T, lane < numActiveWarps);
  val = shared[lane];
  if (thBlkId == 0U) {
    val = threadGroupReduction(val, lane, mask);
  }
  return val;
}

void betaCalc(real_T beta1[40000], const real_T scale1[10000],
              const real_T trans[16], const real_T B[40000], real_T N,
              real_T beta[40000])
{
  real_T(*gpu_B)[40000];
  real_T(*gpu_beta)[40000];
  real_T(*gpu_beta1)[40000];
  real_T(*gpu_scale1)[10000];
  real_T(*gpu_trans)[16];
  real_T(*gpu_x)[4];
  real_T y;
  real_T *gpu_y;
  int32_T i;
  boolean_T B_dirtyOnCpu;
  boolean_T beta1_dirtyOnCpu;
  boolean_T scale1_dirtyOnCpu;
  boolean_T trans_dirtyOnCpu;
  cudaMalloc(&gpu_scale1, 80000ULL);
  cudaMalloc(&gpu_y, 8ULL);
  cudaMalloc(&gpu_x, 32ULL);
  cudaMalloc(&gpu_trans, 128ULL);
  cudaMalloc(&gpu_B, 320000ULL);
  cudaMalloc(&gpu_beta, 320000ULL);
  cudaMalloc(&gpu_beta1, 320000ULL);
  scale1_dirtyOnCpu = true;
  trans_dirtyOnCpu = true;
  B_dirtyOnCpu = true;
  beta1_dirtyOnCpu = true;
  i = static_cast<int32_T>(N);
  for (int32_T t{0}; t < 9999; t++) {
    for (int32_T b_i{0}; b_i < i; b_i++) {
      if (beta1_dirtyOnCpu) {
        cudaMemcpy(*gpu_beta1, beta1, 320000ULL, cudaMemcpyHostToDevice);
      }
      if (B_dirtyOnCpu) {
        cudaMemcpy(*gpu_B, B, 320000ULL, cudaMemcpyHostToDevice);
      }
      B_dirtyOnCpu = false;
      if (trans_dirtyOnCpu) {
        cudaMemcpy(*gpu_trans, trans, 128ULL, cudaMemcpyHostToDevice);
      }
      trans_dirtyOnCpu = false;
      betaCalc_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
          *gpu_beta1, 9999 - t, *gpu_B, 9999 - t, *gpu_trans, b_i, *gpu_x);
      y = 0.0;
      cudaMemcpy(gpu_y, &y, 8ULL, cudaMemcpyHostToDevice);
      betaCalc_kernel2<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_x, gpu_y);
      if (scale1_dirtyOnCpu) {
        cudaMemcpy(*gpu_scale1, scale1, 80000ULL, cudaMemcpyHostToDevice);
      }
      scale1_dirtyOnCpu = false;
      betaCalc_kernel3<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
          *gpu_scale1, gpu_y, t, b_i, *gpu_beta1);
      beta1_dirtyOnCpu = false;
    }
  }
  if (beta1_dirtyOnCpu) {
    cudaMemcpy(*gpu_beta1, beta1, 320000ULL, cudaMemcpyHostToDevice);
  }
  betaCalc_kernel4<<<dim3(79U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_beta1,
                                                              *gpu_beta);
  cudaMemcpy(beta, *gpu_beta, 320000ULL, cudaMemcpyDeviceToHost);
  cudaFree(*gpu_beta1);
  cudaFree(*gpu_beta);
  cudaFree(*gpu_B);
  cudaFree(*gpu_trans);
  cudaFree(*gpu_x);
  cudaFree(gpu_y);
  cudaFree(*gpu_scale1);
}

// End of code generation (betaCalc.cu)
