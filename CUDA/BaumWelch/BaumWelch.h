//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// BaumWelch.h
//
// Code generation for function 'BaumWelch'
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
void BaumWelch(BaumWelchStackData *SD, const real_T X[58000], real_T N,
               emxArray_real_T *Mu, emxArray_real_T *Cov,
               emxArray_real_T *trans, emxArray_real_T *Pi, real_T *Time);

// End of code generation (BaumWelch.h)
