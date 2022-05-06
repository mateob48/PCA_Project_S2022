//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// betaCalc.h
//
// Code generation for function 'betaCalc'
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

// Function Declarations
void betaCalc(real_T beta1[40000], const real_T scale1[10000],
              const real_T trans[16], const real_T B[40000], real_T N,
              real_T beta[40000]);

// End of code generation (betaCalc.h)
