//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// new_mvnpdf.h
//
// Code generation for function 'new_mvnpdf'
//

#pragma once

// Include files
#include "new_mvnpdf_types.h"
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
void new_mvnpdf(new_mvnpdfStackData *SD, const real_T X[580000],
                const real_T Mu[58], const real_T Sigma[3364], real_T y[10000]);

// End of code generation (new_mvnpdf.h)
