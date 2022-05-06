//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// alphaCalc_initialize.cu
//
// Code generation for function 'alphaCalc_initialize'
//

// Include files
#include "alphaCalc_initialize.h"
#include "_coder_alphaCalc_mex.h"
#include "alphaCalc_data.h"
#include "rt_nonfinite.h"

// Function Definitions
void alphaCalc_initialize()
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

// End of code generation (alphaCalc_initialize.cu)
