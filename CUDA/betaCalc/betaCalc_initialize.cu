//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// betaCalc_initialize.cu
//
// Code generation for function 'betaCalc_initialize'
//

// Include files
#include "betaCalc_initialize.h"
#include "_coder_betaCalc_mex.h"
#include "betaCalc_data.h"
#include "rt_nonfinite.h"

// Function Definitions
void betaCalc_initialize()
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

// End of code generation (betaCalc_initialize.cu)
