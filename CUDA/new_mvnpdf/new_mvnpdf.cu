//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// new_mvnpdf.cu
//
// Code generation for function 'new_mvnpdf'
//

// Include files
#include "new_mvnpdf.h"
#include "new_mvnpdf_data.h"
#include "new_mvnpdf_types.h"
#include "rt_nonfinite.h"
#include "MWCUBLASUtils.hpp"
#include "MWCUSOLVERUtils.hpp"
#include "MWCudaDimUtility.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "lapacke.h"
#include "math_constants.h"
#include <cmath>
#include <cstddef>
#include <math.h>

// Variable Definitions
static emlrtMCInfo emlrtMCI{
    27,      // lineNo
    5,       // colNo
    "error", // fName
    "C:\\Program "
    "Files\\MATLAB\\R2022a\\toolbox\\eml\\lib\\matlab\\lang\\error.m" // pName
};

// Function Declarations
static __device__ real_T atomicOpreal_T(real_T *address, real_T value);

static void b_error(const mxArray *m, const mxArray *m1, emlrtMCInfo *location);

static __global__ void new_mvnpdf_kernel1(const real_T Mu[58],
                                          const real_T X[580000],
                                          real_T X0[580000]);

static __global__ void new_mvnpdf_kernel10(const real_T T_data[3364],
                                           int32_T T_size, real_T A_data[3364]);

static __global__ void new_mvnpdf_kernel11(const real_T T_data[3364],
                                           const int32_T T_size_dim0,
                                           const int32_T T_size,
                                           int32_T b_T_size,
                                           real_T A_data[3364]);

static __global__ void new_mvnpdf_kernel12(real_T X0[580000], real_T B[580000]);

static __global__ void
new_mvnpdf_kernel13(int32_T *i2, ptrdiff_t jpvt_t_data[58], int32_T ipiv_t[58]);

static __global__ void new_mvnpdf_kernel14(const ptrdiff_t jpvt_t_data[58],
                                           int32_T *i2, int32_T ipiv_t[58]);

static __global__ void new_mvnpdf_kernel15(int32_T *i2, real_T A_data[3364]);

static __global__ void new_mvnpdf_kernel16(int32_T *i2, real_T y[58]);

static __global__ void new_mvnpdf_kernel17(int32_T *i2, int32_T ipiv_t[58]);

static __global__ void new_mvnpdf_kernel18(int16_T iv2_idx_0,
                                           real_T Y_data[580000]);

static __global__ void new_mvnpdf_kernel19(real_T B[580000]);

static __global__ void new_mvnpdf_kernel2(const real_T Sigma[3364],
                                          real_T y[58]);

static __global__ void new_mvnpdf_kernel20(const int32_T Y_size_dim0,
                                           const int32_T *rankA,
                                           real_T A_data[3364],
                                           real_T B[580000], int32_T ipiv_t[58],
                                           real_T Y_data[580000]);

static __global__ void new_mvnpdf_kernel21(const real_T Y_data[580000],
                                           const int32_T Y_size_dim0,
                                           int32_T Y_size,
                                           real_T xRinv_data[580000]);

static __global__ void new_mvnpdf_kernel22(int32_T ipiv_t[58],
                                           int32_T ipiv_data[58]);

static __global__ void new_mvnpdf_kernel23(int32_T Y_size, real_T A_data[3364]);

static __global__ void new_mvnpdf_kernel24(int32_T ipiv_data[58]);

static __global__ void new_mvnpdf_kernel25(real_T X0[580000],
                                           real_T xRinv_data[580000]);

static __global__ void new_mvnpdf_kernel26(const real_T T_data[3364],
                                           const int32_T T_size_dim0,
                                           int32_T *i2, real_T y[58]);

static __global__ void new_mvnpdf_kernel27(int32_T *i2, real_T y[58]);

static __global__ void new_mvnpdf_kernel28(real_T y[58], real_T *tol);

static __global__ void new_mvnpdf_kernel29(int32_T *info_t, real_T y[58],
                                           real_T *tol);

static __global__ void new_mvnpdf_kernel3(const real_T Sigma[3364],
                                          real_T x[3364]);

static __global__ void new_mvnpdf_kernel30(const real_T xRinv_data[580000],
                                           int32_T *i2, real_T y_data[580000]);

static __global__ void new_mvnpdf_kernel31(const real_T y_data[580000],
                                           real_T y[10000]);

static __global__ void new_mvnpdf_kernel32(const real_T y_data[580000],
                                           const int32_T *i2, real_T y[10000]);

static __global__ void new_mvnpdf_kernel33(real_T y[10000]);

static __global__ void new_mvnpdf_kernel34(real_T *tol, real_T y[10000]);

static __global__ void new_mvnpdf_kernel4(real_T x[3364], real_T y[3364]);

static __global__ void new_mvnpdf_kernel5(boolean_T y[58]);

static __global__ void new_mvnpdf_kernel6(const real_T y[3364],
                                          const int32_T initAuxVar, real_T *tol,
                                          boolean_T b_y[58]);

static __global__ void new_mvnpdf_kernel7(const real_T Sigma[3364],
                                          real_T x[3364]);

static __global__ void new_mvnpdf_kernel8(real_T x[3364]);

static __global__ void new_mvnpdf_kernel9(const int32_T T_size_dim0,
                                          const int32_T *rankA, int32_T *i2,
                                          real_T x[3364], real_T T_data[3364]);

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

static void b_error(const mxArray *m, const mxArray *m1, emlrtMCInfo *location)
{
  const mxArray *pArrays[2];
  pArrays[0] = m;
  pArrays[1] = m1;
  emlrtCallMATLABR2012b(emlrtRootTLSGlobal, 0, nullptr, 2, &pArrays[0],
                        (const char_T *)"error", true, location);
}

