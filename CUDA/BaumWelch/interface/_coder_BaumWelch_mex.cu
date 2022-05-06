//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_BaumWelch_mex.cu
//
// Code generation for function '_coder_BaumWelch_mex'
//

// Include files
#include "_coder_BaumWelch_mex.h"
#include "BaumWelch_data.h"
#include "BaumWelch_initialize.h"
#include "BaumWelch_terminate.h"
#include "BaumWelch_types.h"
#include "_coder_BaumWelch_api.h"
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
  BaumWelchStackData *BaumWelchStackDataGlobal{nullptr};
  BaumWelchStackDataGlobal =
      static_cast<BaumWelchStackData *>(new BaumWelchStackData);
  mexAtExit(&BaumWelch_atexit);
  // Module initialization.
  BaumWelch_initialize();
  try {
    emlrtShouldCleanupOnError((emlrtCTX *)emlrtRootTLSGlobal, false);
    // Dispatch the entry-point.
    unsafe_BaumWelch_mexFunction(BaumWelchStackDataGlobal, nlhs, plhs, nrhs,
                                 prhs);
    // Module termination.
    BaumWelch_terminate();
  } catch (...) {
    emlrtCleanupOnException((emlrtCTX *)emlrtRootTLSGlobal);
    throw;
  }
  delete BaumWelchStackDataGlobal;
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, nullptr, 1,
                           (void *)&emlrtExceptionBridge,
                           (const char_T *)"windows-1252", true);
  return emlrtRootTLSGlobal;
}

void unsafe_BaumWelch_mexFunction(BaumWelchStackData *SD, int32_T nlhs,
                                  mxArray *plhs[5], int32_T nrhs,
                                  const mxArray *prhs[2])
{
  const mxArray *outputs[5];
  int32_T b_nlhs;
  // Check for proper number of arguments.
  if (nrhs != 2) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal, "EMLRT:runTime:WrongNumberOfInputs",
                        5, 12, 2, 4, 9, "BaumWelch");
  }
  if (nlhs > 5) {
    emlrtErrMsgIdAndTxt(emlrtRootTLSGlobal,
                        "EMLRT:runTime:TooManyOutputArguments", 3, 4, 9,
                        "BaumWelch");
  }
  // Call the function.
  BaumWelch_api(SD, prhs, nlhs, outputs);
  // Copy over outputs to the caller.
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }
  emlrtReturnArrays(b_nlhs, &plhs[0], &outputs[0]);
}

// End of code generation (_coder_BaumWelch_mex.cu)
