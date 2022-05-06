//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_new_mvnpdf_mex.cu
//
// Code generation for function '_coder_new_mvnpdf_mex'
//

// Include files
#include "_coder_new_mvnpdf_mex.h"
#include "_coder_new_mvnpdf_api.h"
#include "new_mvnpdf_data.h"
#include "new_mvnpdf_initialize.h"
#include "new_mvnpdf_terminate.h"
#include "new_mvnpdf_types.h"
#include "rt_nonfinite.h"
#include <stdexcept>

void emlrtExceptionBridge();
void emlrtExceptionBridge()
{
  throw std::runtime_error("");
}
// Function Definitions
void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  new_mvnpdfStackData *new_mvnpdfStackDataGlobal{nullptr};
  new_mvnpdfStackDataGlobal =
      static_cast<new_mvnpdfStackData *>(new new_mvnpdfStackData);
  mexAtExit(&new_mvnpdf_atexit);
  // Module initialization.
  new_mvnpdf_initialize();
  try {
    emlrtShouldCleanupOnError((emlrtCTX *)emlrtRootTLSGlobal, false);
    // Dispatch the entry-point.
    unsafe_new_mvnpdf_mexFunction(new_mvnpdfStackDataGlobal, nlhs, plhs, nrhs,
                                  prhs);
    // Module termination.
    new_mvnpdf_terminate();
  } catch (...) {
    emlrtCleanupOnException((emlrtCTX *)emlrtRootTLSGlobal);
    throw;
  }
  delete new_mvnpdfStackDataGlobal;
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           (void *)&emlrtExceptionBridge,
                           (const char_T *)"windows-1252", true);
  return emlrtRootTLSGlobal;
}

void unsafe_new_mvnpdf_mexFunction(new_mvnpdfStackData *SD, int32_T nlhs,
                                   mxArray *plhs[1], int32_T nrhs,
                                   const mxArray *prhs[3])
{
  const mxArray *outputs[1];
  // Check for proper number of arguments.
  if (nrhs != 3) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 3, 4, 10, "new_mvnpdf");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 10,
                        "new_mvnpdf");
  }
  // Call the function.
  new_mvnpdf_api(SD, prhs, outputs);
  // Copy over outputs to the caller.
  emlrtReturnArrays(1, &plhs[0], &outputs[0]);
}

// End of code generation (_coder_new_mvnpdf_mex.cu)