static __global__ __launch_bounds__(512, 1) void new_mvnpdf_kernel1(
    const real_T Mu[58], const real_T X[580000], real_T X0[580000])
{
  uint64_T threadId;
  int32_T i14;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i14 = static_cast<int32_T>(threadId % 10000ULL);
  k = static_cast<int32_T>((threadId - static_cast<uint64_T>(i14)) / 10000ULL);
  if ((static_cast<int32_T>(k < 58)) && (static_cast<int32_T>(i14 < 10000))) {
    X0[i14 + 10000 * k] = X[i14 + 10000 * k] - Mu[k];
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel10(
    const real_T T_data[3364], int32_T T_size, real_T A_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(T_size);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    A_data[i] = T_data[i];
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel11(
    const real_T T_data[3364], const int32_T T_size_dim0, const int32_T T_size,
    int32_T b_T_size, real_T A_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(T_size) + 1ULL) *
                (static_cast<uint64_T>(b_T_size) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T i14;
    i14 = static_cast<int32_T>(idx % (static_cast<uint64_T>(T_size) + 1ULL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(i14)) /
                             (static_cast<uint64_T>(T_size) + 1ULL));
    A_data[i14 + 58 * i] = T_data[i + T_size_dim0 * i14];
  }
}

static __global__
    __launch_bounds__(512, 1) void new_mvnpdf_kernel12(real_T X0[580000],
                                                       real_T B[580000])
{
  uint64_T threadId;
  int32_T i;
  int32_T i14;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i14 = static_cast<int32_T>(threadId % 58ULL);
  i = static_cast<int32_T>((threadId - static_cast<uint64_T>(i14)) / 58ULL);
  if ((static_cast<int32_T>(i < 10000)) && (static_cast<int32_T>(i14 < 58))) {
    B[i14 + 58 * i] = X0[i + 10000 * i14];
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel13(
    int32_T *i2, ptrdiff_t jpvt_t_data[58], int32_T ipiv_t[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*i2 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    ipiv_t[i] = 0;
    jpvt_t_data[i] = (ptrdiff_t)0;
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel14(
    const ptrdiff_t jpvt_t_data[58], int32_T *i2, int32_T ipiv_t[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*i2 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    ipiv_t[k] = (int32_T)jpvt_t_data[k];
  }
}

static __global__
    __launch_bounds__(1024, 1) void new_mvnpdf_kernel15(int32_T *i2,
                                                        real_T A_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = 58ULL * (static_cast<uint64_T>(*i2 - 1) + 1ULL) - 1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T j;
    i = static_cast<int32_T>(idx % 58ULL);
    j = static_cast<int32_T>((idx - static_cast<uint64_T>(i)) / 58ULL);
    A_data[j * 58 + i] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(1024,
                                    1) void new_mvnpdf_kernel16(int32_T *i2,
                                                                real_T y[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*i2 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    y[k] = CUDART_NAN;
  }
}

static __global__
    __launch_bounds__(1024, 1) void new_mvnpdf_kernel17(int32_T *i2,
                                                        int32_T ipiv_t[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*i2 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    ipiv_t[k] = k + 1;
  }
}

static __global__
    __launch_bounds__(1024, 1) void new_mvnpdf_kernel18(int16_T iv2_idx_0,
                                                        real_T Y_data[580000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(static_cast<int32_T>(iv2_idx_0) * 10000 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    Y_data[i] = 0.0;
  }
}

static __global__
    __launch_bounds__(512, 1) void new_mvnpdf_kernel19(real_T B[580000])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 580000) {
    B[i] = CUDART_NAN;
  }
}

static __global__
    __launch_bounds__(64, 1) void new_mvnpdf_kernel2(const real_T Sigma[3364],
                                                     real_T y[58])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 58) {
    //  Assume identity covariance, data are already standardized
    //  Special case: if Sigma is supplied, then use it to try to interpret
    //  X and Mu as row vectors if they were both column vectors.
    // Check that sigma is the right size
    //  Make sure Sigma is a valid covariance matrix
    // CHOLCOV  Cholesky-like decomposition for covariance matrix.
    //    T = CHOLCOV(SIGMA) computes T such that SIGMA = T'*T.  SIGMA must be
    //    square, symmetric, and positive semi-definite.  If SIGMA is positive
    //    definite, then T is the square, upper triangular Cholesky factor.
    //
    //    If SIGMA is not positive definite, T is computed from an eigenvalue
    //    decomposition of SIGMA.  T is not necessarily triangular or square in
    //    this case.  Any eigenvectors whose corresponding eigenvalue is close
    //    to zero (within a small tolerance) are omitted.  If any remaining
    //    eigenvalues are negative, T is empty.
    //
    //    [T,P] = CHOLCOV(SIGMA) returns the number of negative eigenvalues of
    //    SIGMA, and T is empty if P>0.  If P==0, SIGMA is positive
    //    semi-definite.
    //
    //    If SIGMA is not square and symmetric, P is NaN and T is empty.
    //
    //    [T,P] = CHOLCOV(SIGMA,0) returns P==0 if SIGMA is positive definite,
    //    and T is the Cholesky factor.  If SIGMA is not positive definite, P is
    //    a positive integer and T is empty.  [...] = CHOLCOV(SIGMA,1) is
    //    equivalent to [...] = CHOLCOV(SIGMA).
    //
    //    Example:
    //    Factor a rank-deficient covariance matrix C.
    //        C = [2 1 1 2;1 2 1 2;1 1 2 2;2 2 2 3]
    //        T = cholcov(C)
    //        C2 = T'*T
    //    Generate data with this covariance (aside from random variation).
    //        C3 = cov(randn(10000,3)*T)
    //
    //    See also CHOL.
    //    Copyright 1993-2009 The MathWorks, Inc.
    //  Test for square, symmetric
    y[k] = fabs(Sigma[k + 58 * k]);
  }
}

static __global__ __launch_bounds__(512, 1) void new_mvnpdf_kernel20(
    const int32_T Y_size_dim0, const int32_T *rankA, real_T A_data[3364],
    real_T B[580000], int32_T ipiv_t[58], real_T Y_data[580000])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 10000) {
    int32_T i;
    for (i = 0; i < *rankA; i++) {
      Y_data[(ipiv_t[i] + Y_size_dim0 * k) - 1] = B[i + 58 * k];
    }
    for (int32_T j{0}; j < *rankA; j++) {
      int32_T b_j;
      int32_T i14;
      b_j = *rankA - j;
      i = ipiv_t[b_j - 1];
      Y_data[(i + Y_size_dim0 * k) - 1] /= A_data[(b_j + 58 * (b_j - 1)) - 1];
      i14 = b_j - 1;
      for (i = 0; i < i14; i++) {
        Y_data[(ipiv_t[i] + Y_size_dim0 * k) - 1] -=
            Y_data[(ipiv_t[b_j - 1] + Y_size_dim0 * k) - 1] *
            A_data[i + 58 * (b_j - 1)];
      }
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel21(
    const real_T Y_data[580000], const int32_T Y_size_dim0, int32_T Y_size,
    real_T xRinv_data[580000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = 10000ULL * (static_cast<uint64_T>(Y_size) + 1ULL) - 1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T i14;
    i14 = static_cast<int32_T>(idx % 10000ULL);
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(i14)) / 10000ULL);
    xRinv_data[i14 + 10000 * i] = Y_data[i + Y_size_dim0 * i14];
  }
}

static __global__
    __launch_bounds__(64, 1) void new_mvnpdf_kernel22(int32_T ipiv_t[58],
                                                      int32_T ipiv_data[58])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 58) {
    ipiv_data[k] = ipiv_t[k];
  }
}

static __global__
    __launch_bounds__(1024, 1) void new_mvnpdf_kernel23(int32_T Y_size,
                                                        real_T A_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(Y_size);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    i = static_cast<int32_T>(idx);
    A_data[i] = CUDART_NAN;
  }
}

