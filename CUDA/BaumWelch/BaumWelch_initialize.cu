//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// BaumWelch_initialize.cu
//
// Code generation for function 'BaumWelch_initialize'
//

// Include files
#include "BaumWelch_initialize.h"
#include "BaumWelch_data.h"
#include "_coder_BaumWelch_mex.h"
#include "rt_nonfinite.h"
#include "MWCUBLASUtils.hpp"
#include "MWCUSOLVERUtils.hpp"

// Function Definitions
void BaumWelch_initialize()
{
  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, nullptr);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLicenseCheckR2022a(
      emlrtRootTLSGlobal,
      (const char_T *)"EMLRT:runTime:MexFunctionNeedsLicense",
      (const char_T *)"distrib_computing_toolbox", 2);
  cublasEnsureInitialization(CUBLAS_POINTER_MODE_HOST);
  cusolverEnsureInitialization();
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
  emlrtInitGPU(emlrtRootTLSGlobal);
  cudaGetLastError();
}

// End of code generation (BaumWelch_initialize.cu)
