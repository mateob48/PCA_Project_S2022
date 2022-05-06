//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// new_mvnpdf_types.h
//
// Code generation for function 'new_mvnpdf'
//

#pragma once

// Include files
#include "rtwtypes.h"
#include "emlrt.h"

// Custom Header Code

#ifdef __CUDA_ARCH__
#undef printf
#endif

// Type Definitions
struct b_new_mvnpdf {
  real_T X0[580000];
};

struct new_mvnpdfStackData {
  b_new_mvnpdf f0;
};

// End of code generation (new_mvnpdf_types.h)
