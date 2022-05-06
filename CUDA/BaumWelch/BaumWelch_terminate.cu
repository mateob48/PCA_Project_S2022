//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// BaumWelch_terminate.cu
//
// Code generation for function 'BaumWelch_terminate'
//

// Include files
#include "BaumWelch_terminate.h"
#include "BaumWelch_data.h"
#include "_coder_BaumWelch_mex.h"
#include "rt_nonfinite.h"
#include "MWCUBLASUtils.hpp"
#include "MWCUSOLVERUtils.hpp"

// Function Definitions
void BaumWelch_atexit()
{
  mexFunctionCreateRootTLS();
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
  cusolverDestroyWorkspace();
  cusolverEnsureDestruction();
}

void BaumWelch_terminate()
{
  cudaError_t errCode;
  errCode = cudaGetLastError();
  if (errCode != cudaSuccess) {
    emlrtThinCUDAError(static_cast<uint32_T>(errCode),
                       (char_T *)cudaGetErrorName(errCode),
                       (char_T *)cudaGetErrorString(errCode),
                       (char_T *)"SafeBuild", emlrtRootTLSGlobal);
  }
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  cublasEnsureDestruction();
}

// End of code generation (BaumWelch_terminate.cu)
