//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// expectation_initialize.cu
//
// Code generation for function 'expectation_initialize'
//

// Include files
#include "expectation_initialize.h"
#include "_coder_expectation_mex.h"
#include "expectation_data.h"
#include "rt_nonfinite.h"

// Function Definitions
void expectation_initialize()
{
  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, nullptr);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLicenseCheckR2022a(
      emlrtRootTLSGlobal,
      (const char_T *)"EMLRT:runTime:MexFunctionNeedsLicense",
      (const char_T *)"distrib_computing_toolbox", 2);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
  emlrtInitGPU(emlrtRootTLSGlobal);
  cudaGetLastError();
}

// End of code generation (expectation_initialize.cu)