static __global__
    __launch_bounds__(64, 1) void new_mvnpdf_kernel24(int32_T ipiv_data[58])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 58) {
    ipiv_data[k] = k + 1;
  }
}

static __global__ __launch_bounds__(512, 1) void new_mvnpdf_kernel25(
    real_T X0[580000], real_T xRinv_data[580000])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 580000) {
    xRinv_data[i] = X0[i];
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel26(
    const real_T T_data[3364], const int32_T T_size_dim0, int32_T *i2,
    real_T y[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*i2 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    y[k] = T_data[k + T_size_dim0 * k];
  }
}

static __global__ __launch_bounds__(1024,
                                    1) void new_mvnpdf_kernel27(int32_T *i2,
                                                                real_T y[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*i2);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    y[k] = log(y[k]);
  }
}

static __global__
    __launch_bounds__(32, 1) void new_mvnpdf_kernel28(real_T y[58], real_T *tol)
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    *tol = y[0];
  }
}

static __global__ __launch_bounds__(1024,
                                    1) void new_mvnpdf_kernel29(int32_T *info_t,
                                                                real_T y[58],
                                                                real_T *tol)
{
  int64_T loopEnd;
  real_T tmpRed0;
  uint32_T blockStride;
  uint32_T m;
  uint32_T thBlkId;
  uint32_T threadId;
  uint32_T threadStride;
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  blockStride = static_cast<uint32_T>(mwGetThreadsPerBlock());
  loopEnd = (static_cast<int64_T>(*info_t - 2) + 1LL) - 1LL;
  if (static_cast<uint32_T>(mwGetBlockIndex()) ==
      static_cast<uint32_T>(static_cast<int64_T>(*info_t - 2) + 1LL) /
          blockStride) {
    m = (static_cast<int64_T>(*info_t - 2) + 1LL) %
        static_cast<int64_T>(blockStride);
    if (m > 0U) {
      blockStride = m;
    }
  }
  blockStride = ((blockStride + warpSize) - 1U) / warpSize;
  if (static_cast<int64_T>(threadId) <= loopEnd) {
    tmpRed0 = y[static_cast<int32_T>(threadId) + 1];
  }
  m = __ballot_sync(MAX_uint32_T, static_cast<int64_T>(threadId) <= loopEnd);
  for (uint32_T idx{threadId + threadStride};
       idx <= static_cast<uint32_T>(loopEnd); idx += threadStride) {
    tmpRed0 += y[static_cast<int32_T>(idx) + 1];
  }
  tmpRed0 = workGroupReduction(tmpRed0, m, blockStride);
  if ((static_cast<int32_T>(static_cast<int64_T>(threadId) <= loopEnd)) &&
      (static_cast<int32_T>(thBlkId == 0U))) {
    atomicOpreal_T(&tol[0], tmpRed0);
  }
}

static __global__
    __launch_bounds__(512, 1) void new_mvnpdf_kernel3(const real_T Sigma[3364],
                                                      real_T x[3364])
{
  uint64_T threadId;
  int32_T i;
  int32_T i14;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i14 = static_cast<int32_T>(threadId % 58ULL);
  i = static_cast<int32_T>((threadId - static_cast<uint64_T>(i14)) / 58ULL);
  if ((static_cast<int32_T>(i < 58)) && (static_cast<int32_T>(i14 < 58))) {
    x[i14 + 58 * i] = Sigma[i14 + 58 * i] - Sigma[i + 58 * i14];
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel30(
    const real_T xRinv_data[580000], int32_T *i2, real_T y_data[580000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*i2);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    real_T d1;
    int32_T k;
    k = static_cast<int32_T>(idx);
    d1 = xRinv_data[k];
    y_data[k] = d1 * d1;
  }
}

static __global__ __launch_bounds__(512, 1) void new_mvnpdf_kernel31(
    const real_T y_data[580000], real_T y[10000])
{
  uint64_T threadId;
  int32_T j;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int32_T>(threadId);
  if (j < 10000) {
    y[j] = y_data[j];
  }
}

static __global__ __launch_bounds__(512, 1) void new_mvnpdf_kernel32(
    const real_T y_data[580000], const int32_T *i2, real_T y[10000])
{
  uint64_T threadId;
  int32_T j;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int32_T>(threadId);
  if (j < 10000) {
    y[j] += y_data[*i2 + j];
  }
}

static __global__ __launch_bounds__(512,
                                    1) void new_mvnpdf_kernel33(real_T y[10000])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 10000) {
    y[i] = 0.0;
  }
}

