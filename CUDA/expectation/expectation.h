//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// expectation.h
//
// Code generation for function 'expectation'
//

#pragma once

// Include files
#include "expectation_types.h"
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
void expectation(const real_T alpha[40000], const real_T trans[16],
                 const real_T B[40000], const real_T beta[40000], real_T T,
                 real_T N, emxArray_real_T *Xi, emxArray_real_T *Gamma);

// End of code generation (expectation.h)
