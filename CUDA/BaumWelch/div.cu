//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// div.cu
//
// Code generation for function 'div'
//

// Include files
#include "div.h"
#include "BaumWelch_data.h"
#include "BaumWelch_emxutil.h"
#include "BaumWelch_types.h"
#include "rt_nonfinite.h"

// Function Definitions
void binary_expand_op(emxArray_real_T *in1, const emxArray_real_T *in2)
{
  emxArray_real_T *b_in1;
  int32_T i;
  int32_T in2_idx_0;
  int32_T stride_0_0;
  int32_T stride_1_0;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&b_in1, 2, &i_emlrtRTEI, true);
  in2_idx_0 = in2->size[0];
  i = b_in1->size[0] * b_in1->size[1];
  if (in2_idx_0 == 1) {
    b_in1->size[0] = in1->size[0];
  } else {
    b_in1->size[0] = in2_idx_0;
  }
  b_in1->size[1] = in1->size[1];
  emxEnsureCapacity_real_T(b_in1, i, &i_emlrtRTEI);
  stride_0_0 = (in1->size[0] != 1);
  stride_1_0 = (in2_idx_0 != 1);
  for (i = 0; i < in1->size[1]; i++) {
    int32_T b_in2_idx_0;
    if (in2_idx_0 == 1) {
      b_in2_idx_0 = in1->size[0];
    } else {
      b_in2_idx_0 = in2_idx_0;
    }
    for (int32_T i1{0}; i1 < b_in2_idx_0; i1++) {
      b_in1->data[i1 + b_in1->size[0] * i] =
          in1->data[i1 * stride_0_0 + in1->size[0] * i] /
          in2->data[i1 * stride_1_0];
    }
  }
  i = in1->size[0] * in1->size[1];
  in1->size[0] = b_in1->size[0];
  in1->size[1] = b_in1->size[1];
  emxEnsureCapacity_real_T(in1, i, &j_emlrtRTEI);
  for (i = 0; i < b_in1->size[1]; i++) {
    for (int32_T i1{0}; i1 < b_in1->size[0]; i1++) {
      in1->data[i1 + in1->size[0] * i] = b_in1->data[i1 + b_in1->size[0] * i];
    }
  }
  emxFree_real_T(&b_in1);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

// End of code generation (div.cu)