static __global__ __launch_bounds__(512,
                                    1) void new_mvnpdf_kernel34(real_T *tol,
                                                                real_T y[10000])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 10000) {
    y[k] = exp((-0.5 * y[k] - *tol) - 53.298434925871014);
  }
}

static __global__ __launch_bounds__(512,
                                    1) void new_mvnpdf_kernel4(real_T x[3364],
                                                               real_T y[3364])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 3364) {
    y[k] = fabs(x[k]);
  }
}

static __global__ __launch_bounds__(64,
                                    1) void new_mvnpdf_kernel5(boolean_T y[58])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 58) {
    y[i] = true;
  }
}

static __global__ __launch_bounds__(64, 1) void new_mvnpdf_kernel6(
    const real_T y[3364], const int32_T initAuxVar, real_T *tol,
    boolean_T b_y[58])
{
  uint64_T threadId;
  int32_T vlen;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  vlen = static_cast<int32_T>(threadId);
  if (vlen < 58) {
    int32_T i2;
    int32_T info_t;
    boolean_T exitg1;
    i2 = initAuxVar + vlen * 58;
    info_t = i2 + 57;
    exitg1 = false;
    while ((!static_cast<int32_T>(exitg1)) &&
           (static_cast<int32_T>(i2 <= info_t))) {
      if (!static_cast<int32_T>(y[i2 - 1] < *tol)) {
        b_y[vlen] = false;
        exitg1 = true;
      } else {
        i2++;
      }
    }
  }
}

static __global__
    __launch_bounds__(512, 1) void new_mvnpdf_kernel7(const real_T Sigma[3364],
                                                      real_T x[3364])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 3364) {
    x[i] = Sigma[i];
  }
}

