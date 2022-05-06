//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_BaumWelch_api.h
//
// Code generation for function '_coder_BaumWelch_api'
//

#pragma once

// Include files
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

// Type Declarations
struct BaumWelchStackData;

// Function Declarations
void BaumWelch_api(BaumWelchStackData *SD, const mxArray *const prhs[2],
                   int32_T nlhs, const mxArray *plhs[5]);

// End of code generation (_coder_BaumWelch_api.h)
