//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// new_mvnpdf_terminate.cu
//
// Code generation for function 'new_mvnpdf_terminate'
//

// Include files
#include "new_mvnpdf_terminate.h"
#include "_coder_new_mvnpdf_mex.h"
#include "new_mvnpdf_data.h"
#include "rt_nonfinite.h"
#include "MWCUBLASUtils.hpp"
#include "MWCUSOLVERUtils.hpp"

// Function Definitions
void new_mvnpdf_atexit()
{
  mexFunctionCreateRootTLS();
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
  cusolverDestroyWorkspace();
  cusolverEnsureDestruction();
}

void new_mvnpdf_terminate()
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

// End of code generation (new_mvnpdf_terminate.cu)
