//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_BaumWelch_mex.h
//
// Code generation for function '_coder_BaumWelch_mex'
//

#pragma once

// Include files
#include "BaumWelch_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Function Declarations
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS();

void unsafe_BaumWelch_mexFunction(BaumWelchStackData *SD, int32_T nlhs,
                                  mxArray *plhs[5], int32_T nrhs,
                                  const mxArray *prhs[2]);

// End of code generation (_coder_BaumWelch_mex.h)
