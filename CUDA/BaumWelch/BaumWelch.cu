//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// BaumWelch.cu
//
// Code generation for function 'BaumWelch'
//

// Include files
#include "BaumWelch.h"
#include "BaumWelch_data.h"
#include "BaumWelch_emxutil.h"
#include "BaumWelch_types.h"
#include "div.h"
#include "rt_nonfinite.h"
#include "tic.h"
#include "toc.h"
#include "MWCUBLASUtils.hpp"
#include "MWCUSOLVERUtils.hpp"
#include "MWCudaDimUtility.hpp"
#include "MWLaunchParametersUtilities.hpp"
#include "emlrt.h"
#include "lapacke.h"
#include "math_constants.h"
#include <cmath>
#include <cstddef>
#include <cstring>
#include <math.h>

// Type Definitions
struct emxArray_real_T_1000 {
  real_T data[1000];
  int32_T size[1];
};

struct cell_wrap_0 {
  emxArray_real_T_1000 f1;
};

// Variable Definitions
static emlrtMCInfo emlrtMCI{
    27,      // lineNo
    5,       // colNo
    "error", // fName
    "C:\\Program "
    "Files\\MATLAB\\R2022a\\toolbox\\eml\\lib\\matlab\\lang\\error.m" // pName
};

static emlrtRTEInfo emlrtRTEI{
    37,          // lineNo
    6,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo b_emlrtRTEI{
    38,          // lineNo
    1,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo c_emlrtRTEI{
    103,    // lineNo
    24,     // colNo
    "rand", // fName
    "C:\\Program "
    "Files\\MATLAB\\R2022a\\toolbox\\eml\\lib\\matlab\\randfun\\rand.m" // pName
};

static emlrtRTEInfo d_emlrtRTEI{
    46,          // lineNo
    1,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo e_emlrtRTEI{
    50,          // lineNo
    18,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo f_emlrtRTEI{
    170,                     // lineNo
    24,                      // colNo
    "combineVectorElements", // fName
    "C:\\Program "
    "Files\\MATLAB\\R2022a\\toolbox\\eml\\lib\\matlab\\datafun\\private\\combin"
    "eVectorElements.m" // pName
};

static emlrtRTEInfo g_emlrtRTEI{
    20,    // lineNo
    1,     // colNo
    "sum", // fName
    "C:\\Program "
    "Files\\MATLAB\\R2022a\\toolbox\\eml\\lib\\matlab\\datafun\\sum.m" // pName
};

static emlrtRTEInfo h_emlrtRTEI{
    50,          // lineNo
    14,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo k_emlrtRTEI{
    57,          // lineNo
    9,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo l_emlrtRTEI{
    1,           // lineNo
    33,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo m_emlrtRTEI{
    66,          // lineNo
    5,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo n_emlrtRTEI{
    70,          // lineNo
    16,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo o_emlrtRTEI{
    82,          // lineNo
    5,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo p_emlrtRTEI{
    75,          // lineNo
    28,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo q_emlrtRTEI{
    78,          // lineNo
    20,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo r_emlrtRTEI{
    92,          // lineNo
    5,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo s_emlrtRTEI{
    86,          // lineNo
    27,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo t_emlrtRTEI{
    102,         // lineNo
    5,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo u_emlrtRTEI{
    100,         // lineNo
    19,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo v_emlrtRTEI{
    107,         // lineNo
    5,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo w_emlrtRTEI{
    110,         // lineNo
    40,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo x_emlrtRTEI{
    57,          // lineNo
    5,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo y_emlrtRTEI{
    63,          // lineNo
    7,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

static emlrtRTEInfo ab_emlrtRTEI{
    110,         // lineNo
    28,          // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

// Function Declarations
static __global__ void BaumWelch_kernel1(const real_T X[58000],
                                         int32_T idx[1000]);

static __global__ void BaumWelch_kernel10(const int32_T x_size_dim0,
                                          real_T x_data[58000], real_T x[58]);

static __global__ void BaumWelch_kernel11(const int32_T x_size_dim0,
                                          real_T x_data[58000], real_T *muj);

static __global__ void BaumWelch_kernel12(real_T *muj, real_T x[58]);

static __global__ void BaumWelch_kernel13(real_T *muj, real_T dv_data[3364]);

static __global__ void BaumWelch_kernel14(const int8_T dv_size_dim0,
                                          const int32_T i, real_T dv_data[3364],
                                          emxArray_real_T Cov);

static __global__ void
BaumWelch_kernel15(const real_T X[58000], const cell_wrap_0 idx1[4],
                   const int32_T i, const int32_T x_size_dim0,
                   const int32_T b_idx1, real_T x_data[58000]);

static __global__ void BaumWelch_kernel16(const int32_T vlen,
                                          const cell_wrap_0 idx1[4],
                                          const int32_T i, real_T x_data[58000],
                                          real_T y[58]);

static __global__ void BaumWelch_kernel17(real_T y[58]);

static __global__ void BaumWelch_kernel18(const int32_T *m, const real_T y[58],
                                          const int32_T i,
                                          const int32_T Mu_dim0,
                                          emxArray_real_T Mu);

static __global__ void BaumWelch_kernel19(int32_T kEnd, real_T *muj,
                                          emxArray_real_T Pi);

static __global__ void BaumWelch_kernel2(const int32_T idx[1000],
                                         const real_T N, int32_T i,
                                         cell_wrap_0 idx1[4]);

static __global__ void BaumWelch_kernel20(const emxArray_real_T trans,
                                          const int32_T b_trans,
                                          int32_T c_trans, const int32_T x_dim0,
                                          const int32_T trans_dim0,
                                          emxArray_real_T x);

static __global__ void BaumWelch_kernel21(const int32_T vlen,
                                          const emxArray_real_T x, int32_T *LDA,
                                          const int32_T x_dim0,
                                          emxArray_real_T y);

static __global__ void BaumWelch_kernel22(int32_T sz, emxArray_real_T y);

static __global__ void BaumWelch_kernel23(const emxArray_real_T y, int32_T b_y,
                                          emxArray_real_T c_y);

static __global__ void
BaumWelch_kernel24(const emxArray_real_T y, const emxArray_real_T trans,
                   const int32_T b_trans, int32_T c_trans,
                   const int32_T trans_dim0, const int32_T b_trans_dim0,
                   emxArray_real_T d_trans);

static __global__ void BaumWelch_kernel25(const emxArray_real_T trans,
                                          int32_T b_trans,
                                          emxArray_real_T c_trans);

static __global__ void BaumWelch_kernel26(const emxArray_real_T Cov,
                                          const int32_T i, real_T C[3364]);

static __global__ void BaumWelch_kernel27(const emxArray_real_T Mu,
                                          const int32_T i,
                                          const real_T X[58000],
                                          const int32_T Mu_dim0,
                                          real_T X0[58000]);

static __global__ void BaumWelch_kernel28(const emxArray_real_T Cov,
                                          const int32_T i, real_T x[58]);

static __global__ void BaumWelch_kernel29(const emxArray_real_T Cov,
                                          const int32_T i, real_T x[3364]);

static __global__ void BaumWelch_kernel3(real_T N, emxArray_real_T Cov);

static __global__ void BaumWelch_kernel30(const real_T x[3364], real_T y[3364]);

static __global__ void BaumWelch_kernel31(boolean_T y[58]);

static __global__ void BaumWelch_kernel32(const int32_T initAuxVar, real_T *muj,
                                          real_T y[3364], boolean_T b_y[58]);

static __global__ void BaumWelch_kernel33(real_T C[3364]);

static __global__ void BaumWelch_kernel34(const int32_T T_size_dim0,
                                          const int32_T *LDA, int32_T *m,
                                          real_T C[3364], real_T T_data[3364]);

static __global__ void BaumWelch_kernel35(const real_T T_data[3364],
                                          int32_T T_size, real_T dv_data[3364]);

static __global__ void BaumWelch_kernel36(const real_T T_data[3364],
                                          const int32_T T_size_dim0,
                                          const int32_T T_size,
                                          int32_T b_T_size,
                                          real_T dv_data[3364]);

static __global__ void BaumWelch_kernel37(real_T X0[58000], real_T B[58000]);

static __global__ void BaumWelch_kernel38(int32_T *m, int32_T ipiv_t[58]);

static __global__ void BaumWelch_kernel39(int32_T *m,
                                          ptrdiff_t jpvt_t_data[58]);

static __global__ void
BaumWelch_kernel4(const real_T X[58000], const cell_wrap_0 idx1[4],
                  const int32_T i, const int32_T x_size_dim0,
                  const int32_T b_idx1, real_T x_data[58000]);

static __global__ void BaumWelch_kernel40(const ptrdiff_t jpvt_t_data[58],
                                          int32_T *m, int32_T ipiv_t[58]);

static __global__ void BaumWelch_kernel41(int32_T *m, real_T dv_data[3364]);

static __global__ void BaumWelch_kernel42(int32_T *m, real_T x[58]);

static __global__ void BaumWelch_kernel43(int32_T *m, int32_T ipiv_t[58]);

static __global__ void BaumWelch_kernel44(int16_T iv4_idx_0,
                                          real_T Y_data[58000]);

static __global__ void BaumWelch_kernel45(real_T B[58000]);

static __global__ void BaumWelch_kernel46(const int32_T Y_size_dim0,
                                          const int32_T *LDA,
                                          real_T dv_data[3364], real_T B[58000],
                                          int32_T ipiv_t[58],
                                          real_T Y_data[58000]);

static __global__ void BaumWelch_kernel47(const real_T Y_data[58000],
                                          const int32_T Y_size_dim0,
                                          int32_T Y_size,
                                          real_T xRinv_data[58000]);

static __global__ void BaumWelch_kernel48(int32_T ipiv_t[58],
                                          int32_T ipiv_data[58]);

static __global__ void BaumWelch_kernel49(int32_T x_size, real_T dv_data[3364]);

static __global__ void BaumWelch_kernel5(real_T C[3364]);

static __global__ void BaumWelch_kernel50(int32_T ipiv_data[58]);

static __global__ void BaumWelch_kernel51(real_T X0[58000],
                                          real_T xRinv_data[58000]);

static __global__ void BaumWelch_kernel52(const real_T T_data[3364],
                                          const int32_T T_size_dim0, int32_T *m,
                                          real_T x[58]);

static __global__ void BaumWelch_kernel53(int32_T *m, real_T x[58]);

static __global__ void BaumWelch_kernel54(real_T x[58], real_T *muj);

static __global__ void BaumWelch_kernel55(int32_T vlen, real_T x[58],
                                          real_T *muj);

static __global__ void BaumWelch_kernel56(const real_T xRinv_data[58000],
                                          int32_T *m, real_T y_data[58000]);

static __global__ void BaumWelch_kernel57(const real_T y_data[58000],
                                          real_T quadform[1000]);

static __global__ void BaumWelch_kernel58(const real_T y_data[58000],
                                          const int32_T *LDA,
                                          real_T quadform[1000]);

static __global__ void BaumWelch_kernel59(real_T quadform[1000]);

static __global__ void BaumWelch_kernel6(const int32_T x_size_dim0,
                                         const int32_T *m,
                                         real_T x_data[58000]);

static __global__ void BaumWelch_kernel60(const real_T quadform[1000],
                                          const int32_T i, real_T *muj,
                                          emxArray_real_T B);

static __global__ void BaumWelch_kernel61(const emxArray_int32_T iv1,
                                          int32_T kEnd, emxArray_real_T B);

static __global__ void BaumWelch_kernel62(real_T N, emxArray_real_T alpha);

static __global__ void BaumWelch_kernel63(real_T scale[1000]);

static __global__ void BaumWelch_kernel64(const emxArray_real_T B,
                                          const emxArray_real_T Pi,
                                          int32_T b_Pi, emxArray_real_T alpha);

static __global__ void BaumWelch_kernel65(real_T *muj, real_T scale[1000]);

static __global__ void BaumWelch_kernel66(const emxArray_real_T alpha,
                                          int32_T kEnd, real_T *muj,
                                          emxArray_real_T b_alpha);

static __global__ void BaumWelch_kernel67(const emxArray_real_T alpha,
                                          int32_T b_alpha,
                                          emxArray_real_T c_alpha);

static __global__ void BaumWelch_kernel68(
    const int32_T i, const emxArray_real_T trans, const emxArray_real_T alpha,
    int32_T kEnd, const int32_T trans_dim0, int32_T *info_t, emxArray_real_T x);

static __global__ void BaumWelch_kernel69(const emxArray_real_T B,
                                          const int32_T i, real_T *muj,
                                          int32_T *info_t,
                                          emxArray_real_T alpha);

static __global__ void BaumWelch_kernel7(real_T C[3364]);

static __global__ void BaumWelch_kernel70(real_T *muj, int32_T *info_t,
                                          real_T scale[1000]);

static __global__ void BaumWelch_kernel71(const emxArray_real_T alpha,
                                          const int32_T *m, int32_T kEnd,
                                          real_T *muj, emxArray_real_T b_alpha);

static __global__ void BaumWelch_kernel72(const emxArray_real_T alpha,
                                          const int32_T *LDA, int32_T b_alpha,
                                          emxArray_real_T c_alpha);

static __global__ void BaumWelch_kernel73(real_T N, emxArray_real_T beta);

static __global__ void BaumWelch_kernel74(const real_T scale[1000],
                                          int32_T unnamed_idx_1,
                                          emxArray_real_T beta);

static __global__ void
BaumWelch_kernel75(const emxArray_real_T beta, const int32_T vlen,
                   const emxArray_real_T B, const int32_T kEnd,
                   const emxArray_real_T trans, const int32_T i, int32_T *LDA,
                   const int32_T trans_dim0, emxArray_real_T x);

static __global__ void BaumWelch_kernel76(const real_T scale[1000],
                                          const int32_T i, real_T *muj,
                                          int32_T *info_t,
                                          emxArray_real_T beta);

static __global__ void BaumWelch_kernel77(real_T N, emxArray_real_T Xi);

static __global__ void
BaumWelch_kernel78(const emxArray_real_T beta, const emxArray_real_T B,
                   const emxArray_real_T trans, const emxArray_real_T alpha,
                   const real_T N, int32_T i11, const int32_T Xi_dim1,
                   const int32_T trans_dim0, int32_T *info_t,
                   emxArray_real_T Xi);

static __global__ void
BaumWelch_kernel79(const emxArray_real_T Xi, const int32_T kEnd, int32_T vlen,
                   const int32_T Xi_dim1, const int32_T b_Xi_dim1, real_T *muj,
                   int32_T *info_t, emxArray_real_T b_Xi);

static __global__ void BaumWelch_kernel8(real_T C[3364]);

static __global__ void
BaumWelch_kernel80(const emxArray_real_T Xi, const int32_T b_Xi, int32_T c_Xi,
                   const int32_T Xi_dim1, const int32_T b_Xi_dim1,
                   int32_T *info_t, emxArray_real_T d_Xi);

static __global__ void BaumWelch_kernel81(const emxArray_real_T Xi, int32_T *m,
                                          emxArray_real_T Gamma);

static __global__ void BaumWelch_kernel82(const emxArray_real_T Xi,
                                          const int32_T *LDA, int32_T *m,
                                          emxArray_real_T Gamma);

static __global__ void BaumWelch_kernel83(int32_T sz, emxArray_real_T Gamma);

static __global__ void BaumWelch_kernel84(const emxArray_real_T Gamma,
                                          int32_T kEnd, emxArray_real_T Pi);

static __global__ void BaumWelch_kernel85(const emxArray_real_T Xi,
                                          const int32_T i, int32_T b_i,
                                          const int32_T Xi_dim1,
                                          emxArray_real_T a);

static __global__ void BaumWelch_kernel86(const emxArray_real_T a, int32_T *LDA,
                                          emxArray_real_T y);

static __global__ void BaumWelch_kernel87(const emxArray_real_T y,
                                          const int32_T i, int32_T b_y,
                                          const int32_T trans_dim0, real_T *muj,
                                          emxArray_real_T trans);

static __global__ void BaumWelch_kernel88(const emxArray_real_T Gamma,
                                          const int32_T i,
                                          const real_T X[58000],
                                          real_T x[57942]);

static __global__ void BaumWelch_kernel89(const real_T x[57942], real_T y[58]);

static __global__ void BaumWelch_kernel9(real_T C[3364], real_T dv_data[3364]);

static __global__ void BaumWelch_kernel90(const real_T y[58], const int32_T i,
                                          const int32_T Mu_dim0, real_T *muj,
                                          emxArray_real_T Mu);

static __global__ void BaumWelch_kernel91(const emxArray_real_T Mu,
                                          const int32_T i,
                                          const real_T X[58000],
                                          const int32_T Mu_dim0,
                                          real_T d[57942]);

static __global__ void BaumWelch_kernel92(const emxArray_real_T Gamma,
                                          const int32_T i, real_T d[57942],
                                          real_T A[57942]);

static __global__ void BaumWelch_kernel93(const int32_T i, real_T *muj,
                                          real_T y[3364], emxArray_real_T Cov);

static __global__ void BaumWelch_kernel94(const int32_T iwork[1000],
                                          const int32_T j, int32_T kEnd,
                                          int32_T idx[1000]);

static __device__ real_T atomicOpreal_T(real_T *address, real_T value);

static void b_error(const mxArray *m, const mxArray *m1, emlrtMCInfo *location);

static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in3,
                             const emxArray_real_T *in4);

static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2,
                             int32_T in3, const emxArray_real_T *in4,
                             int32_T in5);

static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2,
                             int32_T in3, const emxArray_real_T *in4,
                             int32_T in5, const emxArray_real_T *in6);

static void gpuEmxEnsureCapacity_int32_T(const emxArray_int32_T *cpu,
                                         emxArray_int32_T *gpu);

static void gpuEmxEnsureCapacity_real_T(const emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

static void gpuEmxFree_int32_T(emxArray_int32_T *gpu);

static void gpuEmxFree_real_T(emxArray_real_T *gpu);

static void gpuEmxMemcpyCpuToGpu_int32_T(emxArray_int32_T *gpu,
                                         const emxArray_int32_T *cpu);

static void gpuEmxMemcpyCpuToGpu_real_T(emxArray_real_T *gpu,
                                        const emxArray_real_T *cpu);

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu,
                                        emxArray_real_T *gpu);

static void gpuEmxReset_int32_T(emxArray_int32_T *gpu);

static void gpuEmxReset_real_T(emxArray_real_T *gpu);

static __device__ real_T shflDown2(real_T in1, uint32_T offset, uint32_T mask);

static __device__ real_T threadGroupReduction(real_T val, uint32_T lane,
                                              uint32_T mask);

static __device__ real_T workGroupReduction(real_T val, uint32_T mask,
                                            uint32_T numActiveWarps);

// Function Definitions
static __global__
    __launch_bounds__(512, 1) void BaumWelch_kernel1(const real_T X[58000],
                                                     int32_T idx[1000])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 500) {
    int32_T j;
    boolean_T exitg1;
    boolean_T p;
    //  Find the initial means and covariance matrices for each of the states
    //  Split the observations into evenly size states from smallest to largest
    // [idx]=Divide(X,N,'sort');
    k = (k << 1) + 1;
    p = true;
    j = 1;
    exitg1 = false;
    while ((!static_cast<int32_T>(exitg1)) && (static_cast<int32_T>(j < 59))) {
      if ((static_cast<int32_T>(X[(k + 1000 * (j - 1)) - 1] ==
                                X[k + 1000 * (j - 1)])) ||
          (static_cast<int32_T>(
              (static_cast<int32_T>(isnan(X[(k + 1000 * (j - 1)) - 1]))) &&
              (static_cast<int32_T>(isnan(X[k + 1000 * (j - 1)])))))) {
        j++;
      } else {
        if ((!static_cast<int32_T>(X[(k + 1000 * (j - 1)) - 1] <=
                                   X[k + 1000 * (j - 1)])) &&
            (!static_cast<int32_T>(isnan(X[k + 1000 * (j - 1)])))) {
          p = false;
        }
        exitg1 = true;
      }
    }
    if (p) {
      idx[k - 1] = k;
      idx[k] = k + 1;
    } else {
      idx[k - 1] = k + 1;
      idx[k] = k;
    }
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel10(
    const int32_T x_size_dim0, real_T x_data[58000], real_T x[58])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 58) {
    x[xpageoffset] = x_data[x_size_dim0 * xpageoffset];
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel11(
    const int32_T x_size_dim0, real_T x_data[58000], real_T *muj)
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
  if (static_cast<uint32_T>(mwGetBlockIndex()) == 58U / blockStride) {
    int32_T m;
    m = static_cast<int32_T>(58U % blockStride);
    if (static_cast<uint32_T>(m) > 0U) {
      blockStride = static_cast<uint32_T>(m);
    }
  }
  blockStride = ((blockStride + warpSize) - 1U) / warpSize;
  if (threadId <= 57U) {
    tmpRed0 = x_data[x_size_dim0 * static_cast<int32_T>(threadId)];
  }
  mask = __ballot_sync(MAX_uint32_T, threadId <= 57U);
  for (uint32_T idx{threadId + threadStride}; idx <= 57U; idx += threadStride) {
    tmpRed0 += x_data[x_size_dim0 * static_cast<int32_T>(idx)];
  }
  tmpRed0 = workGroupReduction(tmpRed0, mask, blockStride);
  if ((static_cast<int32_T>(threadId <= 57U)) &&
      (static_cast<int32_T>(thBlkId == 0U))) {
    atomicOpreal_T(&muj[0], tmpRed0);
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel12(real_T *muj,
                                                                   real_T x[58])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 58) {
    x[i] -= *muj;
  }
}

static __global__
    __launch_bounds__(32, 1) void BaumWelch_kernel13(real_T *muj,
                                                     real_T dv_data[3364])
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    dv_data[0] = 0.017543859649122806 * *muj;
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel14(
    const int8_T dv_size_dim0, const int32_T i, real_T dv_data[3364],
    emxArray_real_T Cov)
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 58ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 58ULL);
  if ((static_cast<int32_T>(xpageoffset < 58)) &&
      (static_cast<int32_T>(k < 58))) {
    Cov.data[(k + 58 * xpageoffset) + 3364 * i] =
        dv_data[k + static_cast<int32_T>(dv_size_dim0) * xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel15(
    const real_T X[58000], const cell_wrap_0 idx1[4], const int32_T i,
    const int32_T x_size_dim0, const int32_T b_idx1, real_T x_data[58000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(b_idx1) + 1ULL) * 58ULL - 1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_idx1) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(b_idx1) + 1ULL));
    x_data[k + x_size_dim0 * xpageoffset] =
        X[(static_cast<int32_T>(idx1[i].f1.data[k]) + 1000 * xpageoffset) - 1];
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel16(
    const int32_T vlen, const cell_wrap_0 idx1[4], const int32_T i,
    real_T x_data[58000], real_T y[58])
{
  uint64_T threadId;
  int32_T b_i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  b_i = static_cast<int32_T>(threadId);
  if (b_i < 58) {
    int32_T xpageoffset;
    xpageoffset = b_i * idx1[i].f1.size[0];
    y[b_i] = x_data[xpageoffset];
    for (int32_T k{0}; k <= vlen - 2; k++) {
      y[b_i] += x_data[(xpageoffset + k) + 1];
    }
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel17(real_T y[58])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 58) {
    y[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel18(
    const int32_T *m, const real_T y[58], const int32_T i,
    const int32_T Mu_dim0, emxArray_real_T Mu)
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 58) {
    Mu.data[i + Mu_dim0 * xpageoffset] =
        y[xpageoffset] / static_cast<real_T>(*m);
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel19(
    int32_T kEnd, real_T *muj, emxArray_real_T Pi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(kEnd - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    Pi.data[xpageoffset] /= *muj;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel2(
    const int32_T idx[1000], const real_T N, int32_T i, cell_wrap_0 idx1[4])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(i);
  for (uint64_T b_idx{threadId}; b_idx <= loopEnd; b_idx += threadStride) {
    real_T d;
    real_T muj;
    int32_T b_i;
    int32_T i36;
    int32_T j;
    int32_T k;
    int32_T xpageoffset;
    b_i = static_cast<int32_T>(b_idx);
    d = floor(((static_cast<real_T>(b_i) + 1.0) - 1.0) * 1000.0 / N + 1.0);
    muj = floor((static_cast<real_T>(b_i) + 1.0) * 1000.0 / N);
    if (d > muj) {
      i36 = 1;
      xpageoffset = 0;
    } else {
      i36 = static_cast<int32_T>(d);
      xpageoffset = static_cast<int32_T>(muj);
    }
    j = i36 - 1;
    k = xpageoffset - 1;
    idx1[b_i].f1.size[0] = (xpageoffset - i36) + 1;
    for (xpageoffset = 0; xpageoffset <= k - j; xpageoffset++) {
      idx1[b_i].f1.data[xpageoffset] =
          static_cast<real_T>(idx[(i36 + xpageoffset) - 1]);
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel20(
    const emxArray_real_T trans, const int32_T b_trans, int32_T c_trans,
    const int32_T x_dim0, const int32_T trans_dim0, emxArray_real_T x)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(b_trans) + 1ULL) *
                (static_cast<uint64_T>(c_trans) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_trans) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(b_trans) + 1ULL));
    x.data[k + x_dim0 * xpageoffset] = trans.data[xpageoffset + trans_dim0 * k];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel21(
    const int32_T vlen, const emxArray_real_T x, int32_T *LDA,
    const int32_T x_dim0, emxArray_real_T y)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*LDA);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T xpageoffset;
    i = static_cast<int32_T>(idx);
    xpageoffset = i * x_dim0;
    y.data[i] = x.data[xpageoffset];
    for (int32_T k{0}; k <= vlen - 2; k++) {
      y.data[i] += x.data[(xpageoffset + k) + 1];
    }
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel22(int32_T sz,
                                                       emxArray_real_T y)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(sz);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    y.data[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel23(
    const emxArray_real_T y, int32_T b_y, emxArray_real_T c_y)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_y);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    c_y.data[xpageoffset] = y.data[xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel24(
    const emxArray_real_T y, const emxArray_real_T trans, const int32_T b_trans,
    int32_T c_trans, const int32_T trans_dim0, const int32_T b_trans_dim0,
    emxArray_real_T d_trans)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(b_trans) + 1ULL) *
                (static_cast<uint64_T>(c_trans) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_trans) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(b_trans) + 1ULL));
    d_trans.data[k + trans_dim0 * xpageoffset] =
        trans.data[k + b_trans_dim0 * xpageoffset] / y.data[k];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel25(
    const emxArray_real_T trans, int32_T b_trans, emxArray_real_T c_trans)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_trans);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    c_trans.data[xpageoffset] = trans.data[xpageoffset];
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel26(
    const emxArray_real_T Cov, const int32_T i, real_T C[3364])
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 58ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 58ULL);
  if ((static_cast<int32_T>(xpageoffset < 58)) &&
      (static_cast<int32_T>(k < 58))) {
    C[k + 58 * xpageoffset] = Cov.data[(k + 58 * xpageoffset) + 3364 * i];
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel27(
    const emxArray_real_T Mu, const int32_T i, const real_T X[58000],
    const int32_T Mu_dim0, real_T X0[58000])
{
  uint64_T threadId;
  int32_T j;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int32_T>(threadId % 1000ULL);
  k = static_cast<int32_T>((threadId - static_cast<uint64_T>(j)) / 1000ULL);
  if ((static_cast<int32_T>(k < 58)) && (static_cast<int32_T>(j < 1000))) {
    X0[j + 1000 * k] = X[j + 1000 * k] - Mu.data[i + Mu_dim0 * k];
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel28(
    const emxArray_real_T Cov, const int32_T i, real_T x[58])
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
    x[k] = fabs(Cov.data[(k + 58 * k) + 3364 * i]);
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel29(
    const emxArray_real_T Cov, const int32_T i, real_T x[3364])
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 58ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 58ULL);
  if ((static_cast<int32_T>(xpageoffset < 58)) &&
      (static_cast<int32_T>(k < 58))) {
    x[k + 58 * xpageoffset] = Cov.data[(k + 58 * xpageoffset) + 3364 * i] -
                              Cov.data[(xpageoffset + 58 * k) + 3364 * i];
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel3(real_T N,
                                                      emxArray_real_T Cov)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(3364 * static_cast<int32_T>(N) - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    Cov.data[xpageoffset] = 0.0;
  }
}

static __global__
    __launch_bounds__(512, 1) void BaumWelch_kernel30(const real_T x[3364],
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
                                    1) void BaumWelch_kernel31(boolean_T y[58])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 58) {
    y[xpageoffset] = true;
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel32(
    const int32_T initAuxVar, real_T *muj, real_T y[3364], boolean_T b_y[58])
{
  uint64_T threadId;
  int32_T vlen;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  vlen = static_cast<int32_T>(threadId);
  if (vlen < 58) {
    int32_T i2;
    int32_T m;
    boolean_T exitg1;
    i2 = initAuxVar + vlen * 58;
    m = i2 + 57;
    exitg1 = false;
    while ((!static_cast<int32_T>(exitg1)) && (static_cast<int32_T>(i2 <= m))) {
      if (!static_cast<int32_T>(y[i2 - 1] < *muj)) {
        b_y[vlen] = false;
        exitg1 = true;
      } else {
        i2++;
      }
    }
  }
}

static __global__ __launch_bounds__(512,
                                    1) void BaumWelch_kernel33(real_T C[3364])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 3364) {
    C[xpageoffset] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel34(
    const int32_T T_size_dim0, const int32_T *LDA, int32_T *m, real_T C[3364],
    real_T T_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(*LDA) + 1ULL) *
                (static_cast<uint64_T>(*m) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(*LDA) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(*LDA) + 1ULL));
    T_data[k + T_size_dim0 * xpageoffset] = C[k + 58 * xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel35(
    const real_T T_data[3364], int32_T T_size, real_T dv_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(T_size);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    dv_data[xpageoffset] = T_data[xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel36(
    const real_T T_data[3364], const int32_T T_size_dim0, const int32_T T_size,
    int32_T b_T_size, real_T dv_data[3364])
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
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(T_size) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(T_size) + 1ULL));
    dv_data[k + 58 * xpageoffset] = T_data[xpageoffset + T_size_dim0 * k];
  }
}

static __global__ __launch_bounds__(512,
                                    1) void BaumWelch_kernel37(real_T X0[58000],
                                                               real_T B[58000])
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 58ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 58ULL);
  if ((static_cast<int32_T>(xpageoffset < 1000)) &&
      (static_cast<int32_T>(k < 58))) {
    B[k + 58 * xpageoffset] = X0[xpageoffset + 1000 * k];
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel38(int32_T *m,
                                                       int32_T ipiv_t[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    ipiv_t[xpageoffset] = 0;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel39(
    int32_T *m, ptrdiff_t jpvt_t_data[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    jpvt_t_data[xpageoffset] = (ptrdiff_t)0;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel4(
    const real_T X[58000], const cell_wrap_0 idx1[4], const int32_T i,
    const int32_T x_size_dim0, const int32_T b_idx1, real_T x_data[58000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(b_idx1) + 1ULL) * 58ULL - 1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_idx1) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(b_idx1) + 1ULL));
    x_data[k + x_size_dim0 * xpageoffset] =
        X[(static_cast<int32_T>(idx1[i].f1.data[k]) + 1000 * xpageoffset) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel40(
    const ptrdiff_t jpvt_t_data[58], int32_T *m, int32_T ipiv_t[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    ipiv_t[k] = (int32_T)jpvt_t_data[k];
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel41(int32_T *m,
                                                       real_T dv_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = 58ULL * (static_cast<uint64_T>(*m - 1) + 1ULL) - 1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T j;
    i = static_cast<int32_T>(idx % 58ULL);
    j = static_cast<int32_T>((idx - static_cast<uint64_T>(i)) / 58ULL);
    dv_data[j * 58 + i] = CUDART_NAN;
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel42(int32_T *m, real_T x[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    x[k] = CUDART_NAN;
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel43(int32_T *m,
                                                       int32_T ipiv_t[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    ipiv_t[k] = k + 1;
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel44(int16_T iv4_idx_0,
                                                       real_T Y_data[58000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(static_cast<int32_T>(iv4_idx_0) * 1000 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    Y_data[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(512,
                                    1) void BaumWelch_kernel45(real_T B[58000])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 58000) {
    B[xpageoffset] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel46(
    const int32_T Y_size_dim0, const int32_T *LDA, real_T dv_data[3364],
    real_T B[58000], int32_T ipiv_t[58], real_T Y_data[58000])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 1000) {
    for (int32_T i{0}; i < *LDA; i++) {
      Y_data[(ipiv_t[i] + Y_size_dim0 * k) - 1] = B[i + 58 * k];
    }
    for (int32_T xpageoffset{0}; xpageoffset < *LDA; xpageoffset++) {
      int32_T i36;
      int32_T j;
      j = *LDA - xpageoffset;
      Y_data[(ipiv_t[j - 1] + Y_size_dim0 * k) - 1] /=
          dv_data[(j + 58 * (j - 1)) - 1];
      i36 = j - 1;
      for (int32_T i{0}; i < i36; i++) {
        Y_data[(ipiv_t[i] + Y_size_dim0 * k) - 1] -=
            Y_data[(ipiv_t[j - 1] + Y_size_dim0 * k) - 1] *
            dv_data[i + 58 * (j - 1)];
      }
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel47(
    const real_T Y_data[58000], const int32_T Y_size_dim0, int32_T Y_size,
    real_T xRinv_data[58000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = 1000ULL * (static_cast<uint64_T>(Y_size) + 1ULL) - 1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % 1000ULL);
    xpageoffset =
        static_cast<int32_T>((idx - static_cast<uint64_T>(k)) / 1000ULL);
    xRinv_data[k + 1000 * xpageoffset] = Y_data[xpageoffset + Y_size_dim0 * k];
  }
}

static __global__
    __launch_bounds__(64, 1) void BaumWelch_kernel48(int32_T ipiv_t[58],
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
    __launch_bounds__(1024, 1) void BaumWelch_kernel49(int32_T x_size,
                                                       real_T dv_data[3364])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(x_size);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    dv_data[xpageoffset] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(512,
                                    1) void BaumWelch_kernel5(real_T C[3364])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 3364) {
    C[xpageoffset] = 0.0;
  }
}

static __global__
    __launch_bounds__(64, 1) void BaumWelch_kernel50(int32_T ipiv_data[58])
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 58) {
    ipiv_data[k] = k + 1;
  }
}

static __global__
    __launch_bounds__(512, 1) void BaumWelch_kernel51(real_T X0[58000],
                                                      real_T xRinv_data[58000])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 58000) {
    xRinv_data[xpageoffset] = X0[xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel52(
    const real_T T_data[3364], const int32_T T_size_dim0, int32_T *m,
    real_T x[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    x[k] = T_data[k + T_size_dim0 * k];
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel53(int32_T *m, real_T x[58])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(idx);
    x[k] = log(x[k]);
  }
}

static __global__ __launch_bounds__(32, 1) void BaumWelch_kernel54(real_T x[58],
                                                                   real_T *muj)
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    *muj = x[0];
  }
}

static __global__ __launch_bounds__(1024,
                                    1) void BaumWelch_kernel55(int32_T vlen,
                                                               real_T x[58],
                                                               real_T *muj)
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
  loopEnd = (static_cast<int64_T>(vlen - 2) + 1LL) - 1LL;
  if (static_cast<uint32_T>(mwGetBlockIndex()) ==
      static_cast<uint32_T>(static_cast<int64_T>(vlen - 2) + 1LL) /
          blockStride) {
    m = (static_cast<int64_T>(vlen - 2) + 1LL) %
        static_cast<int64_T>(blockStride);
    if (m > 0U) {
      blockStride = m;
    }
  }
  blockStride = ((blockStride + warpSize) - 1U) / warpSize;
  if (static_cast<int64_T>(threadId) <= loopEnd) {
    tmpRed0 = x[static_cast<int32_T>(threadId) + 1];
  }
  m = __ballot_sync(MAX_uint32_T, static_cast<int64_T>(threadId) <= loopEnd);
  for (uint32_T idx{threadId + threadStride};
       idx <= static_cast<uint32_T>(loopEnd); idx += threadStride) {
    tmpRed0 += x[static_cast<int32_T>(idx) + 1];
  }
  tmpRed0 = workGroupReduction(tmpRed0, m, blockStride);
  if ((static_cast<int32_T>(static_cast<int64_T>(threadId) <= loopEnd)) &&
      (static_cast<int32_T>(thBlkId == 0U))) {
    atomicOpreal_T(&muj[0], tmpRed0);
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel56(
    const real_T xRinv_data[58000], int32_T *m, real_T y_data[58000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    real_T muj;
    int32_T k;
    k = static_cast<int32_T>(idx);
    muj = xRinv_data[k];
    y_data[k] = muj * muj;
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel57(
    const real_T y_data[58000], real_T quadform[1000])
{
  uint64_T threadId;
  int32_T j;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int32_T>(threadId);
  if (j < 1000) {
    quadform[j] = y_data[j];
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel58(
    const real_T y_data[58000], const int32_T *LDA, real_T quadform[1000])
{
  uint64_T threadId;
  int32_T j;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int32_T>(threadId);
  if (j < 1000) {
    quadform[j] += y_data[*LDA + j];
  }
}

static __global__
    __launch_bounds__(512, 1) void BaumWelch_kernel59(real_T quadform[1000])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 1000) {
    quadform[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel6(
    const int32_T x_size_dim0, const int32_T *m, real_T x_data[58000])
{
  uint64_T threadId;
  int32_T j;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  j = static_cast<int32_T>(threadId);
  if (j < 58) {
    real_T muj;
    muj = 0.0;
    for (int32_T i{0}; i < *m; i++) {
      muj += x_data[i + x_size_dim0 * j];
    }
    muj /= static_cast<real_T>(*m);
    for (int32_T i{0}; i < *m; i++) {
      x_data[i + x_size_dim0 * j] -= muj;
    }
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel60(
    const real_T quadform[1000], const int32_T i, real_T *muj,
    emxArray_real_T B)
{
  uint64_T threadId;
  int32_T k;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId);
  if (k < 1000) {
    B.data[k + 1000 * i] =
        exp((-0.5 * quadform[k] - *muj) - 53.298434925871014);
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel61(
    const emxArray_int32_T iv1, int32_T kEnd, emxArray_real_T B)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(kEnd - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    B.data[iv1.data[xpageoffset] - 1] = 1.0E-200;
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel62(real_T N,
                                                       emxArray_real_T alpha)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(1000 * static_cast<int32_T>(N) - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    alpha.data[xpageoffset] = 0.0;
  }
}

static __global__
    __launch_bounds__(512, 1) void BaumWelch_kernel63(real_T scale[1000])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 1000) {
    scale[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel64(
    const emxArray_real_T B, const emxArray_real_T Pi, int32_T b_Pi,
    emxArray_real_T alpha)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_Pi);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    alpha.data[1000 * xpageoffset] =
        Pi.data[xpageoffset] * B.data[1000 * xpageoffset];
  }
}

static __global__
    __launch_bounds__(32, 1) void BaumWelch_kernel65(real_T *muj,
                                                     real_T scale[1000])
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    scale[0] = *muj;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel66(
    const emxArray_real_T alpha, int32_T kEnd, real_T *muj,
    emxArray_real_T b_alpha)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(kEnd);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    b_alpha.data[xpageoffset] = alpha.data[1000 * xpageoffset] / *muj;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel67(
    const emxArray_real_T alpha, int32_T b_alpha, emxArray_real_T c_alpha)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_alpha);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    c_alpha.data[1000 * xpageoffset] = alpha.data[xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel68(
    const int32_T i, const emxArray_real_T trans, const emxArray_real_T alpha,
    int32_T kEnd, const int32_T trans_dim0, int32_T *info_t, emxArray_real_T x)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(kEnd);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    x.data[xpageoffset] = alpha.data[*info_t + 1000 * xpageoffset] *
                          trans.data[xpageoffset + trans_dim0 * i];
  }
}

static __global__ __launch_bounds__(32, 1) void BaumWelch_kernel69(
    const emxArray_real_T B, const int32_T i, real_T *muj, int32_T *info_t,
    emxArray_real_T alpha)
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    alpha.data[(*info_t + 1000 * i) + 1] =
        *muj * B.data[(*info_t + 1000 * i) + 1];
  }
}

static __global__ __launch_bounds__(512,
                                    1) void BaumWelch_kernel7(real_T C[3364])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 3364) {
    C[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void BaumWelch_kernel70(
    real_T *muj, int32_T *info_t, real_T scale[1000])
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    scale[*info_t + 1] = *muj;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel71(
    const emxArray_real_T alpha, const int32_T *m, int32_T kEnd, real_T *muj,
    emxArray_real_T b_alpha)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(kEnd);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    b_alpha.data[xpageoffset] = alpha.data[*m + 1000 * xpageoffset] / *muj;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel72(
    const emxArray_real_T alpha, const int32_T *LDA, int32_T b_alpha,
    emxArray_real_T c_alpha)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_alpha);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    c_alpha.data[*LDA + 1000 * xpageoffset] = alpha.data[xpageoffset];
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel73(real_T N,
                                                       emxArray_real_T beta)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(1000 * static_cast<int32_T>(N) - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    beta.data[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel74(
    const real_T scale[1000], int32_T unnamed_idx_1, emxArray_real_T beta)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(unnamed_idx_1 - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    beta.data[1000 * xpageoffset + 999] = 1.0 / scale[999];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel75(
    const emxArray_real_T beta, const int32_T vlen, const emxArray_real_T B,
    const int32_T kEnd, const emxArray_real_T trans, const int32_T i,
    int32_T *LDA, const int32_T trans_dim0, emxArray_real_T x)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*LDA);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    x.data[xpageoffset] = trans.data[i + trans_dim0 * xpageoffset] *
                          B.data[kEnd + 1000 * xpageoffset] *
                          beta.data[vlen + 1000 * xpageoffset];
  }
}

static __global__ __launch_bounds__(32, 1) void BaumWelch_kernel76(
    const real_T scale[1000], const int32_T i, real_T *muj, int32_T *info_t,
    emxArray_real_T beta)
{
  uint64_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    beta.data[(1000 * i - *info_t) + 998] = *muj / scale[998 - *info_t];
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel77(real_T N,
                                                       emxArray_real_T Xi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(
      999 * static_cast<int32_T>(N) * static_cast<int32_T>(N) - 1);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    Xi.data[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel78(
    const emxArray_real_T beta, const emxArray_real_T B,
    const emxArray_real_T trans, const emxArray_real_T alpha, const real_T N,
    int32_T i11, const int32_T Xi_dim1, const int32_T trans_dim0,
    int32_T *info_t, emxArray_real_T Xi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(static_cast<int32_T>(N) - 1) + 1ULL) *
                (static_cast<uint64_T>(i11) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T i;
    int32_T j;
    j = static_cast<int32_T>(
        idx % (static_cast<uint64_T>(static_cast<int32_T>(N) - 1) + 1ULL));
    i = static_cast<int32_T>(
        (idx - static_cast<uint64_T>(j)) /
        (static_cast<uint64_T>(static_cast<int32_T>(N) - 1) + 1ULL));
    Xi.data[(*info_t + 999 * i) + 999 * Xi_dim1 * j] =
        alpha.data[*info_t + 1000 * i] * trans.data[i + trans_dim0 * j] *
        B.data[(*info_t + 1000 * j) + 1] * beta.data[(*info_t + 1000 * j) + 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel79(
    const emxArray_real_T Xi, const int32_T kEnd, int32_T vlen,
    const int32_T Xi_dim1, const int32_T b_Xi_dim1, real_T *muj,
    int32_T *info_t, emxArray_real_T b_Xi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = (static_cast<uint64_T>(kEnd) + 1ULL) *
                (static_cast<uint64_T>(vlen) + 1ULL) -
            1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(kEnd) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(kEnd) + 1ULL));
    b_Xi.data[k + Xi_dim1 * xpageoffset] =
        Xi.data[(*info_t + 999 * k) + 999 * b_Xi_dim1 * xpageoffset] / *muj;
  }
}

static __global__ __launch_bounds__(512,
                                    1) void BaumWelch_kernel8(real_T C[3364])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 3364) {
    C[xpageoffset] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel80(
    const emxArray_real_T Xi, const int32_T b_Xi, int32_T c_Xi,
    const int32_T Xi_dim1, const int32_T b_Xi_dim1, int32_T *info_t,
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
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % (static_cast<uint64_T>(b_Xi) + 1ULL));
    xpageoffset = static_cast<int32_T>((idx - static_cast<uint64_T>(k)) /
                                       (static_cast<uint64_T>(b_Xi) + 1ULL));
    d_Xi.data[(*info_t + 999 * k) + 999 * Xi_dim1 * xpageoffset] =
        Xi.data[k + b_Xi_dim1 * xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel81(
    const emxArray_real_T Xi, int32_T *m, emxArray_real_T Gamma)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    Gamma.data[j] = Xi.data[j];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel82(
    const emxArray_real_T Xi, const int32_T *LDA, int32_T *m,
    emxArray_real_T Gamma)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*m);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T j;
    j = static_cast<int32_T>(idx);
    Gamma.data[j] += Xi.data[*LDA + j];
  }
}

static __global__
    __launch_bounds__(1024, 1) void BaumWelch_kernel83(int32_T sz,
                                                       emxArray_real_T Gamma)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(sz);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    Gamma.data[xpageoffset] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel84(
    const emxArray_real_T Gamma, int32_T kEnd, emxArray_real_T Pi)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(kEnd);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    Pi.data[xpageoffset] = Gamma.data[999 * xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel85(
    const emxArray_real_T Xi, const int32_T i, int32_T b_i,
    const int32_T Xi_dim1, emxArray_real_T a)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = 999ULL * (static_cast<uint64_T>(b_i) + 1ULL) - 1ULL;
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T k;
    int32_T xpageoffset;
    k = static_cast<int32_T>(idx % 999ULL);
    xpageoffset =
        static_cast<int32_T>((idx - static_cast<uint64_T>(k)) / 999ULL);
    a.data[k + 999 * xpageoffset] =
        Xi.data[(k + 999 * i) + 999 * Xi_dim1 * xpageoffset];
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel86(
    const emxArray_real_T a, int32_T *LDA, emxArray_real_T y)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(*LDA);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    real_T muj;
    int32_T i;
    int32_T xpageoffset;
    i = static_cast<int32_T>(idx);
    xpageoffset = i * 999;
    muj = a.data[xpageoffset];
    for (int32_T k{0}; k < 998; k++) {
      muj += a.data[(xpageoffset + k) + 1];
    }
    y.data[i] = muj;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel87(
    const emxArray_real_T y, const int32_T i, int32_T b_y,
    const int32_T trans_dim0, real_T *muj, emxArray_real_T trans)
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(b_y);
  for (uint64_T idx{threadId}; idx <= loopEnd; idx += threadStride) {
    int32_T xpageoffset;
    xpageoffset = static_cast<int32_T>(idx);
    trans.data[i + trans_dim0 * xpageoffset] = y.data[xpageoffset] / *muj;
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel88(
    const emxArray_real_T Gamma, const int32_T i, const real_T X[58000],
    real_T x[57942])
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 999ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 999ULL);
  if ((static_cast<int32_T>(xpageoffset < 58)) &&
      (static_cast<int32_T>(k < 999))) {
    x[k + 999 * xpageoffset] =
        X[k + 1000 * xpageoffset] * Gamma.data[k + 999 * i];
  }
}

static __global__
    __launch_bounds__(64, 1) void BaumWelch_kernel89(const real_T x[57942],
                                                     real_T y[58])
{
  uint64_T threadId;
  int32_T i;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  i = static_cast<int32_T>(threadId);
  if (i < 58) {
    real_T muj;
    int32_T xpageoffset;
    xpageoffset = i * 999;
    muj = x[xpageoffset];
    for (int32_T k{0}; k < 998; k++) {
      muj += x[(xpageoffset + k) + 1];
    }
    y[i] = muj;
  }
}

static __global__
    __launch_bounds__(512, 1) void BaumWelch_kernel9(real_T C[3364],
                                                     real_T dv_data[3364])
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 3364) {
    dv_data[xpageoffset] = C[xpageoffset];
  }
}

static __global__ __launch_bounds__(64, 1) void BaumWelch_kernel90(
    const real_T y[58], const int32_T i, const int32_T Mu_dim0, real_T *muj,
    emxArray_real_T Mu)
{
  uint64_T threadId;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  xpageoffset = static_cast<int32_T>(threadId);
  if (xpageoffset < 58) {
    Mu.data[i + Mu_dim0 * xpageoffset] = y[xpageoffset] / *muj;
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel91(
    const emxArray_real_T Mu, const int32_T i, const real_T X[58000],
    const int32_T Mu_dim0, real_T d[57942])
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 999ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 999ULL);
  if ((static_cast<int32_T>(xpageoffset < 58)) &&
      (static_cast<int32_T>(k < 999))) {
    d[k + 999 * xpageoffset] =
        X[k + 1000 * xpageoffset] - Mu.data[i + Mu_dim0 * xpageoffset];
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel92(
    const emxArray_real_T Gamma, const int32_T i, real_T d[57942],
    real_T A[57942])
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 58ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 58ULL);
  if ((static_cast<int32_T>(xpageoffset < 999)) &&
      (static_cast<int32_T>(k < 58))) {
    A[k + 58 * xpageoffset] =
        d[xpageoffset + 999 * k] * Gamma.data[xpageoffset + 999 * i];
  }
}

static __global__ __launch_bounds__(512, 1) void BaumWelch_kernel93(
    const int32_T i, real_T *muj, real_T y[3364], emxArray_real_T Cov)
{
  uint64_T threadId;
  int32_T k;
  int32_T xpageoffset;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  k = static_cast<int32_T>(threadId % 58ULL);
  xpageoffset =
      static_cast<int32_T>((threadId - static_cast<uint64_T>(k)) / 58ULL);
  if ((static_cast<int32_T>(xpageoffset < 58)) &&
      (static_cast<int32_T>(k < 58))) {
    Cov.data[(k + 58 * xpageoffset) + 3364 * i] =
        y[k + 58 * xpageoffset] / *muj;
  }
}

static __global__ __launch_bounds__(1024, 1) void BaumWelch_kernel94(
    const int32_T iwork[1000], const int32_T j, int32_T kEnd, int32_T idx[1000])
{
  uint64_T loopEnd;
  uint64_T threadId;
  uint64_T threadStride;
  threadId = static_cast<uint64_T>(mwGetGlobalThreadIndexInXDimension());
  threadStride = mwGetTotalThreadsLaunched();
  loopEnd = static_cast<uint64_T>(kEnd - 1);
  for (uint64_T b_idx{threadId}; b_idx <= loopEnd; b_idx += threadStride) {
    int32_T k;
    k = static_cast<int32_T>(b_idx);
    idx[(j + k) - 1] = iwork[k];
  }
}

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
  emxEnsureCapacity_real_T(in1, i2, &p_emlrtRTEI);
  stride_0_1 = (i != 1);
  stride_1_1 = (i1 != 1);
  if (i1 == 1) {
    i1 = i;
  }
  for (i2 = 0; i2 < i1; i2++) {
    in1->data[i2] = in2->data[in3 + 1000 * (i2 * stride_0_1)] *
                    in4->data[i2 * stride_1_1 + in4->size[0] * in5];
  }
}

static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2,
                             int32_T in3, const emxArray_real_T *in4,
                             int32_T in5, const emxArray_real_T *in6)
{
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  int32_T stride_0_1;
  int32_T stride_1_1;
  int32_T stride_2_1;
  i = in2->size[1];
  i1 = in4->size[1];
  i2 = in6->size[1];
  i3 = in1->size[0] * in1->size[1];
  in1->size[0] = 1;
  if (i2 == 1) {
    if (i1 == 1) {
      in1->size[1] = i;
    } else {
      in1->size[1] = i1;
    }
  } else {
    in1->size[1] = i2;
  }
  emxEnsureCapacity_real_T(in1, i3, &s_emlrtRTEI);
  stride_0_1 = (i != 1);
  stride_1_1 = (i1 != 1);
  stride_2_1 = (i2 != 1);
  if (i2 == 1) {
    if (i1 == 1) {
      i2 = i;
    } else {
      i2 = i1;
    }
  }
  for (i3 = 0; i3 < i2; i3++) {
    in1->data[i3] = in2->data[in3 + in2->size[0] * (i3 * stride_0_1)] *
                    in4->data[(1000 * (i3 * stride_1_1) - in5) + 999] *
                    in6->data[(1000 * (i3 * stride_2_1) - in5) + 999];
  }
}

static void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in3,
                             const emxArray_real_T *in4)
{
  int32_T i;
  int32_T stride_0_1;
  int32_T stride_1_1;
  i = in4->size[1];
  stride_0_1 = (in3->size[1] != 1);
  stride_1_1 = (i != 1);
  if (i == 1) {
    i = in3->size[1];
  }
  for (int32_T i1{0}; i1 < i; i1++) {
    in1->data[1000 * i1] =
        in3->data[i1 * stride_0_1] * in4->data[1000 * (i1 * stride_1_1)];
  }
}

static void gpuEmxEnsureCapacity_int32_T(const emxArray_int32_T *cpu,
                                         emxArray_int32_T *gpu)
{
  int32_T *newData;
  if (gpu->data == 0) {
    newData = 0ULL;
    cudaMalloc(&newData, cpu->allocatedSize * sizeof(int32_T));
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
      cudaMalloc(&newData, cpu->allocatedSize * sizeof(int32_T));
      cudaMemcpy(newData, gpu->data, actualSizeGpu * sizeof(int32_T),
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

static void gpuEmxFree_int32_T(emxArray_int32_T *gpu)
{
  if (gpu->data != (void *)4207599121ULL) {
    cudaFree(gpu->data);
  }
  emlrtFreeMex(gpu->size);
}

static void gpuEmxFree_real_T(emxArray_real_T *gpu)
{
  if (gpu->data != (void *)4207599121ULL) {
    cudaFree(gpu->data);
  }
  emlrtFreeMex(gpu->size);
}

static void gpuEmxMemcpyCpuToGpu_int32_T(emxArray_int32_T *gpu,
                                         const emxArray_int32_T *cpu)
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
    cudaMalloc(&gpu->data, gpu->allocatedSize * sizeof(int32_T));
  }
  cudaMemcpy(gpu->data, cpu->data, actualSize * sizeof(int32_T),
             cudaMemcpyHostToDevice);
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

static void gpuEmxReset_int32_T(emxArray_int32_T *gpu)
{
  std::memset(gpu, 0, sizeof(emxArray_int32_T));
}

static void gpuEmxReset_real_T(emxArray_real_T *gpu)
{
  std::memset(gpu, 0, sizeof(emxArray_real_T));
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

void BaumWelch(BaumWelchStackData *SD, const real_T X[58000], real_T N,
               emxArray_real_T *Mu, emxArray_real_T *Cov,
               emxArray_real_T *trans, emxArray_real_T *Pi, real_T *Time)
{
  static const int32_T iv2[2]{1, 26};
  static const int32_T iv3[2]{1, 46};
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
  cell_wrap_0 idx1[4];
  cell_wrap_0(*gpu_idx1)[4];
  dim3 block;
  dim3 grid;
  emlrtTimespec expl_temp;
  emxArray_int32_T gpu_iv1;
  emxArray_int32_T *iv1;
  emxArray_real_T b_gpu_Xi;
  emxArray_real_T b_gpu_alpha;
  emxArray_real_T b_gpu_trans;
  emxArray_real_T b_gpu_x;
  emxArray_real_T b_gpu_y;
  emxArray_real_T c_gpu_alpha;
  emxArray_real_T c_gpu_x;
  emxArray_real_T c_gpu_y;
  emxArray_real_T d_gpu_x;
  emxArray_real_T f_gpu_y;
  emxArray_real_T gpu_B;
  emxArray_real_T gpu_Cov;
  emxArray_real_T gpu_Gamma;
  emxArray_real_T gpu_Mu;
  emxArray_real_T gpu_Pi;
  emxArray_real_T gpu_Xi;
  emxArray_real_T gpu_a;
  emxArray_real_T gpu_alpha;
  emxArray_real_T gpu_beta;
  emxArray_real_T gpu_trans;
  emxArray_real_T *B;
  emxArray_real_T *Gamma;
  emxArray_real_T *Xi;
  emxArray_real_T *a;
  emxArray_real_T *alpha;
  emxArray_real_T *b_Xi;
  emxArray_real_T *b_alpha;
  emxArray_real_T *b_trans;
  emxArray_real_T *b_x;
  emxArray_real_T *b_y;
  emxArray_real_T *beta;
  emxArray_real_T *c_alpha;
  emxArray_real_T *c_x;
  emxArray_real_T *c_y;
  emxArray_real_T *d_x;
  emxArray_real_T *y;
  const mxArray *b_m;
  const mxArray *e_y;
  const mxArray *f_y;
  real_T(*b_gpu_B)[58000];
  real_T(*gpu_X)[58000];
  real_T(*gpu_X0)[58000];
  real_T(*gpu_Y_data)[58000];
  real_T(*gpu_xRinv_data)[58000];
  real_T(*gpu_x_data)[58000];
  real_T(*gpu_y_data)[58000];
  real_T(*f_gpu_x)[57942];
  real_T(*gpu_A)[57942];
  real_T(*gpu_d)[57942];
  real_T C[3364];
  real_T dv_data[3364];
  real_T(*d_gpu_y)[3364];
  real_T(*e_gpu_x)[3364];
  real_T(*gpu_C)[3364];
  real_T(*gpu_T_data)[3364];
  real_T(*gpu_dv_data)[3364];
  real_T(*gpu_quadform)[1000];
  real_T(*gpu_scale)[1000];
  real_T x[58];
  real_T(*gpu_x)[58];
  real_T(*gpu_y)[58];
  real_T b_muj;
  real_T beta1;
  real_T *gpu_muj;
  int32_T idx[1000];
  int32_T iwork[1000];
  int32_T(*gpu_idx)[1000];
  int32_T(*gpu_iwork)[1000];
  int32_T ipiv_data[58];
  int32_T(*gpu_ipiv_data)[58];
  int32_T(*gpu_ipiv_t)[58];
  int32_T T_size[2];
  int32_T b_x_size[2];
  int32_T x_size[2];
  int32_T LDA;
  int32_T b_i;
  int32_T b_vlen;
  int32_T exponent;
  int32_T i;
  int32_T i10;
  int32_T i13;
  int32_T i14;
  int32_T i8;
  int32_T i9;
  int32_T info_t;
  int32_T j;
  int32_T k;
  int32_T kEnd;
  int32_T m;
  int32_T vlen;
  int32_T xpageoffset;
  int32_T *gpu_LDA;
  int32_T *gpu_info_t;
  int32_T *gpu_m;
  int8_T dv_size[2];
  boolean_T d_y[58];
  boolean_T(*e_gpu_y)[58];
  boolean_T B_dirtyOnGpu;
  boolean_T C_dirtyOnCpu;
  boolean_T Cov_dirtyOnCpu;
  boolean_T Cov_dirtyOnGpu;
  boolean_T Gamma_dirtyOnGpu;
  boolean_T Mu_dirtyOnCpu;
  boolean_T Mu_dirtyOnGpu;
  boolean_T Pi_dirtyOnCpu;
  boolean_T Pi_dirtyOnGpu;
  boolean_T Xi_dirtyOnGpu;
  boolean_T alpha_dirtyOnCpu;
  boolean_T alpha_dirtyOnGpu;
  boolean_T b_x_dirtyOnCpu;
  boolean_T b_x_dirtyOnGpu;
  boolean_T beta_dirtyOnGpu;
  boolean_T dv_data_dirtyOnGpu;
  boolean_T exitg1;
  boolean_T idx1_dirtyOnGpu;
  boolean_T idx_dirtyOnGpu;
  boolean_T info_t_dirtyOnCpu;
  boolean_T iv1_dirtyOnCpu;
  boolean_T iwork_dirtyOnCpu;
  boolean_T jpvt_t_data_dirtyOnCpu;
  boolean_T jpvt_t_data_dirtyOnGpu;
  boolean_T p;
  boolean_T trans_dirtyOnCpu;
  boolean_T trans_dirtyOnGpu;
  boolean_T validLaunchParams;
  boolean_T x_dirtyOnCpu;
  boolean_T x_dirtyOnGpu;
  boolean_T y_dirtyOnGpu;
  cudaMalloc(&gpu_Y_data, 464000ULL);
  cudaMalloc(&gpu_quadform, 8000ULL);
  cudaMalloc(&gpu_y_data, 464000ULL);
  cudaMalloc(&gpu_xRinv_data, 464000ULL);
  cudaMalloc(&gpu_jpvt_t_data, 464ULL);
  cudaMalloc(&b_gpu_B, 464000ULL);
  cudaMalloc(&gpu_ipiv_data, 232ULL);
  cudaMalloc(&gpu_ipiv_t, 232ULL);
  gpuEmxReset_real_T(&f_gpu_y);
  cudaMalloc(&gpu_T_data, 26912ULL);
  cudaMalloc(&gpu_A, 463536ULL);
  cudaMalloc(&gpu_d, 463536ULL);
  gpuEmxReset_real_T(&gpu_a);
  cudaMalloc(&f_gpu_x, 463536ULL);
  gpuEmxReset_real_T(&b_gpu_Xi);
  cudaMalloc(&e_gpu_y, 58ULL);
  cudaMalloc(&d_gpu_y, 26912ULL);
  cudaMalloc(&e_gpu_x, 26912ULL);
  gpuEmxReset_real_T(&gpu_Gamma);
  gpuEmxReset_real_T(&d_gpu_x);
  gpuEmxReset_real_T(&gpu_Xi);
  gpuEmxReset_real_T(&c_gpu_alpha);
  gpuEmxReset_real_T(&c_gpu_x);
  gpuEmxReset_real_T(&gpu_beta);
  cudaMalloc(&gpu_info_t, 4ULL);
  cudaMalloc(&gpu_X0, 464000ULL);
  gpuEmxReset_real_T(&b_gpu_alpha);
  cudaMalloc(&gpu_scale, 8000ULL);
  gpuEmxReset_real_T(&gpu_alpha);
  gpuEmxReset_real_T(&gpu_B);
  gpuEmxReset_int32_T(&gpu_iv1);
  gpuEmxReset_real_T(&b_gpu_trans);
  gpuEmxReset_real_T(&c_gpu_y);
  gpuEmxReset_real_T(&b_gpu_y);
  cudaMalloc(&gpu_LDA, 4ULL);
  gpuEmxReset_real_T(&b_gpu_x);
  gpuEmxReset_real_T(&gpu_trans);
  gpuEmxReset_real_T(&gpu_Mu);
  cudaMalloc(&gpu_y, 464ULL);
  cudaMalloc(&gpu_dv_data, 26912ULL);
  gpuEmxReset_real_T(&gpu_Pi);
  cudaMalloc(&gpu_m, 4ULL);
  cudaMalloc(&gpu_muj, 8ULL);
  cudaMalloc(&gpu_x, 464ULL);
  cudaMalloc(&gpu_C, 26912ULL);
  cudaMalloc(&gpu_x_data, 464000ULL);
  cudaMalloc(&gpu_iwork, 4000ULL);
  gpuEmxReset_real_T(&gpu_Cov);
  cudaMalloc(&gpu_idx1, 32032ULL);
  cudaMalloc(&gpu_idx, 4000ULL);
  cudaMalloc(&gpu_X, 464000ULL);
  jpvt_t_data_dirtyOnGpu = false;
  Gamma_dirtyOnGpu = false;
  b_x_dirtyOnGpu = false;
  Xi_dirtyOnGpu = false;
  x_dirtyOnGpu = false;
  beta_dirtyOnGpu = false;
  alpha_dirtyOnGpu = false;
  B_dirtyOnGpu = false;
  y_dirtyOnGpu = false;
  dv_data_dirtyOnGpu = false;
  idx1_dirtyOnGpu = false;
  jpvt_t_data_dirtyOnCpu = false;
  b_x_dirtyOnCpu = false;
  x_dirtyOnCpu = false;
  alpha_dirtyOnCpu = false;
  iv1_dirtyOnCpu = false;
  C_dirtyOnCpu = false;
  iwork_dirtyOnCpu = false;
  trans_dirtyOnGpu = false;
  trans_dirtyOnCpu = true;
  Mu_dirtyOnGpu = false;
  Mu_dirtyOnCpu = true;
  Pi_dirtyOnGpu = false;
  Pi_dirtyOnCpu = true;
  Cov_dirtyOnGpu = false;
  Cov_dirtyOnCpu = true;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  //  Baum Welch algorithm to train Hidden Markov Model
  //
  //   Input:
  //   - X: Observations (MxT)
  //   - N: Number of states
  //   (optional inputs)
  //   - cyc: Number of iterations of the forward-backward algorithm
  //   - tol: Tolerance to stop iterations
  //
  //   Output:
  //   - Mu: Means of the normal distributions for each
  //         observation in each state (MxN)
  //   - Cov: Covariance of the normal distributions for eachs
  //          observation in each state (MxMxN)
  //   - Pi: Initial state probabilities (1xN)
  //   - trans: Transition matrix (NxN)
  expl_temp = coder::tic();
  //  Find the initial means and covariance matrices for each of the states
  //  Split the observations into evenly size states from smallest to largest
  // [idx]=Divide(X,N,'sort');
  cudaMemcpy(*gpu_X, X, 464000ULL, cudaMemcpyHostToDevice);
  BaumWelch_kernel1<<<dim3(1U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_X, *gpu_idx);
  idx_dirtyOnGpu = true;
  i = 2;
  while (i < 1000) {
    xpageoffset = i << 1;
    j = 1;
    for (m = i + 1; m < 1001; m = vlen + i) {
      LDA = j - 1;
      info_t = m - 1;
      vlen = j + xpageoffset;
      if (vlen > 1001) {
        vlen = 1001;
      }
      k = 0;
      kEnd = vlen - j;
      while (k + 1 <= kEnd) {
        p = true;
        b_vlen = 0;
        exitg1 = false;
        while ((!exitg1) && (b_vlen + 1 < 59)) {
          if (idx_dirtyOnGpu) {
            cudaMemcpy(idx, *gpu_idx, 4000ULL, cudaMemcpyDeviceToHost);
          }
          idx_dirtyOnGpu = false;
          if ((X[(idx[LDA] + 1000 * b_vlen) - 1] ==
               X[(idx[info_t] + 1000 * b_vlen) - 1]) ||
              (std::isnan(X[(idx[LDA] + 1000 * b_vlen) - 1]) &&
               std::isnan(X[(idx[info_t] + 1000 * b_vlen) - 1]))) {
            b_vlen++;
          } else {
            if ((!(X[(idx[LDA] + 1000 * b_vlen) - 1] <=
                   X[(idx[info_t] + 1000 * b_vlen) - 1])) &&
                (!std::isnan(X[(idx[info_t] + 1000 * b_vlen) - 1]))) {
              p = false;
            }
            exitg1 = true;
          }
        }
        if (p) {
          if (idx_dirtyOnGpu) {
            cudaMemcpy(idx, *gpu_idx, 4000ULL, cudaMemcpyDeviceToHost);
          }
          idx_dirtyOnGpu = false;
          iwork[k] = idx[LDA];
          iwork_dirtyOnCpu = true;
          LDA++;
          if (LDA + 1 == m) {
            while (info_t + 1 < vlen) {
              k++;
              iwork[k] = idx[info_t];
              info_t++;
            }
          }
        } else {
          if (idx_dirtyOnGpu) {
            cudaMemcpy(idx, *gpu_idx, 4000ULL, cudaMemcpyDeviceToHost);
          }
          idx_dirtyOnGpu = false;
          iwork[k] = idx[info_t];
          iwork_dirtyOnCpu = true;
          info_t++;
          if (info_t + 1 == vlen) {
            while (LDA + 1 < m) {
              k++;
              iwork[k] = idx[LDA];
              LDA++;
            }
          }
        }
        k++;
      }
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>((kEnd - 1) + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        if (iwork_dirtyOnCpu) {
          cudaMemcpy(*gpu_iwork, iwork, 4000ULL, cudaMemcpyHostToDevice);
        }
        iwork_dirtyOnCpu = false;
        BaumWelch_kernel94<<<grid, block>>>(*gpu_iwork, j, kEnd, *gpu_idx);
        idx_dirtyOnGpu = true;
      }
      j = vlen;
    }
    i = xpageoffset;
  }
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<real_T>((static_cast<int32_T>(N) - 1) + 1LL), &grid, &block,
      1024U, 65535U);
  if (validLaunchParams) {
    BaumWelch_kernel2<<<grid, block>>>(*gpu_idx, N, static_cast<int32_T>(N) - 1,
                                       *gpu_idx1);
    idx1_dirtyOnGpu = true;
  }
  kEnd = Mu->size[0] * Mu->size[1];
  Mu->size[0] = static_cast<int32_T>(N);
  Mu->size[1] = 58;
  emxEnsureCapacity_real_T(Mu, kEnd, &emlrtRTEI);
  kEnd = Cov->size[0] * Cov->size[1] * Cov->size[2];
  Cov->size[0] = 58;
  Cov->size[1] = 58;
  Cov->size[2] = static_cast<int32_T>(N);
  emxEnsureCapacity_real_T(Cov, kEnd, &b_emlrtRTEI);
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<real_T>((3364 * static_cast<int32_T>(N) - 1) + 1LL), &grid,
      &block, 1024U, 65535U);
  if (validLaunchParams) {
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_Cov, Cov);
    BaumWelch_kernel3<<<grid, block>>>(N, gpu_Cov);
    Cov_dirtyOnCpu = false;
    Cov_dirtyOnGpu = true;
  }
  info_t = static_cast<int32_T>(N);
  info_t_dirtyOnCpu = true;
  for (i = 0; i < info_t; i++) {
    if (idx1_dirtyOnGpu) {
      cudaMemcpy(idx1, *gpu_idx1, 32032ULL, cudaMemcpyDeviceToHost);
    }
    kEnd = idx1[i].f1.size[0];
    x_size[0] = idx1[i].f1.size[0];
    xpageoffset = idx1[i].f1.size[0] - 1;
    validLaunchParams =
        mwGetLaunchParameters1D(static_cast<real_T>((xpageoffset + 1LL) * 58LL),
                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      BaumWelch_kernel4<<<grid, block>>>(*gpu_X, *gpu_idx1, i, x_size[0],
                                         xpageoffset, *gpu_x_data);
    }
    if (kEnd == 1) {
      BaumWelch_kernel10<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
          x_size[0], *gpu_x_data, *gpu_x);
      b_muj = 0.0;
      cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      BaumWelch_kernel11<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
          x_size[0], *gpu_x_data, gpu_muj);
      cudaMemcpy(&b_muj, gpu_muj, 8ULL, cudaMemcpyDeviceToHost);
      b_muj /= 58.0;
      cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      BaumWelch_kernel12<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(gpu_muj,
                                                                  *gpu_x);
      iwork_dirtyOnCpu = true;
      b_muj = 0.0;
      for (xpageoffset = 0; xpageoffset < 58; xpageoffset++) {
        real_T muj;
        if (iwork_dirtyOnCpu) {
          cudaMemcpy(x, *gpu_x, 464ULL, cudaMemcpyDeviceToHost);
        }
        iwork_dirtyOnCpu = false;
        muj = x[xpageoffset];
        b_muj += muj * muj;
      }
      dv_size[0] = 1;
      cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      BaumWelch_kernel13<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_muj,
                                                                  *gpu_dv_data);
    } else {
      BaumWelch_kernel5<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_C);
      if (x_size[0] == 0) {
        BaumWelch_kernel8<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_C);
      } else if (x_size[0] >= 2) {
        cudaMemcpy(gpu_m, &x_size[0], 4ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel6<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
            x_size[0], gpu_m, *gpu_x_data);
        b_muj = 1.0 / (static_cast<real_T>(x_size[0]) - 1.0);
        BaumWelch_kernel7<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_C);
        beta1 = 0.0;
        cublasDgemm(getCublasGlobalHandle(), CUBLAS_OP_C, CUBLAS_OP_N, 58, 58,
                    x_size[0], (double *)&b_muj, (double *)&(*gpu_x_data)[0],
                    x_size[0], (double *)&(*gpu_x_data)[0], x_size[0],
                    (double *)&beta1, (double *)&(*gpu_C)[0], 58);
      }
      dv_size[0] = 58;
      BaumWelch_kernel9<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_C,
                                                                  *gpu_dv_data);
    }
    if (Cov_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_real_T(&gpu_Cov, Cov);
    }
    BaumWelch_kernel14<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
        dv_size[0], i, *gpu_dv_data, gpu_Cov);
    dv_data_dirtyOnGpu = true;
    Cov_dirtyOnCpu = false;
    Cov_dirtyOnGpu = true;
    b_x_size[0] = idx1[i].f1.size[0];
    xpageoffset = idx1[i].f1.size[0] - 1;
    validLaunchParams =
        mwGetLaunchParameters1D(static_cast<real_T>((xpageoffset + 1LL) * 58LL),
                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      BaumWelch_kernel15<<<grid, block>>>(*gpu_X, *gpu_idx1, i, b_x_size[0],
                                          xpageoffset, *gpu_x_data);
    }
    vlen = idx1[i].f1.size[0];
    if (vlen == 0) {
      BaumWelch_kernel17<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*gpu_y);
    } else {
      BaumWelch_kernel16<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
          vlen, *gpu_idx1, i, *gpu_x_data, *gpu_y);
    }
    idx1_dirtyOnGpu = false;
    xpageoffset = Mu->size[0];
    cudaMemcpy(gpu_m, &idx1[i].f1.size[0], 4ULL, cudaMemcpyHostToDevice);
    if (Mu_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_real_T(&gpu_Mu, Mu);
    }
    BaumWelch_kernel18<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
        gpu_m, *gpu_y, i, xpageoffset, gpu_Mu);
    Mu_dirtyOnCpu = false;
    Mu_dirtyOnGpu = true;
  }
  //  Initialise Priors
  kEnd = Pi->size[0] * Pi->size[1];
  Pi->size[0] = 1;
  Pi->size[1] = static_cast<int32_T>(N);
  emxEnsureCapacity_real_T(Pi, kEnd, &c_emlrtRTEI);
  if (static_cast<int32_T>(N) != 0) {
    emlrtRandu(&Pi->data[0], static_cast<int32_T>(N));
  }
  vlen = Pi->size[1];
  if (Pi->size[1] == 0) {
    b_muj = 0.0;
  } else {
    b_muj = Pi->data[0];
    for (k = 0; k <= vlen - 2; k++) {
      b_muj += Pi->data[k + 1];
    }
  }
  kEnd = Pi->size[0] * Pi->size[1];
  Pi->size[0] = 1;
  emxEnsureCapacity_real_T(Pi, kEnd, &d_emlrtRTEI);
  kEnd = Pi->size[1];
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<real_T>((kEnd - 1) + 1LL), &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_Pi, Pi);
    BaumWelch_kernel19<<<grid, block>>>(kEnd, gpu_muj, gpu_Pi);
    Pi_dirtyOnCpu = false;
    Pi_dirtyOnGpu = true;
  }
  //  Initialise Transition matrix
  kEnd = trans->size[0] * trans->size[1];
  trans->size[0] = static_cast<int32_T>(N);
  trans->size[1] = static_cast<int32_T>(N);
  emxEnsureCapacity_real_T(trans, kEnd, &c_emlrtRTEI);
  if (static_cast<int32_T>(N) != 0) {
    emlrtRandu(&trans->data[0],
               static_cast<int32_T>(N) * static_cast<int32_T>(N));
  }
  emxInit_real_T(&y, 2, &h_emlrtRTEI, true);
  emxInit_real_T(&b_x, 2, &e_emlrtRTEI, true);
  kEnd = b_x->size[0] * b_x->size[1];
  b_x->size[0] = trans->size[1];
  b_x->size[1] = trans->size[0];
  emxEnsureCapacity_real_T(b_x, kEnd, &e_emlrtRTEI);
  gpuEmxEnsureCapacity_real_T(b_x, &b_gpu_x);
  vlen = trans->size[0] - 1;
  m = trans->size[1] - 1;
  xpageoffset = b_x->size[0];
  k = trans->size[0];
  validLaunchParams =
      mwGetLaunchParameters1D(static_cast<real_T>((m + 1LL) * (vlen + 1LL)),
                              &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
    trans_dirtyOnCpu = false;
    BaumWelch_kernel20<<<grid, block>>>(gpu_trans, m, vlen, xpageoffset, k,
                                        b_gpu_x);
  }
  vlen = b_x->size[0];
  if ((b_x->size[0] == 0) || (b_x->size[1] == 0)) {
    uint32_T sz[2];
    for (xpageoffset = 0; xpageoffset < 2; xpageoffset++) {
      sz[xpageoffset] = static_cast<uint32_T>(b_x->size[xpageoffset]);
    }
    kEnd = y->size[0] * y->size[1];
    y->size[0] = 1;
    y->size[1] = static_cast<int32_T>(sz[1]);
    emxEnsureCapacity_real_T(y, kEnd, &g_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(y, &b_gpu_y);
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((static_cast<int32_T>(sz[1]) - 1) + 1LL), &grid,
        &block, 1024U, 65535U);
    if (validLaunchParams) {
      BaumWelch_kernel22<<<grid, block>>>(static_cast<int32_T>(sz[1]) - 1,
                                          b_gpu_y);
    }
  } else {
    LDA = b_x->size[1] - 1;
    kEnd = y->size[0] * y->size[1];
    y->size[0] = 1;
    y->size[1] = b_x->size[1];
    emxEnsureCapacity_real_T(y, kEnd, &f_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(y, &b_gpu_y);
    xpageoffset = b_x->size[0];
    validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(LDA + 1LL),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
      BaumWelch_kernel21<<<grid, block>>>(vlen, b_gpu_x, gpu_LDA, xpageoffset,
                                          b_gpu_y);
    }
  }
  emxFree_real_T(&b_x);
  emxInit_real_T(&b_y, 1, &h_emlrtRTEI, true);
  kEnd = b_y->size[0];
  b_y->size[0] = y->size[1];
  emxEnsureCapacity_real_T(b_y, kEnd, &h_emlrtRTEI);
  gpuEmxEnsureCapacity_real_T(b_y, &c_gpu_y);
  xpageoffset = y->size[1] - 1;
  validLaunchParams = mwGetLaunchParameters1D(
      static_cast<real_T>(xpageoffset + 1LL), &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    BaumWelch_kernel23<<<grid, block>>>(b_gpu_y, xpageoffset, c_gpu_y);
    y_dirtyOnGpu = true;
  }
  emxFree_real_T(&y);
  if (trans->size[0] == b_y->size[0]) {
    emxInit_real_T(&b_trans, 2, &i_emlrtRTEI, true);
    kEnd = b_trans->size[0] * b_trans->size[1];
    b_trans->size[0] = trans->size[0];
    b_trans->size[1] = trans->size[1];
    emxEnsureCapacity_real_T(b_trans, kEnd, &i_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(b_trans, &b_gpu_trans);
    vlen = trans->size[1] - 1;
    m = trans->size[0] - 1;
    k = b_trans->size[0];
    xpageoffset = trans->size[0];
    validLaunchParams =
        mwGetLaunchParameters1D(static_cast<real_T>((m + 1LL) * (vlen + 1LL)),
                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (trans_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
      }
      trans_dirtyOnCpu = false;
      BaumWelch_kernel24<<<grid, block>>>(c_gpu_y, gpu_trans, m, vlen, k,
                                          xpageoffset, b_gpu_trans);
    }
    kEnd = trans->size[0] * trans->size[1];
    trans->size[0] = b_trans->size[0];
    trans->size[1] = b_trans->size[1];
    emxEnsureCapacity_real_T(trans, kEnd, &j_emlrtRTEI);
    if (!trans_dirtyOnCpu) {
      gpuEmxEnsureCapacity_real_T(trans, &gpu_trans);
    }
    vlen = b_trans->size[0] * b_trans->size[1] - 1;
    validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(vlen + 1LL),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (trans_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
      }
      BaumWelch_kernel25<<<grid, block>>>(b_gpu_trans, vlen, gpu_trans);
      trans_dirtyOnCpu = false;
      trans_dirtyOnGpu = true;
    }
    emxFree_real_T(&b_trans);
  } else {
    if (y_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_real_T(b_y, &c_gpu_y);
    }
    binary_expand_op(trans, b_y);
    trans_dirtyOnCpu = true;
  }
  emxFree_real_T(&b_y);
  i8 = static_cast<int32_T>(N);
  i9 = static_cast<int32_T>(N);
  i10 = static_cast<int32_T>(N);
  i13 = static_cast<int32_T>(N);
  i14 = static_cast<int32_T>(N);
  emxInit_real_T(&B, 2, &x_emlrtRTEI, true);
  emxInit_int32_T(&iv1, 1, &y_emlrtRTEI, true);
  emxInit_real_T(&alpha, 2, &m_emlrtRTEI, true);
  emxInit_real_T(&beta, 2, &o_emlrtRTEI, true);
  emxInit_real_T(&c_x, 2, &p_emlrtRTEI, true);
  emxInit_real_T(&Xi, 3, &r_emlrtRTEI, true);
  emxInit_real_T(&d_x, 2, &s_emlrtRTEI, true);
  emxInit_real_T(&Gamma, 2, &t_emlrtRTEI, true);
  emxInit_real_T(&a, 3, &w_emlrtRTEI, true);
  emxInit_real_T(&c_y, 2, &ab_emlrtRTEI, true);
  emxInit_real_T(&b_alpha, 2, &n_emlrtRTEI, true);
  emxInit_real_T(&c_alpha, 2, &q_emlrtRTEI, true);
  emxInit_real_T(&b_Xi, 3, &u_emlrtRTEI, true);
  for (int32_T cycle{0}; cycle < 100; cycle++) {
    //  Forward and backward algorithm to calculate the values of alpha and
    //  betha to determine the initial state probabilities
    kEnd = B->size[0] * B->size[1];
    B->size[0] = 1000;
    B->size[1] = static_cast<int32_T>(N);
    emxEnsureCapacity_real_T(B, kEnd, &k_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(B, &gpu_B);
    //  Find the probabilty of each observation being from each state
    for (i = 0; i < i8; i++) {
      if (Cov_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Cov, Cov);
      }
      if (C_dirtyOnCpu) {
        cudaMemcpy(*gpu_C, C, 26912ULL, cudaMemcpyHostToDevice);
      }
      BaumWelch_kernel26<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_Cov, i,
                                                                   *gpu_C);
      C_dirtyOnCpu = false;
      // MVNPDF Multivariate normal probability density function (pdf).
      //    Y = MVNPDF(X) returns the probability density of the multivariate
      //    normal distribution with zero mean and identity covariance matrix,
      //    evaluated at each row of X.  Rows of the N-by-D matrix X correspond
      //    to observations or points, and columns correspond to variables or
      //    coordinates.  Y is an N-by-1 vector.
      //
      //    Y = MVNPDF(X,MU) returns the density of the multivariate normal
      //    distribution with mean MU and identity covariance matrix, evaluated
      //    at each row of X.  MU is a 1-by-D vector, or an N-by-D matrix, in
      //    which case the density is evaluated for each row of X with the
      //    corresponding row of MU.  MU can also be a scalar value, which
      //    MVNPDF replicates to match the size of X.
      //
      //    Y = MVNPDF(X,MU,SIGMA) returns the density of the multivariate
      //    normal distribution with mean MU and covariance SIGMA, evaluated at
      //    each row of X.  SIGMA is a D-by-D matrix, or an D-by-D-by-N array,
      //    in which case the density is evaluated for each row of X with the
      //    corresponding page of SIGMA, i.e., MVNPDF computes Y(I) using X(I,:)
      //    and SIGMA(:,:,I). If the covariance matrix is diagonal, containing
      //    variances along the diagonal and zero covariances off the diagonal,
      //    SIGMA may also be specified as a 1-by-D matrix or a 1-by-D-by-N
      //    array, containing just the diagonal. Pass in the empty matrix for MU
      //    to use its default value when you want to only specify SIGMA.
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
      //  Get size of data.  Column vectors provisionally interpreted as
      //  multiple scalar data. Assume zero mean, data are already centered mean
      //  is a single row, rep it out to match data
      xpageoffset = Mu->size[0];
      if (Mu_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Mu, Mu);
      }
      Mu_dirtyOnCpu = false;
      BaumWelch_kernel27<<<dim3(114U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
          gpu_Mu, i, *gpu_X, xpageoffset, *gpu_X0);
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
      //    decomposition of SIGMA.  T is not necessarily triangular or square
      //    in this case.  Any eigenvectors whose corresponding eigenvalue is
      //    close to zero (within a small tolerance) are omitted.  If any
      //    remaining eigenvalues are negative, T is empty.
      //
      //    [T,P] = CHOLCOV(SIGMA) returns the number of negative eigenvalues of
      //    SIGMA, and T is empty if P>0.  If P==0, SIGMA is positive
      //    semi-definite.
      //
      //    If SIGMA is not square and symmetric, P is NaN and T is empty.
      //
      //    [T,P] = CHOLCOV(SIGMA,0) returns P==0 if SIGMA is positive definite,
      //    and T is the Cholesky factor.  If SIGMA is not positive definite, P
      //    is a positive integer and T is empty.  [...] = CHOLCOV(SIGMA,1) is
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
      BaumWelch_kernel28<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(gpu_Cov, i,
                                                                  *gpu_x);
      cudaMemcpy(x, *gpu_x, 464ULL, cudaMemcpyDeviceToHost);
      b_muj = x[0];
      for (b_vlen = 0; b_vlen < 57; b_vlen++) {
        beta1 = x[b_vlen + 1];
        if (std::isnan(beta1)) {
          p = false;
        } else if (std::isnan(b_muj)) {
          p = true;
        } else {
          p = (b_muj < beta1);
        }
        if (p) {
          b_muj = beta1;
        }
      }
      if ((!std::isinf(b_muj)) && (!std::isnan(b_muj))) {
        if (b_muj <= 2.2250738585072014E-308) {
          b_muj = 4.94065645841247E-324;
        } else {
          frexp(b_muj, &exponent);
          b_muj = std::ldexp(1.0, exponent - 53);
        }
      } else {
        b_muj = rtNaN;
      }
      b_muj *= 10.0;
      Cov_dirtyOnCpu = false;
      BaumWelch_kernel29<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(gpu_Cov, i,
                                                                   *e_gpu_x);
      BaumWelch_kernel30<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*e_gpu_x,
                                                                   *d_gpu_y);
      BaumWelch_kernel31<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*e_gpu_y);
      cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      BaumWelch_kernel32<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
          1, gpu_muj, *d_gpu_y, *e_gpu_y);
      y_dirtyOnGpu = true;
      p = true;
      k = 0;
      exitg1 = false;
      while ((!exitg1) && (k < 58)) {
        if (y_dirtyOnGpu) {
          cudaMemcpy(d_y, *e_gpu_y, 58ULL, cudaMemcpyDeviceToHost);
        }
        y_dirtyOnGpu = false;
        if (!d_y[k]) {
          p = false;
          exitg1 = true;
        } else {
          k++;
        }
      }
      if (p) {
        cusolverDnDpotrf_bufferSize(
            getCuSolverGlobalHandle(), CUBLAS_FILL_MODE_UPPER, 58,
            (double *)&(*gpu_C)[0], 58, getCuSolverWorkspaceReq());
        setCuSolverWorkspaceTypeSize(8);
        cusolverInitWorkspace();
        if (info_t_dirtyOnCpu) {
          cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        }
        cusolverDnDpotrf(getCuSolverGlobalHandle(), CUBLAS_FILL_MODE_UPPER, 58,
                         (double *)&(*gpu_C)[0], 58,
                         static_cast<real_T *>(getCuSolverWorkspaceBuff()),
                         *getCuSolverWorkspaceReq(), gpu_info_t);
        info_t_dirtyOnCpu = false;
        iwork_dirtyOnCpu = true;
        cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
        if (info_t < 0) {
          BaumWelch_kernel33<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_C);
        }
        if (info_t == 0) {
          m = 56;
        } else {
          m = info_t - 3;
        }
        for (j = 0; j <= m; j++) {
          for (b_vlen = 0; b_vlen <= m - j; b_vlen++) {
            if (iwork_dirtyOnCpu) {
              cudaMemcpy(C, *gpu_C, 26912ULL, cudaMemcpyDeviceToHost);
            }
            C[((j + b_vlen) + 58 * j) + 1] = 0.0;
            iwork_dirtyOnCpu = false;
            C_dirtyOnCpu = true;
          }
        }
        if (m + 2 < 1) {
          LDA = -1;
          m = -1;
        } else {
          LDA = m + 1;
          m++;
        }
        T_size[0] = LDA + 1;
        T_size[1] = m + 1;
        validLaunchParams = mwGetLaunchParameters1D(
            static_cast<real_T>((LDA + 1LL) * (m + 1LL)), &grid, &block, 1024U,
            65535U);
        if (validLaunchParams) {
          cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
          cudaMemcpy(gpu_m, &m, 4ULL, cudaMemcpyHostToDevice);
          if (C_dirtyOnCpu) {
            cudaMemcpy(*gpu_C, C, 26912ULL, cudaMemcpyHostToDevice);
          }
          BaumWelch_kernel34<<<grid, block>>>(LDA + 1, gpu_LDA, gpu_m, *gpu_C,
                                              *gpu_T_data);
          C_dirtyOnCpu = false;
        }
        b_muj = info_t;
        idx1_dirtyOnGpu = true;
        if (info_t > 0) {
          //  Test for positive definiteness
          T_size[0] = 0;
          T_size[1] = 0;
        }
      } else {
        T_size[0] = 0;
        T_size[1] = 0;
        b_muj = rtNaN;
        idx1_dirtyOnGpu = true;
      }
      if (b_muj != 0.0) {
        e_y = nullptr;
        b_m = emlrtCreateCharArray(2, &iv2[0]);
        emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 26, b_m, &varargin_1[0]);
        emlrtAssign(&e_y, b_m);
        f_y = nullptr;
        b_m = emlrtCreateCharArray(2, &iv3[0]);
        emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 46, b_m, &varargin_2[0]);
        emlrtAssign(&f_y, b_m);
        b_error(e_y, f_y, &emlrtMCI);
      }
      //  Create array of standardized data, and compute log(sqrt(det(Sigma)))
      xpageoffset = T_size[0] * T_size[1] - 1;
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(xpageoffset + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        BaumWelch_kernel35<<<grid, block>>>(*gpu_T_data, xpageoffset,
                                            *gpu_dv_data);
        dv_data_dirtyOnGpu = true;
      }
      if (T_size[0] == 0) {
        b_vlen = 0;
      } else if (T_size[0] == 58) {
        cusolverDnDgetrf_bufferSize(getCuSolverGlobalHandle(), 58, 58,
                                    (double *)&(*gpu_dv_data)[0], 58,
                                    getCuSolverWorkspaceReq());
        setCuSolverWorkspaceTypeSize(8);
        cusolverInitWorkspace();
        if (info_t_dirtyOnCpu) {
          cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        }
        cusolverDnDgetrf(getCuSolverGlobalHandle(), 58, 58,
                         (double *)&(*gpu_dv_data)[0], 58,
                         static_cast<real_T *>(getCuSolverWorkspaceBuff()),
                         &(*gpu_ipiv_t)[0], gpu_info_t);
        dv_data_dirtyOnGpu = true;
        info_t_dirtyOnCpu = false;
        cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
        if (info_t < 0) {
          xpageoffset = 58 * T_size[1] - 1;
          validLaunchParams =
              mwGetLaunchParameters1D(static_cast<real_T>(xpageoffset + 1LL),
                                      &grid, &block, 1024U, 65535U);
          if (validLaunchParams) {
            BaumWelch_kernel49<<<grid, block>>>(xpageoffset, *gpu_dv_data);
          }
          BaumWelch_kernel50<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
              *gpu_ipiv_data);
          iwork_dirtyOnCpu = true;
        } else {
          BaumWelch_kernel48<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
              *gpu_ipiv_t, *gpu_ipiv_data);
          iwork_dirtyOnCpu = true;
        }
        b_muj = 1.0;
        cublasDtrsm(getCublasGlobalHandle(), CUBLAS_SIDE_RIGHT,
                    CUBLAS_FILL_MODE_UPPER, CUBLAS_OP_N, CUBLAS_DIAG_NON_UNIT,
                    1000, 58, (double *)&b_muj, (double *)&(*gpu_dv_data)[0],
                    58, (double *)&(*gpu_X0)[0], 1000);
        b_muj = 1.0;
        cublasDtrsm(getCublasGlobalHandle(), CUBLAS_SIDE_RIGHT,
                    CUBLAS_FILL_MODE_LOWER, CUBLAS_OP_N, CUBLAS_DIAG_UNIT, 1000,
                    58, (double *)&b_muj, (double *)&(*gpu_dv_data)[0], 58,
                    (double *)&(*gpu_X0)[0], 1000);
        p = false;
        idx_dirtyOnGpu = true;
        for (j = 0; j < 57; j++) {
          if (iwork_dirtyOnCpu) {
            cudaMemcpy(ipiv_data, *gpu_ipiv_data, 232ULL,
                       cudaMemcpyDeviceToHost);
          }
          iwork_dirtyOnCpu = false;
          kEnd = ipiv_data[56 - j];
          if (kEnd != 57 - j) {
            for (b_vlen = 0; b_vlen < 1000; b_vlen++) {
              if (idx_dirtyOnGpu) {
                cudaMemcpy(SD->f0.X0, *gpu_X0, 464000ULL,
                           cudaMemcpyDeviceToHost);
              }
              b_muj = SD->f0.X0[b_vlen + 1000 * (56 - j)];
              SD->f0.X0[b_vlen + 1000 * (56 - j)] =
                  SD->f0.X0[b_vlen + 1000 * (kEnd - 1)];
              SD->f0.X0[b_vlen + 1000 * (kEnd - 1)] = b_muj;
              idx_dirtyOnGpu = false;
              p = true;
            }
          }
        }
        b_vlen = 58;
        if (p) {
          cudaMemcpy(*gpu_X0, SD->f0.X0, 464000ULL, cudaMemcpyHostToDevice);
        }
        BaumWelch_kernel51<<<dim3(114U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
            *gpu_X0, *gpu_xRinv_data);
      } else {
        ptrdiff_t b_info_t;
        m = T_size[0];
        idx_dirtyOnGpu = true;
        validLaunchParams = mwGetLaunchParameters1D(
            static_cast<real_T>(((T_size[1] - 1) + 1LL) *
                                ((T_size[0] - 1) + 1LL)),
            &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          BaumWelch_kernel36<<<grid, block>>>(*gpu_T_data, T_size[0],
                                              T_size[1] - 1, T_size[0] - 1,
                                              *gpu_dv_data);
          dv_data_dirtyOnGpu = true;
        }
        BaumWelch_kernel37<<<dim3(114U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
            *gpu_X0, *b_gpu_B);
        validLaunchParams =
            mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                    &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          cudaMemcpy(gpu_m, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
          idx_dirtyOnGpu = false;
          BaumWelch_kernel38<<<grid, block>>>(gpu_m, *gpu_ipiv_t);
        }
        validLaunchParams =
            mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                    &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          if (idx_dirtyOnGpu) {
            cudaMemcpy(gpu_m, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
          }
          idx_dirtyOnGpu = false;
          if (jpvt_t_data_dirtyOnCpu) {
            cudaMemcpy(*gpu_jpvt_t_data, jpvt_t_data, 464ULL,
                       cudaMemcpyHostToDevice);
          }
          BaumWelch_kernel39<<<grid, block>>>(gpu_m, *gpu_jpvt_t_data);
          jpvt_t_data_dirtyOnGpu = true;
        }
        if (dv_data_dirtyOnGpu) {
          cudaMemcpy(dv_data, *gpu_dv_data, 26912ULL, cudaMemcpyDeviceToHost);
        }
        if (jpvt_t_data_dirtyOnGpu) {
          cudaMemcpy(jpvt_t_data, *gpu_jpvt_t_data, 464ULL,
                     cudaMemcpyDeviceToHost);
        }
        b_info_t =
            LAPACKE_dgeqp3(102, (ptrdiff_t)58, (ptrdiff_t)T_size[0],
                           &dv_data[0], (ptrdiff_t)58, &jpvt_t_data[0], &x[0]);
        iwork_dirtyOnCpu = true;
        dv_data_dirtyOnGpu = false;
        p = true;
        jpvt_t_data_dirtyOnGpu = false;
        jpvt_t_data_dirtyOnCpu = true;
        if ((int32_T)b_info_t != 0) {
          validLaunchParams = mwGetLaunchParameters1D(
              static_cast<real_T>(58LL * ((T_size[0] - 1) + 1LL)), &grid,
              &block, 1024U, 65535U);
          if (validLaunchParams) {
            if (idx_dirtyOnGpu) {
              cudaMemcpy(gpu_m, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
            }
            idx_dirtyOnGpu = false;
            cudaMemcpy(*gpu_dv_data, dv_data, 26912ULL, cudaMemcpyHostToDevice);
            BaumWelch_kernel41<<<grid, block>>>(gpu_m, *gpu_dv_data);
            p = false;
            dv_data_dirtyOnGpu = true;
          }
          validLaunchParams = mwGetLaunchParameters1D(
              static_cast<real_T>((T_size[0] - 1) + 1LL), &grid, &block, 1024U,
              65535U);
          if (validLaunchParams) {
            if (idx_dirtyOnGpu) {
              cudaMemcpy(gpu_m, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
            }
            idx_dirtyOnGpu = false;
            cudaMemcpy(*gpu_x, x, 464ULL, cudaMemcpyHostToDevice);
            BaumWelch_kernel42<<<grid, block>>>(gpu_m, *gpu_x);
            iwork_dirtyOnCpu = false;
          }
          validLaunchParams = mwGetLaunchParameters1D(
              static_cast<real_T>((T_size[0] - 1) + 1LL), &grid, &block, 1024U,
              65535U);
          if (validLaunchParams) {
            if (idx_dirtyOnGpu) {
              cudaMemcpy(gpu_m, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
            }
            BaumWelch_kernel43<<<grid, block>>>(gpu_m, *gpu_ipiv_t);
          }
        } else {
          validLaunchParams = mwGetLaunchParameters1D(
              static_cast<real_T>((T_size[0] - 1) + 1LL), &grid, &block, 1024U,
              65535U);
          if (validLaunchParams) {
            cudaMemcpy(*gpu_jpvt_t_data, jpvt_t_data, 464ULL,
                       cudaMemcpyHostToDevice);
            jpvt_t_data_dirtyOnCpu = false;
            if (idx_dirtyOnGpu) {
              cudaMemcpy(gpu_m, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
            }
            BaumWelch_kernel40<<<grid, block>>>(*gpu_jpvt_t_data, gpu_m,
                                                *gpu_ipiv_t);
          }
        }
        LDA = 0;
        if (dv_data_dirtyOnGpu) {
          cudaMemcpy(dv_data, *gpu_dv_data, 26912ULL, cudaMemcpyDeviceToHost);
        }
        b_muj = 1.2878587085651816E-13 * std::abs(dv_data[0]);
        while ((LDA < m) && (!(std::abs(dv_data[LDA + 58 * LDA]) <= b_muj))) {
          LDA++;
        }
        validLaunchParams = mwGetLaunchParameters1D(
            static_cast<real_T>((static_cast<int16_T>(T_size[0]) * 1000 - 1) +
                                1LL),
            &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          BaumWelch_kernel44<<<grid, block>>>(static_cast<int16_T>(T_size[0]),
                                              *gpu_Y_data);
        }
        info_t = 0;
        if (p) {
          cudaMemcpy(*gpu_dv_data, dv_data, 26912ULL, cudaMemcpyHostToDevice);
        }
        if (iwork_dirtyOnCpu) {
          cudaMemcpy(*gpu_x, x, 464ULL, cudaMemcpyHostToDevice);
        }
        cusolverDnDormqr_bufferSize(
            getCuSolverGlobalHandle(), CUBLAS_SIDE_LEFT, CUBLAS_OP_T, 58, 1000,
            T_size[0], (double *)&(*gpu_dv_data)[0], 58, (double *)&(*gpu_x)[0],
            (double *)&(*b_gpu_B)[0], 58, getCuSolverWorkspaceReq());
        setCuSolverWorkspaceTypeSize(8);
        cusolverInitWorkspace();
        cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        cusolverDnDormqr(getCuSolverGlobalHandle(), CUBLAS_SIDE_LEFT,
                         CUBLAS_OP_T, 58, 1000, T_size[0],
                         (double *)&(*gpu_dv_data)[0], 58,
                         (double *)&(*gpu_x)[0], (double *)&(*b_gpu_B)[0], 58,
                         static_cast<real_T *>(getCuSolverWorkspaceBuff()),
                         *getCuSolverWorkspaceReq(), gpu_info_t);
        info_t_dirtyOnCpu = false;
        cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
        if (info_t < 0) {
          BaumWelch_kernel45<<<dim3(114U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
              *b_gpu_B);
        }
        cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel46<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
            T_size[0], gpu_LDA, *gpu_dv_data, *b_gpu_B, *gpu_ipiv_t,
            *gpu_Y_data);
        dv_data_dirtyOnGpu = true;
        b_vlen = T_size[0];
        validLaunchParams = mwGetLaunchParameters1D(
            static_cast<real_T>(1000LL * ((T_size[0] - 1) + 1LL)), &grid,
            &block, 1024U, 65535U);
        if (validLaunchParams) {
          BaumWelch_kernel47<<<grid, block>>>(*gpu_Y_data, T_size[0],
                                              T_size[0] - 1, *gpu_xRinv_data);
        }
      }
      validLaunchParams =
          mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(gpu_m, &T_size[0], 4ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel52<<<grid, block>>>(*gpu_T_data, T_size[0], gpu_m,
                                            *gpu_x);
      }
      m = T_size[0] - 1;
      validLaunchParams =
          mwGetLaunchParameters1D(static_cast<real_T>((T_size[0] - 1) + 1LL),
                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(gpu_m, &m, 4ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel53<<<grid, block>>>(gpu_m, *gpu_x);
      }
      if (T_size[0] == 0) {
        b_muj = 0.0;
      } else {
        cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel54<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_x,
                                                                    gpu_muj);
        idx1_dirtyOnGpu = false;
        validLaunchParams =
            mwGetLaunchParameters(static_cast<real_T>((T_size[0] - 2) + 1LL),
                                  &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          BaumWelch_kernel55<<<grid, block>>>(T_size[0], *gpu_x, gpu_muj);
        }
      }
      //  The quadratic form is the inner products of the standardized data
      m = 1000 * b_vlen - 1;
      validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(m + 1LL),
                                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(gpu_m, &m, 4ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel56<<<grid, block>>>(*gpu_xRinv_data, gpu_m,
                                            *gpu_y_data);
      }
      if (b_vlen == 0) {
        BaumWelch_kernel59<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
            *gpu_quadform);
      } else {
        BaumWelch_kernel57<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
            *gpu_y_data, *gpu_quadform);
        for (k = 0; k <= b_vlen - 2; k++) {
          LDA = (k + 1) * 1000;
          cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
          BaumWelch_kernel58<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
              *gpu_y_data, gpu_LDA, *gpu_quadform);
        }
      }
      if (idx1_dirtyOnGpu) {
        cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      }
      BaumWelch_kernel60<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
          *gpu_quadform, i, gpu_muj, gpu_B);
      B_dirtyOnGpu = true;
    }
    LDA = 1000 * B->size[1] - 1;
    m = 0;
    for (i = 0; i <= LDA; i++) {
      if (B_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(B, &gpu_B);
      }
      B_dirtyOnGpu = false;
      if (B->data[i] == 0.0) {
        m++;
      }
    }
    kEnd = iv1->size[0];
    iv1->size[0] = m;
    emxEnsureCapacity_int32_T(iv1, kEnd, &l_emlrtRTEI);
    if (!iv1_dirtyOnCpu) {
      gpuEmxEnsureCapacity_int32_T(iv1, &gpu_iv1);
    }
    m = 0;
    for (i = 0; i <= LDA; i++) {
      if (B_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(B, &gpu_B);
      }
      B_dirtyOnGpu = false;
      if (B->data[i] == 0.0) {
        iv1->data[m] = i + 1;
        iv1_dirtyOnCpu = true;
        m++;
      }
    }
    kEnd = iv1->size[0];
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((kEnd - 1) + 1LL), &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (iv1_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(&gpu_iv1, iv1);
      }
      iv1_dirtyOnCpu = false;
      BaumWelch_kernel61<<<grid, block>>>(gpu_iv1, kEnd, gpu_B);
      B_dirtyOnGpu = true;
    }
    //  Initial alpha step
    kEnd = alpha->size[0] * alpha->size[1];
    alpha->size[0] = 1000;
    alpha->size[1] = static_cast<int32_T>(N);
    emxEnsureCapacity_real_T(alpha, kEnd, &m_emlrtRTEI);
    if (!alpha_dirtyOnCpu) {
      gpuEmxEnsureCapacity_real_T(alpha, &gpu_alpha);
    }
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((1000 * static_cast<int32_T>(N) - 1) + 1LL), &grid,
        &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (alpha_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
      }
      BaumWelch_kernel62<<<grid, block>>>(N, gpu_alpha);
      alpha_dirtyOnCpu = false;
      alpha_dirtyOnGpu = true;
    }
    BaumWelch_kernel63<<<dim3(2U, 1U, 1U), dim3(512U, 1U, 1U)>>>(*gpu_scale);
    if (Pi->size[1] == B->size[1]) {
      xpageoffset = Pi->size[1] - 1;
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(xpageoffset + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        if (Pi_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_Pi, Pi);
        }
        Pi_dirtyOnCpu = false;
        if (alpha_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
        }
        BaumWelch_kernel64<<<grid, block>>>(gpu_B, gpu_Pi, xpageoffset,
                                            gpu_alpha);
        alpha_dirtyOnCpu = false;
        alpha_dirtyOnGpu = true;
      }
    } else {
      if (alpha_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(alpha, &gpu_alpha);
      }
      if (Pi_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(Pi, &gpu_Pi);
      }
      Pi_dirtyOnGpu = false;
      if (B_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(B, &gpu_B);
      }
      B_dirtyOnGpu = false;
      binary_expand_op(alpha, Pi, B);
      alpha_dirtyOnGpu = false;
      alpha_dirtyOnCpu = true;
    }
    vlen = alpha->size[1];
    if (alpha->size[1] == 0) {
      b_muj = 0.0;
    } else {
      if (alpha_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(alpha, &gpu_alpha);
      }
      alpha_dirtyOnGpu = false;
      b_muj = alpha->data[0];
      for (k = 0; k <= vlen - 2; k++) {
        b_muj += alpha->data[1000 * (k + 1)];
      }
    }
    cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
    BaumWelch_kernel65<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_muj,
                                                                *gpu_scale);
    kEnd = alpha->size[1] - 1;
    b_vlen = b_alpha->size[0] * b_alpha->size[1];
    b_alpha->size[0] = 1;
    b_alpha->size[1] = alpha->size[1];
    emxEnsureCapacity_real_T(b_alpha, b_vlen, &n_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(b_alpha, &b_gpu_alpha);
    validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(kEnd + 1LL),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (alpha_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
      }
      alpha_dirtyOnCpu = false;
      BaumWelch_kernel66<<<grid, block>>>(gpu_alpha, kEnd, gpu_muj,
                                          b_gpu_alpha);
    }
    xpageoffset = b_alpha->size[1] - 1;
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>(xpageoffset + 1LL), &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (alpha_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
      }
      BaumWelch_kernel67<<<grid, block>>>(b_gpu_alpha, xpageoffset, gpu_alpha);
      alpha_dirtyOnCpu = false;
      alpha_dirtyOnGpu = true;
    }
    //  Alpha recursion
    for (info_t = 0; info_t < 999; info_t++) {
      iwork_dirtyOnCpu = false;
      info_t_dirtyOnCpu = true;
      for (i = 0; i < i9; i++) {
        if (trans->size[0] == alpha->size[1]) {
          kEnd = alpha->size[1] - 1;
          b_vlen = c_x->size[0] * c_x->size[1];
          c_x->size[0] = 1;
          c_x->size[1] = alpha->size[1];
          emxEnsureCapacity_real_T(c_x, b_vlen, &p_emlrtRTEI);
          if (!x_dirtyOnCpu) {
            gpuEmxEnsureCapacity_real_T(c_x, &c_gpu_x);
          }
          k = trans->size[0];
          validLaunchParams = mwGetLaunchParameters1D(
              static_cast<real_T>(kEnd + 1LL), &grid, &block, 1024U, 65535U);
          if (validLaunchParams) {
            if (trans_dirtyOnCpu) {
              gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
            }
            trans_dirtyOnCpu = false;
            if (alpha_dirtyOnCpu) {
              gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
            }
            alpha_dirtyOnCpu = false;
            if (info_t_dirtyOnCpu) {
              cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
            }
            if (x_dirtyOnCpu) {
              gpuEmxMemcpyCpuToGpu_real_T(&c_gpu_x, c_x);
            }
            BaumWelch_kernel68<<<grid, block>>>(i, gpu_trans, gpu_alpha, kEnd,
                                                k, gpu_info_t, c_gpu_x);
            info_t_dirtyOnCpu = false;
            x_dirtyOnCpu = false;
            x_dirtyOnGpu = true;
          }
        } else {
          if (x_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(c_x, &c_gpu_x);
          }
          if (alpha_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(alpha, &gpu_alpha);
          }
          if (iwork_dirtyOnCpu) {
            cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
          }
          if (trans_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(trans, &gpu_trans);
          }
          trans_dirtyOnGpu = false;
          binary_expand_op(c_x, alpha, info_t, trans, i);
          x_dirtyOnGpu = false;
          x_dirtyOnCpu = true;
        }
        vlen = c_x->size[1];
        if (c_x->size[1] == 0) {
          b_muj = 0.0;
        } else {
          if (x_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(c_x, &c_gpu_x);
          }
          x_dirtyOnGpu = false;
          b_muj = c_x->data[0];
          for (k = 0; k <= vlen - 2; k++) {
            b_muj += c_x->data[k + 1];
          }
        }
        cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
        if (info_t_dirtyOnCpu) {
          cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        }
        if (alpha_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
        }
        BaumWelch_kernel69<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
            gpu_B, i, gpu_muj, gpu_info_t, gpu_alpha);
        info_t_dirtyOnCpu = false;
        iwork_dirtyOnCpu = true;
        alpha_dirtyOnCpu = false;
        alpha_dirtyOnGpu = true;
      }
      vlen = alpha->size[1];
      if (alpha->size[1] == 0) {
        b_muj = 0.0;
      } else {
        if (alpha_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(alpha, &gpu_alpha);
        }
        alpha_dirtyOnGpu = false;
        if (iwork_dirtyOnCpu) {
          cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
        }
        b_muj = alpha->data[info_t + 1];
        for (k = 0; k <= vlen - 2; k++) {
          b_muj += alpha->data[(info_t + 1000 * (k + 1)) + 1];
        }
      }
      cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      if (info_t_dirtyOnCpu) {
        cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
      }
      BaumWelch_kernel70<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
          gpu_muj, gpu_info_t, *gpu_scale);
      info_t_dirtyOnCpu = false;
      cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
      m = info_t + 1;
      LDA = info_t + 1;
      kEnd = alpha->size[1] - 1;
      b_vlen = c_alpha->size[0] * c_alpha->size[1];
      c_alpha->size[0] = 1;
      c_alpha->size[1] = alpha->size[1];
      emxEnsureCapacity_real_T(c_alpha, b_vlen, &q_emlrtRTEI);
      gpuEmxEnsureCapacity_real_T(c_alpha, &c_gpu_alpha);
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(kEnd + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        if (alpha_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
        }
        alpha_dirtyOnCpu = false;
        cudaMemcpy(gpu_m, &m, 4ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel71<<<grid, block>>>(gpu_alpha, gpu_m, kEnd, gpu_muj,
                                            c_gpu_alpha);
      }
      xpageoffset = c_alpha->size[1] - 1;
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(xpageoffset + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
        if (alpha_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
        }
        BaumWelch_kernel72<<<grid, block>>>(c_gpu_alpha, gpu_LDA, xpageoffset,
                                            gpu_alpha);
        alpha_dirtyOnCpu = false;
        alpha_dirtyOnGpu = true;
      }
    }
    //  Beta recursion
    kEnd = beta->size[0] * beta->size[1];
    beta->size[0] = 1000;
    beta->size[1] = static_cast<int32_T>(N);
    emxEnsureCapacity_real_T(beta, kEnd, &o_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(beta, &gpu_beta);
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((1000 * static_cast<int32_T>(N) - 1) + 1LL), &grid,
        &block, 1024U, 65535U);
    if (validLaunchParams) {
      BaumWelch_kernel73<<<grid, block>>>(N, gpu_beta);
      beta_dirtyOnGpu = true;
    }
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>((static_cast<int32_T>(N) - 1) + 1LL), &grid, &block,
        1024U, 65535U);
    if (validLaunchParams) {
      BaumWelch_kernel74<<<grid, block>>>(*gpu_scale, static_cast<int32_T>(N),
                                          gpu_beta);
      beta_dirtyOnGpu = true;
    }
    for (info_t = 0; info_t < 999; info_t++) {
      iwork_dirtyOnCpu = false;
      info_t_dirtyOnCpu = true;
      for (i = 0; i < i10; i++) {
        if (trans->size[1] == 1) {
          vlen = B->size[1];
        } else {
          vlen = trans->size[1];
        }
        if ((trans->size[1] == B->size[1]) && (vlen == beta->size[1])) {
          if (iwork_dirtyOnCpu) {
            cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
          }
          kEnd = 999 - info_t;
          LDA = trans->size[1] - 1;
          m = d_x->size[0] * d_x->size[1];
          d_x->size[0] = 1;
          d_x->size[1] = trans->size[1];
          emxEnsureCapacity_real_T(d_x, m, &s_emlrtRTEI);
          if (!b_x_dirtyOnCpu) {
            gpuEmxEnsureCapacity_real_T(d_x, &d_gpu_x);
          }
          k = trans->size[0];
          validLaunchParams = mwGetLaunchParameters1D(
              static_cast<real_T>(LDA + 1LL), &grid, &block, 1024U, 65535U);
          if (validLaunchParams) {
            if (trans_dirtyOnCpu) {
              gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
            }
            trans_dirtyOnCpu = false;
            cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
            if (b_x_dirtyOnCpu) {
              gpuEmxMemcpyCpuToGpu_real_T(&d_gpu_x, d_x);
            }
            BaumWelch_kernel75<<<grid, block>>>(gpu_beta, 999 - info_t, gpu_B,
                                                kEnd, gpu_trans, i, gpu_LDA, k,
                                                d_gpu_x);
            b_x_dirtyOnCpu = false;
            b_x_dirtyOnGpu = true;
          }
        } else {
          if (b_x_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(d_x, &d_gpu_x);
          }
          if (trans_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(trans, &gpu_trans);
          }
          trans_dirtyOnGpu = false;
          if (B_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(B, &gpu_B);
          }
          B_dirtyOnGpu = false;
          if (iwork_dirtyOnCpu) {
            cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
          }
          if (beta_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(beta, &gpu_beta);
          }
          binary_expand_op(d_x, trans, i, B, info_t, beta);
          b_x_dirtyOnGpu = false;
          b_x_dirtyOnCpu = true;
        }
        vlen = d_x->size[1];
        if (d_x->size[1] == 0) {
          b_muj = 0.0;
        } else {
          if (b_x_dirtyOnGpu) {
            gpuEmxMemcpyGpuToCpu_real_T(d_x, &d_gpu_x);
          }
          b_x_dirtyOnGpu = false;
          b_muj = d_x->data[0];
          for (k = 0; k <= vlen - 2; k++) {
            b_muj += d_x->data[k + 1];
          }
        }
        cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
        if (info_t_dirtyOnCpu) {
          cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        }
        BaumWelch_kernel76<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(
            *gpu_scale, i, gpu_muj, gpu_info_t, gpu_beta);
        beta_dirtyOnGpu = true;
        info_t_dirtyOnCpu = false;
        iwork_dirtyOnCpu = true;
      }
    }
    //  E (Expectation step) Estimate the state occupation probabilities
    //  which is necessary to obtain the training step of the HMM model
    kEnd = Xi->size[0] * Xi->size[1] * Xi->size[2];
    Xi->size[0] = 999;
    Xi->size[1] = static_cast<int32_T>(N);
    Xi->size[2] = static_cast<int32_T>(N);
    emxEnsureCapacity_real_T(Xi, kEnd, &r_emlrtRTEI);
    gpuEmxEnsureCapacity_real_T(Xi, &gpu_Xi);
    validLaunchParams = mwGetLaunchParameters1D(
        static_cast<real_T>(
            (999 * static_cast<int32_T>(N) * static_cast<int32_T>(N) - 1) +
            1LL),
        &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      BaumWelch_kernel77<<<grid, block>>>(N, gpu_Xi);
      Xi_dirtyOnGpu = true;
    }
    for (info_t = 0; info_t < 999; info_t++) {
      iwork_dirtyOnCpu = false;
      info_t_dirtyOnCpu = true;
      LDA = Xi->size[1];
      k = trans->size[0];
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(((static_cast<int32_T>(N) - 1) + 1LL) *
                              ((static_cast<int32_T>(N) - 1) + 1LL)),
          &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        if (trans_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
        }
        trans_dirtyOnCpu = false;
        if (alpha_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_alpha, alpha);
        }
        alpha_dirtyOnCpu = false;
        cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        BaumWelch_kernel78<<<grid, block>>>(
            gpu_beta, gpu_B, gpu_trans, gpu_alpha, N,
            static_cast<int32_T>(N) - 1, LDA, k, gpu_info_t, gpu_Xi);
        info_t_dirtyOnCpu = false;
        iwork_dirtyOnCpu = true;
        Xi_dirtyOnGpu = true;
      }
      vlen = Xi->size[1] * Xi->size[2];
      if (Xi->size[1] * Xi->size[2] == 0) {
        b_muj = 0.0;
      } else {
        if (Xi_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(Xi, &gpu_Xi);
        }
        Xi_dirtyOnGpu = false;
        if (iwork_dirtyOnCpu) {
          cudaMemcpy(&info_t, gpu_info_t, 4ULL, cudaMemcpyDeviceToHost);
        }
        b_muj = Xi->data[info_t];
        for (k = 0; k <= vlen - 2; k++) {
          b_muj += Xi->data[(info_t + 999 * ((k + 1) % Xi->size[1])) +
                            999 * Xi->size[1] * ((k + 1) / Xi->size[1])];
        }
      }
      kEnd = Xi->size[1] - 1;
      b_vlen = Xi->size[2] - 1;
      LDA = b_Xi->size[0] * b_Xi->size[1] * b_Xi->size[2];
      b_Xi->size[0] = 1;
      b_Xi->size[1] = Xi->size[1];
      b_Xi->size[2] = Xi->size[2];
      emxEnsureCapacity_real_T(b_Xi, LDA, &u_emlrtRTEI);
      gpuEmxEnsureCapacity_real_T(b_Xi, &b_gpu_Xi);
      LDA = b_Xi->size[1];
      vlen = Xi->size[1];
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>((kEnd + 1LL) * (b_vlen + 1LL)), &grid, &block,
          1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
        if (info_t_dirtyOnCpu) {
          cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        }
        BaumWelch_kernel79<<<grid, block>>>(gpu_Xi, kEnd, b_vlen, LDA, vlen,
                                            gpu_muj, gpu_info_t, b_gpu_Xi);
        info_t_dirtyOnCpu = false;
      }
      m = b_Xi->size[2] - 1;
      xpageoffset = b_Xi->size[1] - 1;
      LDA = Xi->size[1];
      vlen = b_Xi->size[1];
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>((xpageoffset + 1LL) * (m + 1LL)), &grid, &block,
          1024U, 65535U);
      if (validLaunchParams) {
        if (info_t_dirtyOnCpu) {
          cudaMemcpy(gpu_info_t, &info_t, 4ULL, cudaMemcpyHostToDevice);
        }
        info_t_dirtyOnCpu = false;
        BaumWelch_kernel80<<<grid, block>>>(b_gpu_Xi, xpageoffset, m, LDA, vlen,
                                            gpu_info_t, gpu_Xi);
        Xi_dirtyOnGpu = true;
      }
    }
    vlen = Xi->size[2];
    if ((Xi->size[1] == 0) || (Xi->size[2] == 0)) {
      uint32_T b_sz[3];
      for (xpageoffset = 0; xpageoffset < 3; xpageoffset++) {
        b_sz[xpageoffset] = static_cast<uint32_T>(Xi->size[xpageoffset]);
      }
      kEnd = Gamma->size[0] * Gamma->size[1];
      Gamma->size[0] = 999;
      Gamma->size[1] = static_cast<int32_T>(b_sz[1]);
      emxEnsureCapacity_real_T(Gamma, kEnd, &t_emlrtRTEI);
      gpuEmxEnsureCapacity_real_T(Gamma, &gpu_Gamma);
      xpageoffset = 999 * static_cast<int32_T>(b_sz[1]) - 1;
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(xpageoffset + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        BaumWelch_kernel83<<<grid, block>>>(xpageoffset, gpu_Gamma);
        Gamma_dirtyOnGpu = true;
      }
    } else {
      m = 999 * Xi->size[1] - 1;
      idx_dirtyOnGpu = true;
      kEnd = Gamma->size[0] * Gamma->size[1];
      Gamma->size[0] = 999;
      Gamma->size[1] = Xi->size[1];
      emxEnsureCapacity_real_T(Gamma, kEnd, &f_emlrtRTEI);
      gpuEmxEnsureCapacity_real_T(Gamma, &gpu_Gamma);
      validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(m + 1LL),
                                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(gpu_m, &m, 4ULL, cudaMemcpyHostToDevice);
        idx_dirtyOnGpu = false;
        BaumWelch_kernel81<<<grid, block>>>(gpu_Xi, gpu_m, gpu_Gamma);
        Gamma_dirtyOnGpu = true;
      }
      for (k = 0; k <= vlen - 2; k++) {
        LDA = (k + 1) * (m + 1);
        validLaunchParams = mwGetLaunchParameters1D(
            static_cast<real_T>(m + 1LL), &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
          if (idx_dirtyOnGpu) {
            cudaMemcpy(gpu_m, &m, 4ULL, cudaMemcpyHostToDevice);
          }
          idx_dirtyOnGpu = false;
          BaumWelch_kernel82<<<grid, block>>>(gpu_Xi, gpu_LDA, gpu_m,
                                              gpu_Gamma);
          Gamma_dirtyOnGpu = true;
        }
      }
    }
    //  M (Maximization step) Re-estimate the HMM parameters to obtain the
    //  maximum likelihood of the calculated parameters
    kEnd = Gamma->size[1] - 1;
    b_vlen = Pi->size[0] * Pi->size[1];
    Pi->size[0] = 1;
    Pi->size[1] = Gamma->size[1];
    emxEnsureCapacity_real_T(Pi, b_vlen, &v_emlrtRTEI);
    if (!Pi_dirtyOnCpu) {
      gpuEmxEnsureCapacity_real_T(Pi, &gpu_Pi);
    }
    validLaunchParams = mwGetLaunchParameters1D(static_cast<real_T>(kEnd + 1LL),
                                                &grid, &block, 1024U, 65535U);
    if (validLaunchParams) {
      if (Pi_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Pi, Pi);
      }
      BaumWelch_kernel84<<<grid, block>>>(gpu_Gamma, kEnd, gpu_Pi);
      Pi_dirtyOnCpu = false;
      Pi_dirtyOnGpu = true;
    }
    if (static_cast<int32_T>(N) - 1 >= 0) {
      b_i = Xi->size[2] - 1;
    }
    for (i = 0; i < i13; i++) {
      kEnd = a->size[0] * a->size[1] * a->size[2];
      a->size[0] = 999;
      a->size[1] = 1;
      a->size[2] = b_i + 1;
      emxEnsureCapacity_real_T(a, kEnd, &w_emlrtRTEI);
      gpuEmxEnsureCapacity_real_T(a, &gpu_a);
      LDA = Xi->size[1];
      validLaunchParams =
          mwGetLaunchParameters1D(static_cast<real_T>(999LL * (b_i + 1LL)),
                                  &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        BaumWelch_kernel85<<<grid, block>>>(gpu_Xi, i, b_i, LDA, gpu_a);
      }
      m = 1;
      if (Xi->size[2] != 1) {
        m = Xi->size[2];
      }
      if (m == 0) {
        c_y->size[0] = 1;
        c_y->size[1] = 0;
      } else {
        LDA = m - 1;
        kEnd = c_y->size[0] * c_y->size[1];
        c_y->size[0] = 1;
        c_y->size[1] = m;
        emxEnsureCapacity_real_T(c_y, kEnd, &f_emlrtRTEI);
        gpuEmxEnsureCapacity_real_T(c_y, &f_gpu_y);
        validLaunchParams = mwGetLaunchParameters1D(
            static_cast<real_T>((m - 1) + 1LL), &grid, &block, 1024U, 65535U);
        if (validLaunchParams) {
          cudaMemcpy(gpu_LDA, &LDA, 4ULL, cudaMemcpyHostToDevice);
          BaumWelch_kernel86<<<grid, block>>>(gpu_a, gpu_LDA, f_gpu_y);
        }
      }
      if (Gamma_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(Gamma, &gpu_Gamma);
      }
      Gamma_dirtyOnGpu = false;
      b_muj = Gamma->data[999 * i];
      for (k = 0; k < 998; k++) {
        b_muj += Gamma->data[(k + 999 * i) + 1];
      }
      xpageoffset = c_y->size[1] - 1;
      k = trans->size[0];
      validLaunchParams = mwGetLaunchParameters1D(
          static_cast<real_T>(xpageoffset + 1LL), &grid, &block, 1024U, 65535U);
      if (validLaunchParams) {
        cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
        if (trans_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_real_T(&gpu_trans, trans);
        }
        BaumWelch_kernel87<<<grid, block>>>(f_gpu_y, i, xpageoffset, k, gpu_muj,
                                            gpu_trans);
        trans_dirtyOnCpu = false;
        trans_dirtyOnGpu = true;
      }
    }
    for (i = 0; i < i14; i++) {
      BaumWelch_kernel88<<<dim3(114U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
          gpu_Gamma, i, *gpu_X, *f_gpu_x);
      BaumWelch_kernel89<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*f_gpu_x,
                                                                  *gpu_y);
      if (Gamma_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_real_T(Gamma, &gpu_Gamma);
      }
      Gamma_dirtyOnGpu = false;
      b_muj = Gamma->data[999 * i];
      for (k = 0; k < 998; k++) {
        b_muj += Gamma->data[(k + 999 * i) + 1];
      }
      xpageoffset = Mu->size[0];
      cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      if (Mu_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Mu, Mu);
      }
      BaumWelch_kernel90<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(
          *gpu_y, i, xpageoffset, gpu_muj, gpu_Mu);
      Mu_dirtyOnCpu = false;
      Mu_dirtyOnGpu = true;
      xpageoffset = Mu->size[0];
      BaumWelch_kernel91<<<dim3(114U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
          gpu_Mu, i, *gpu_X, xpageoffset, *gpu_d);
      BaumWelch_kernel92<<<dim3(114U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
          gpu_Gamma, i, *gpu_d, *gpu_A);
      b_muj = 1.0;
      beta1 = 0.0;
      cublasDgemm(getCublasGlobalHandle(), CUBLAS_OP_N, CUBLAS_OP_N, 58, 58,
                  999, (double *)&b_muj, (double *)&(*gpu_A)[0], 58,
                  (double *)&(*gpu_d)[0], 999, (double *)&beta1,
                  (double *)&(*d_gpu_y)[0], 58);
      b_muj = Gamma->data[999 * i];
      for (k = 0; k < 998; k++) {
        b_muj += Gamma->data[(k + 999 * i) + 1];
      }
      cudaMemcpy(gpu_muj, &b_muj, 8ULL, cudaMemcpyHostToDevice);
      if (Cov_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(&gpu_Cov, Cov);
      }
      BaumWelch_kernel93<<<dim3(7U, 1U, 1U), dim3(512U, 1U, 1U)>>>(
          i, gpu_muj, *d_gpu_y, gpu_Cov);
      Cov_dirtyOnCpu = false;
      Cov_dirtyOnGpu = true;
    }
  }
  emxFree_real_T(&b_Xi);
  emxFree_real_T(&c_alpha);
  emxFree_real_T(&b_alpha);
  emxFree_real_T(&c_y);
  emxFree_real_T(&a);
  emxFree_real_T(&Gamma);
  emxFree_real_T(&d_x);
  emxFree_real_T(&Xi);
  emxFree_real_T(&c_x);
  emxFree_real_T(&beta);
  emxFree_real_T(&alpha);
  emxFree_int32_T(&iv1);
  emxFree_real_T(&B);
  *Time = coder::toc(expl_temp.tv_sec, expl_temp.tv_nsec);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  if (Mu_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(Mu, &gpu_Mu);
  }
  if (Cov_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(Cov, &gpu_Cov);
  }
  if (trans_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(trans, &gpu_trans);
  }
  if (Pi_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(Pi, &gpu_Pi);
  }
  cudaFree(*gpu_X);
  cudaFree(*gpu_idx);
  cudaFree(*gpu_idx1);
  gpuEmxFree_real_T(&gpu_Cov);
  cudaFree(*gpu_iwork);
  cudaFree(*gpu_x_data);
  cudaFree(*gpu_C);
  cudaFree(*gpu_x);
  cudaFree(gpu_muj);
  cudaFree(gpu_m);
  gpuEmxFree_real_T(&gpu_Pi);
  cudaFree(*gpu_dv_data);
  cudaFree(*gpu_y);
  gpuEmxFree_real_T(&gpu_Mu);
  gpuEmxFree_real_T(&gpu_trans);
  gpuEmxFree_real_T(&b_gpu_x);
  cudaFree(gpu_LDA);
  gpuEmxFree_real_T(&b_gpu_y);
  gpuEmxFree_real_T(&c_gpu_y);
  gpuEmxFree_real_T(&b_gpu_trans);
  gpuEmxFree_int32_T(&gpu_iv1);
  gpuEmxFree_real_T(&gpu_B);
  gpuEmxFree_real_T(&gpu_alpha);
  cudaFree(*gpu_scale);
  gpuEmxFree_real_T(&b_gpu_alpha);
  cudaFree(*gpu_X0);
  cudaFree(gpu_info_t);
  gpuEmxFree_real_T(&gpu_beta);
  gpuEmxFree_real_T(&c_gpu_x);
  gpuEmxFree_real_T(&c_gpu_alpha);
  gpuEmxFree_real_T(&gpu_Xi);
  gpuEmxFree_real_T(&d_gpu_x);
  gpuEmxFree_real_T(&gpu_Gamma);
  cudaFree(*e_gpu_x);
  cudaFree(*d_gpu_y);
  cudaFree(*e_gpu_y);
  gpuEmxFree_real_T(&b_gpu_Xi);
  cudaFree(*f_gpu_x);
  gpuEmxFree_real_T(&gpu_a);
  cudaFree(*gpu_d);
  cudaFree(*gpu_A);
  cudaFree(*gpu_T_data);
  gpuEmxFree_real_T(&f_gpu_y);
  cudaFree(*gpu_ipiv_t);
  cudaFree(*gpu_ipiv_data);
  cudaFree(*b_gpu_B);
  cudaFree(*gpu_jpvt_t_data);
  cudaFree(*gpu_xRinv_data);
  cudaFree(*gpu_y_data);
  cudaFree(*gpu_quadform);
  cudaFree(*gpu_Y_data);
}

// End of code generation (BaumWelch.cu)