static __global__ __launch_bounds__(512,
                                    1) void new_mvnpdf_kernel8(real_T x[3364])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 3364) {
    x[i] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(1024, 1) void new_mvnpdf_kernel9(
    const int32_T T_size_dim0, const int32_T *rankA, int32_T *i2,
    real_T x[3364], real_T T_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(*rankA) + 1ULL) *
                (static_cast<uint64_T>(*i2) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T i14;
    i14 = static_cast<int32_T>(idx % (static_cast<uint64_T>(*rankA) + 1ULL));
    i = static_cast<int32_T>((idx - static_cast<uint64_T>(i14)) /
                             (static_cast<uint64_T>(*rankA) + 1ULL));
    T_data[i14 + T_size_dim0 * i] = x[i14 + 58 * i];
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

void new_mvnpdf(new_mvnpdfStackData *SD, const real_T X[580000],
                const real_T Mu[58], const real_T Sigma[3364], real_T y[10000])
{
  static const int32_T iv[2]{1, 26};
  static const int32_T iv1[2]{1, 46};
  static const char_T varargin_2[46]{
      'S', 'I', 'G', 'M', 'A', ' ', 'm', 'u', 's', 't', ' ', 'b',
      'e', ' ', 's', 'y', 'm', 'm', 'e', 't', 'r', 'i', 'c', ' ',
      'a', 'n', 'd', ' ', 'p', 'o', 's', 'i', 't', 'i', 'v', 'e',
      ' ', 'd', 'e', 'f', 'i', 'n', 'i', 't', 'e', '.'};
  static const char_T varargin_1[26]{
      's', 't', 'a', 't', 's', ':', 'm', 'v', 'n', 'p', 'd', 'f', ':',
      'B', 'a', 'd', 'C', 'o', 'v', 'a', 'r', 'i', 'a', 'n', 'c', 'e'};
  ptrdiff_t jpvt_t_data[58];
  ptrdiff_t(*gpu_jpvt_t_data)[58];
  dim3 block;
  dim3 grid;
  const mxArray *d_y;
  const mxArray *e_y;
  const mxArray *m;
  real_T(*gpu_B)[580000];
  real_T(*gpu_X)[580000];
  real_T(*gpu_X0)[580000];
  real_T(*gpu_Y_data)[580000];
  real_T(*gpu_xRinv_data)[580000];
  real_T(*gpu_y_data)[580000];
  real_T(*d_gpu_y)[10000];
  real_T A_data[3364];
  real_T x[3364];
  real_T(*b_gpu_y)[3364];
  real_T(*gpu_A_data)[3364];
  real_T(*gpu_Sigma)[3364];
  real_T(*gpu_T_data)[3364];
  real_T(*gpu_x)[3364];
  real_T b_y[58];
  real_T(*gpu_Mu)[58];
  real_T(*gpu_y)[58];
  real_T tol;
  real_T *gpu_tol;
  int32_T ipiv_data[58];
  int32_T(*gpu_ipiv_data)[58];
  int32_T(*gpu_ipiv_t)[58];
  int32_T T_size[2];
  int32_T i2;
  int32_T info_t;
  int32_T rankA;
  int32_T vlen;
  int32_T *gpu_i2;
  int32_T *gpu_info_t;
  int32_T *gpu_rankA;
  boolean_T c_y[58];
  boolean_T(*c_gpu_y)[58];
  boolean_T A_data_dirtyOnGpu;
  boolean_T exitg1;
  boolean_T jpvt_t_data_dirtyOnGpu;
  boolean_T p;
  boolean_T tol_dirtyOnCpu;
  boolean_T validLaunchParams;
  boolean_T y_dirtyOnGpu;
  cudaMalloc(&gpu_Y_data, 4640000ULL);
  cudaMalloc(&d_gpu_y, 80000ULL);
  cudaMalloc(&gpu_y_data, 4640000ULL);
  cudaMalloc(&gpu_xRinv_data, 4640000ULL);
  cudaMalloc(&gpu_jpvt_t_data, 464ULL);
  cudaMalloc(&gpu_B, 4640000ULL);
  cudaMalloc(&gpu_ipiv_data, 232ULL);
  cudaMalloc(&gpu_ipiv_t, 232ULL);
  cudaMalloc(&gpu_i2, 4ULL);
  cudaMalloc(&gpu_rankA, 4ULL);
  cudaMalloc(&gpu_A_data, 26912ULL);
  cudaMalloc(&gpu_T_data, 26912ULL);
  cudaMalloc(&gpu_info_t, 4ULL);
  cudaMalloc(&gpu_tol, 8ULL);
  cudaMalloc(&c_gpu_y, 58ULL);
  cudaMalloc(&b_gpu_y, 26912ULL);
  cudaMalloc(&gpu_x, 26912ULL);
  cudaMalloc(&gpu_y, 464ULL);
  cudaMalloc(&gpu_Sigma, 26912ULL);
  cudaMalloc(&gpu_X0, 4640000ULL);
  cudaMalloc(&gpu_X, 4640000ULL);
  cudaMalloc(&gpu_Mu, 464ULL);
  jpvt_t_data_dirtyOnGpu = false;
  A_data_dirtyOnGpu = false;
  // MVNPDF Multivariate normal probability density function (pdf).
  //    Y = MVNPDF(X) returns the probability density of the multivariate normal
  //    distribution with zero mean and identity covariance matrix, evaluated at
  //    each row of X.  Rows of the N-by-D matrix X correspond to observations
  //    or points, and columns correspond to variables or coordinates.  Y is an
  //    N-by-1 vector.
  //
  //    Y = MVNPDF(X,MU) returns the density of the multivariate normal
  //    distribution with mean MU and identity covariance matrix, evaluated
  //    at each row of X.  MU is a 1-by-D vector, or an N-by-D matrix, in which
  //    case the density is evaluated for each row of X with the corresponding
  //    row of MU.  MU can also be a scalar value, which MVNPDF replicates to
  //    match the size of X.
  //
  //    Y = MVNPDF(X,MU,SIGMA) returns the density of the multivariate normal
  //    distribution with mean MU and covariance SIGMA, evaluated at each row
  //    of X.  SIGMA is a D-by-D matrix, or an D-by-D-by-N array, in which case
  //    the density is evaluated for each row of X with the corresponding page
  //    of SIGMA, i.e., MVNPDF computes Y(I) using X(I,:) and SIGMA(:,:,I).
  //    If the covariance matrix is diagonal, containing variances along the
  //    diagonal and zero covariances off the diagonal, SIGMA may also be
  //    specified as a 1-by-D matrix or a 1-by-D-by-N array, containing
  //    just the diagonal. Pass in the empty matrix for MU to use its default
  //    value when you want to only specify SIGMA.
  //
  //    If X is a 1-by-D vector, MVNPDF replicates it to match the leading
  //    dimension of MU or the trailing dimension of SIGMA.
  //
  //    Example:
  //
  //       mu = [1 -1]; Sigma = [.9 .4; .4 .3];
  //       [X1,X2] = meshgrid(linspace(-1,3,25)', linspace(-3,1,25)');
  //       X = [X1(:) X2(:)];
  //       p = mvnpdf(X, mu, Sigma);
  //       surf(X1,X2,reshape(p,25,25));
  //
  //    See also MVTPDF, MVNCDF, MVNRND, NORMPDF.
  //    Copyright 1993-2008 The MathWorks, Inc.
  //    $Revision: 1.2.4.8 $  $Date: 2008/02/29 13:12:08 $
  //  Get size of data.  Column vectors provisionally interpreted as multiple
  //  scalar data. Assume zero mean, data are already centered mean is a single
  //  row, rep it out to match data
  cudaMemcpy(*gpu_Mu, Mu, 464ULL, cudaMemcpyHostToDevice);
  cudaMemcpy(*gpu_X, X, 4640000ULL, cudaMemcpyHostToDevice);
  new_mvnpdf_kernel1<<<dim3(1133U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
      *gpu_Mu, *gpu_X, *gpu_X0);
  //  Assume identity covariance, data are already standardized
  //  Special case: if Sigma is supplied, then use it to try to interpret
  //  X and Mu as row vectors if they were both column vectors.
  // Check that sigma is the right size
  //  Make sure Sigma is a valid covariance matrix
  // CHOLCOV  Cholesky-like decomposition for covariance matrix.
  //    T = CHOLCOV(SIGMA) computes T such that SIGMA = T'*T.  SIGMA must be
  //    square, symmetric, and positive semi-definite.  If SIGMA is positive
  //    definite, then T is the square, upper triangular Cholesky factor.
  //
  //    If SIGMA is not positive definite, T is computed from an eigenvalue
  //    decomposition of SIGMA.  T is not necessarily triangular or square in
  //    this case.  Any eigenvectors whose corresponding eigenvalue is close to
  //    zero (within a small tolerance) are omitted.  If any remaining
  //    eigenvalues are negative, T is empty.
  //
  //    [T,P] = CHOLCOV(SIGMA) returns the number of negative eigenvalues of
  //    SIGMA, and T is empty if P>0.  If P==0, SIGMA is positive semi-definite.
  //
  //    If SIGMA is not square and symmetric, P is NaN and T is empty.
  //
  //    [T,P] = CHOLCOV(SIGMA,0) returns P==0 if SIGMA is positive definite, and
  //    T is the Cholesky factor.  If SIGMA is not positive definite, P is a
  //    positive integer and T is empty.  [...] = CHOLCOV(SIGMA,1) is equivalent
  //    to [...] = CHOLCOV(SIGMA).
  //
  //    Example:
  //    Factor a rank-deficient covariance matrix C.
  //        C = [2 1 1 2;1 2 1 2;1 1 2 2;2 2 2 3]
  //        T = cholcov(C)
  //        C2 = T'*T
  //    Generate data with this covariance (aside from random variation).
  //        C3 = cov(randn(10000,3)*T)
  //
  //    See also CHOL.
  //    Copyright 1993-2009 The MathWorks, Inc.
  //  Test for square, symmetric
  cudaMemcpy(*gpu_Sigma, Sigma, 26912ULL, cudaMemcpyHostToDevice);
  new_mvnpdf_kernel2<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*gpu_Sigma,
                                                              *gpu_y);
  cudaMemcpy(b_y, *gpu_y, 464ULL, cudaMemcpyDeviceToHost);
  tol = b_y[0];
  for (vlen = 0; vlen < 57; vlen++) {
    real_T d;
    d = b_y[vlen + 1];
    if (std::isnan(d)) {
      p = false;
    } else if (std::isnan(tol)) {
      p = true;
    } else {
      p = (tol < d);
    }
    if (p) {
      tol = d;
    }
  }
  if ((!std::isinf(tol)) && (!std::isnan(tol))) {
    if (tol <= 2.2250738585072014E-308) {
      tol = 4.94065645841247E-324;
    } else {
      frexp(tol, &i2);
      tol = std::ldexp(1.0, i2 - 53);
    }
  } else {
    tol = rtNaN;
  }
  tol *= 10.0;
  new_mvnpdf_kernel3<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_Sigma,
                                                               *gpu_x);
  new_mvnpdf_kernel4<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_x,
                                                               *b_gpu_y);
  new_mvnpdf_kernel5<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*c_gpu_y);
  cudaMemcpy(gpu_tol, &tol, 8ULL, cudaMemcpyHostToDevice);
  new_mvnpdf_kernel6<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
      *b_gpu_y, 1, gpu_tol, *c_gpu_y);
  y_dirtyOnGpu = true;
  p = true;
  rankA = 0;
  exitg1 = false;
  while ((!exitg1) && (rankA < 58)) {
    if (y_dirtyOnGpu) {
      cudaMemcpy(c_y, *c_gpu_y, 58ULL, cudaMemcpyDeviceToHost);
    }
    y_dirtyOnGpu = false;
    if (!c_y[rankA]) {
      p = false;
      exitg1 = true;
    } else {
      rankA++;
    }
  }
  if (p) {
    new_mvnpdf_kernel7<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_Sigma,
                                                                 *gpu_x);
    cusolverDnDpotrf_bufferSize(
        getCuSolverGlobalHandle(), CUBLAS_FILL_MODE_UPPER, 58,
        (double *)&(*gpu_x)[0], 58, getCuSolverWorkspaceReq());
    setCuSolverWorkspaceTypeSize(8);
    cusolverInitWorkspace();
    cusolverDnDpotrf(getCuSolverGlobalHandle(), CUBLAS_FILL_MODE_UPPER, 58,
                     (double *)&(*gpu_x)[0], 58,
                     static_cast<real_T *>(getCuSolverWorkspaceBuff()),
                     *getCuSolverWorkspaceReq(), gpu_info_t);
    y_dirtyOnGpu = false;
    p = true;
    cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
    if (info_t < 0) {
      new_mvnpdf_kernel8<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_x);
    }
    if (info_t == 0) {
      i2 = 56;
    } else {
      i2 = info_t - 3;
    }
    for (rankA = 0; rankA <= i2; rankA++) {
      for (vlen = 0; vlen <= i2 - rankA; vlen++) {
        if (p) {
          cudaMemcpy(x, *gpu_x, 26912ULL, cudaMemcpyDeviceToHost);
        }
        x[((rankA + vlen) + 58 * rankA) + 1] = 0.0;
        p = false;
        y_dirtyOnGpu = true;
      }
    }
    if (i2 + 2 < 1) {
      rankA = -1;
      i2 = -1;
    } else {
      rankA = i2 + 1;
      i2++;
    }
    T_size[0] = rankA + 1;
    T_size[1] = i2 + 1;
    validLaunchParams =
        mwGetLaunchParameters1D(static_cast<real_T>((rankA + 1LL) * (i2 + 1LL)),
                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      cudaMemcpy(gpu_rankA, &rankA, 4ULL, cudaMemcpyHostToDevice);
      cudaMemcpy(gpu_i2, &i2, 4ULL, cudaMemcpyHostToDevice);
      if (y_dirtyOnGpu) {
        cudaMemcpy(*gpu_x, x, 26912ULL, cudaMemcpyHostToDevice);
      }
      new_mvnpdf_kernel9<<<grid, block>>>(rankA + 1, gpu_rankA, gpu_i2, *gpu_x,
                                          *gpu_T_data);
    }
    tol = info_t;
    tol_dirtyOnCpu = true;
    if (info_t > 0) {
      //  Test for positive definiteness
      T_size[0] = 0;
      T_size[1] = 0;
    }
  } else {
    T_size[0] = 0;
    T_size[1] = 0;
    tol = rtNaN;
    tol_dirtyOnCpu = true;
  }
  if (tol != 0.0) {
    d_y = nullptr;
    m = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 26, m, &varargin_1[0]);
    emlrtAssign(&d_y, m);
    e_y = nullptr;
    m = emlrtCreateCharArray(2, &iv1[0]);
    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 46, m, &varargin_2[0]);
    emlrtAssign(&e_y, m);
    b_error(d_y, e_y, &emlrtMCI);
  }
  //  Create array of standardized data, and compute log(sqrt(det(Sigma)))
  i2 = T_size[0] * T_size[1] - 1;
  validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(i2 + 1LL),
                                              &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    new_mvnpdf_kernel10<<<grid, block>>>(*gpu_T_data, i2, *gpu_A_data);
    A_data_dirtyOnGpu = true;
  }
  if (T_size[0] == 0) {
    vlen = 0;
  } else if (T_size[0] == 58) {
    boolean_T i2_dirtyOnCpu;
    cusolverDnDgetrf_bufferSize(getCuSolverGlobalHandle(), 58, 58,
                                (double *)&(*gpu_A_data)[0], 58,
                                getCuSolverWorkspaceReq());
    setCuSolverWorkspaceTypeSize(8);
    cusolverInitWorkspace();
    cusolverDnDgetrf(getCuSolverGlobalHandle(), 58, 58,
                     (double *)&(*gpu_A_data)[0], 58,
                     static_cast<real_T *>(getCuSolverWorkspaceBuff()),
                     &(*gpu_ipiv_t)[0], gpu_info_t);
    cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
    if (info_t < 0) {
      i2 = 58 * T_size[1] - 1;
      validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(i2 + 1LL),
                                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        new_mvnpdf_kernel23<<<grid, block>>>(i2, *gpu_A_data);
      }
      new_mvnpdf_kernel24<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
          *gpu_ipiv_data);
      p = true;
    } else {
      new_mvnpdf_kernel22<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
          *gpu_ipiv_t, *gpu_ipiv_data);
      p = true;
    }
    tol = 1.0;
    cublasDtrsm(getCublasGlobalHandle(), CUBLAS_SIDE_RIGHT,
                CUBLAS_FILL_MODE_UPPER, CUBLAS_OP_N, CUBLAS_DIAG_NON_UNIT,
                10000, 58, (double *)&tol, (double *)&(*gpu_A_data)[0], 58,
                (double *)&(*gpu_X0)[0], 10000);
    tol = 1.0;
    cublasDtrsm(getCublasGlobalHandle(), CUBLAS_SIDE_RIGHT,
                CUBLAS_FILL_MODE_LOWER, CUBLAS_OP_N, CUBLAS_DIAG_UNIT, 10000,
                58, (double *)&tol, (double *)&(*gpu_A_data)[0], 58,
                (double *)&(*gpu_X0)[0], 10000);
    y_dirtyOnGpu = false;
    i2_dirtyOnCpu = true;
    for (rankA = 0; rankA < 57; rankA++) {
      if (p) {
        cudaMemcpy(ipiv_data, *gpu_ipiv_data, 232ULL, cudaMemcpyDeviceToHost);
      }
      p = false;
      i2 = ipiv_data[56 - rankA];
      if (i2 != 57 - rankA) {
        for (vlen = 0; vlen < 10000; vlen++) {
          if (i2_dirtyOnCpu) {
            cudaMemcpy(SD->f0.X0, *gpu_X0, 4640000ULL, cudaMemcpyDeviceToHost);
          }
          tol = SD->f0.X0[vlen + 10000 * (56 - rankA)];
          SD->f0.X0[vlen + 10000 * (56 - rankA)] =
              SD->f0.X0[vlen + 10000 * (i2 - 1)];
          SD->f0.X0[vlen + 10000 * (i2 - 1)] = tol;
          i2_dirtyOnCpu = false;
          y_dirtyOnGpu = true;
        }
      }
    }
    vlen = 58;
    if (y_dirtyOnGpu) {
      cudaMemcpy(*gpu_X0, SD->f0.X0, 4640000ULL, cudaMemcpyHostToDevice);
    }
    new_mvnpdf_kernel25<<<dim3(1133U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        *gpu_X0, *gpu_xRinv_data);
  } else {
    ptrdiff_t b_info_t;
    boolean_T i2_dirtyOnCpu;
    i2 = T_size[0];
    i2_dirtyOnCpu = true;
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>(((T_size[1] - 1) + 1LL) * ((T_size[0] - 1) + 1LL)),
        &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      new_mvnpdf_kernel11<<<grid, block>>>(
          *gpu_T_data, T_size[0], T_size[1] - 1, T_size[0] - 1, *gpu_A_data);
      A_data_dirtyOnGpu = true;
    }
    new_mvnpdf_kernel12<<<dim3(1133U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_X0,
                                                                     *gpu_B);
    validLaunchParams =
        mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      cudaMemcpy(gpu_i2, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
      i2_dirtyOnCpu = false;
      new_mvnpdf_kernel13<<<grid, block>>>(gpu_i2, *gpu_jpvt_t_data,
                                           *gpu_ipiv_t);
      jpvt_t_data_dirtyOnGpu = true;
    }
    if (A_data_dirtyOnGpu) {
      cudaMemcpy(A_data, *gpu_A_data, 26912ULL, cudaMemcpyDeviceToHost);
    }
    if (jpvt_t_data_dirtyOnGpu) {
      cudaMemcpy(jpvt_t_data, *gpu_jpvt_t_data, 464ULL, cudaMemcpyDeviceToHost);
    }
    b_info_t =
        LAPACKE_dgeqp3(102, (ptrdiff_t)58, (ptrdiff_t)T_size[0], &A_data[0],
                       (ptrdiff_t)58, &jpvt_t_data[0], &b_y[0]);
    p = true;
    A_data_dirtyOnGpu = false;
    y_dirtyOnGpu = true;
    if ((int32_T)b_info_t != 0) {
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(58LL * ((T_size[0] - 1) + 1LL)), &grid, &block,
          1024U, 65535U);
      if (validLaunchParams) {
        if (i2_dirtyOnCpu) {
          cudaMemcpy(gpu_i2, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
        }
        i2_dirtyOnCpu = false;
        cudaMemcpy(*gpu_A_data, A_data, 26912ULL, cudaMemcpyHostToDevice);
        new_mvnpdf_kernel15<<<grid, block>>>(gpu_i2, *gpu_A_data);
        y_dirtyOnGpu = false;
        A_data_dirtyOnGpu = true;
      }
      validLaunchParams =
          mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        if (i2_dirtyOnCpu) {
          cudaMemcpy(gpu_i2, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
        }
        i2_dirtyOnCpu = false;
        cudaMemcpy(*gpu_y, b_y, 464ULL, cudaMemcpyHostToDevice);
        new_mvnpdf_kernel16<<<grid, block>>>(gpu_i2, *gpu_y);
        p = false;
      }
      validLaunchParams =
          mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        if (i2_dirtyOnCpu) {
          cudaMemcpy(gpu_i2, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
        }
        new_mvnpdf_kernel17<<<grid, block>>>(gpu_i2, *gpu_ipiv_t);
      }
    } else {
      validLaunchParams =
          mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(*gpu_jpvt_t_data, jpvt_t_data, 464ULL,
                   cudaMemcpyHostToDevice);
        if (i2_dirtyOnCpu) {
          cudaMemcpy(gpu_i2, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
        }
        new_mvnpdf_kernel14<<<grid, block>>>(*gpu_jpvt_t_data, gpu_i2,
                                             *gpu_ipiv_t);
      }
    }
    rankA = 0;
    if (A_data_dirtyOnGpu) {
      cudaMemcpy(A_data, *gpu_A_data, 26912ULL, cudaMemcpyDeviceToHost);
    }
    tol = 1.2878587085651816E-13 * std::abs(A_data[0]);
    while ((rankA < i2) && (!(std::abs(A_data[rankA + 58 * rankA]) <= tol))) {
      rankA++;
    }
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((static_cast<int16_T>(T_size[0]) * 10000 - 1) +
                            1LL),
        &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      new_mvnpdf_kernel18<<<grid, block>>>(static_cast<int16_T>(T_size[0]),
                                           *gpu_Y_data);
    }
    info_t = 0;
    if (y_dirtyOnGpu) {
      cudaMemcpy(*gpu_A_data, A_data, 26912ULL, cudaMemcpyHostToDevice);
    }
    if (p) {
      cudaMemcpy(*gpu_y, b_y, 464ULL, cudaMemcpyHostToDevice);
    }
    cusolverDnDormqr_bufferSize(
        getCuSolverGlobalHandle(), CUBLAS_SIDE_LEFT, CUBLAS_OP_T, 58, 10000,
        T_size[0], (double *)&(*gpu_A_data)[0], 58, (double *)&(*gpu_y)[0],
        (double *)&(*gpu_B)[0], 58, getCuSolverWorkspaceReq());
    setCuSolverWorkspaceTypeSize(8);
    cusolverInitWorkspace();
    cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
    cusolverDnDormqr(getCuSolverGlobalHandle(), CUBLAS_SIDE_LEFT, CUBLAS_OP_T,
                     58, 10000, T_size[0], (double *)&(*gpu_A_data)[0], 58,
                     (double *)&(*gpu_y)[0], (double *)&(*gpu_B)[0], 58,
                     static_cast<real_T *>(getCuSolverWorkspaceBuff()),
                     *getCuSolverWorkspaceReq(), gpu_info_t);
    cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
    if (info_t < 0) {
      new_mvnpdf_kernel19<<<dim3(1133U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_B);
    }
    cudaMemcpy(gpu_rankA, &rankA, 4ULL, cudaMemcpyHostToDevice);
    new_mvnpdf_kernel20<<<dim3(20U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        T_size[0], gpu_rankA, *gpu_A_data, *gpu_B, *gpu_ipiv_t, *gpu_Y_data);
    vlen = T_size[0];
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>(10000LL * ((T_size[0] - 1) + 1LL)), &grid, &block,
        1024U, 65535U);
    if (validLaunchParams) {
      new_mvnpdf_kernel21<<<grid, block>>>(*gpu_Y_data, T_size[0],
                                           T_size[0] - 1, *gpu_xRinv_data);
    }
  }
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<real_T>((T_size[0] - 1) + 1LL), &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    cudaMemcpy(gpu_i2, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
    new_mvnpdf_kernel26<<<grid, block>>>(*gpu_T_data, T_size[0], gpu_i2,
                                         *gpu_y);
  }
  i2 = T_size[0] - 1;
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<real_T>((T_size[0] - 1) + 1LL), &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    cudaMemcpy(gpu_i2, &i2, 4ULL, cudaMemcpyHostToDevice);
    new_mvnpdf_kernel27<<<grid, block>>>(gpu_i2, *gpu_y);
  }
  if (T_size[0] == 0) {
    tol = 0.0;
  } else {
    cudaMemcpy(gpu_tol, &tol, 8ULL, cudaMemcpyHostToDevice);
    new_mvnpdf_kernel28<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_y,
                                                                 gpu_tol);
    tol_dirtyOnCpu = false;
    validLaunchParams =
        mwGetLaunchParameters(static_cast<real_T>((T_size[0] - 2) + 1LL), &grid,
                              &block, 1024U, 65535U);
    if (validLaunchParams) {
      cudaMemcpy(gpu_info_t, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
      new_mvnpdf_kernel29<<<grid, block>>>(gpu_info_t, *gpu_y, gpu_tol);
    }
  }
  //  The quadratic form is the inner products of the standardized data
  i2 = 10000 * vlen - 1;
  validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(i2 + 1LL),
                                              &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    cudaMemcpy(gpu_i2, &i2, 4ULL, cudaMemcpyHostToDevice);
    new_mvnpdf_kernel30<<<grid, block>>>(*gpu_xRinv_data, gpu_i2, *gpu_y_data);
  }
  if (vlen == 0) {
    new_mvnpdf_kernel33<<<dim3(20U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*d_gpu_y);
  } else {
    new_mvnpdf_kernel31<<<dim3(20U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_y_data,
                                                                   *d_gpu_y);
    for (rankA = 0; rankA <= vlen - 2; rankA++) {
      i2 = (rankA + 1) * 10000;
      cudaMemcpy(gpu_i2, &i2, 4ULL, cudaMemcpyHostToDevice);
      new_mvnpdf_kernel32<<<dim3(20U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
          *gpu_y_data, gpu_i2, *d_gpu_y);
    }
  }
  if (tol_dirtyOnCpu) {
    cudaMemcpy(gpu_tol, &tol, 8ULL, cudaMemcpyHostToDevice);
  }
  new_mvnpdf_kernel34<<<dim3(20U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_tol,
                                                                 *d_gpu_y);
  cudaMemcpy(y, *d_gpu_y, 80000ULL, cudaMemcpyDeviceToHost);
  cudaFree(*gpu_Mu);
  cudaFree(*gpu_X);
  cudaFree(*gpu_X0);
  cudaFree(*gpu_Sigma);
  cudaFree(*gpu_y);
  cudaFree(*gpu_x);
  cudaFree(*b_gpu_y);
  cudaFree(*c_gpu_y);
  cudaFree(gpu_tol);
  cudaFree(gpu_info_t);
  cudaFree(*gpu_T_data);
  cudaFree(*gpu_A_data);
  cudaFree(gpu_rankA);
  cudaFree(gpu_i2);
  cudaFree(*gpu_ipiv_t);
  cudaFree(*gpu_ipiv_data);
  cudaFree(*gpu_B);
  cudaFree(*gpu_jpvt_t_data);
  cudaFree(*gpu_xRinv_data);
  cudaFree(*gpu_y_data);
  cudaFree(*d_gpu_y);
  cudaFree(*gpu_Y_data);
}

// End of code generation (new_mvnpdf.cu)
