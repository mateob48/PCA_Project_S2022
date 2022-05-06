//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// alphaCalc.h
//
// Code generation for function 'alphaCalc'
//

#pragma once

// Include files
#include "alphaCalc_types.h"
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
void alphaCalc(emxArray_real_T *alpha1, emxArray_real_T *scale1,
               const emxArray_real_T *trans, const emxArray_real_T *B, real_T N,
               real_T T, emxArray_real_T *alpha, emxArray_real_T *scale);

// End of code generation (alphaCalc.h)
