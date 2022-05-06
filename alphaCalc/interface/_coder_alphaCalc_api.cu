//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_alphaCalc_api.cu
//
// Code generation for function '_coder_alphaCalc_api'
//

// Include files
#include "_coder_alphaCalc_api.h"
#include "alphaCalc.h"
#include "alphaCalc_data.h"
#include "alphaCalc_emxutil.h"
#include "alphaCalc_types.h"
#include "rt_nonfinite.h"

// Variable Definitions
static emlrtRTEInfo f_emlrtRTEI{
    1,                      // lineNo
    1,                      // colNo
    "_coder_alphaCalc_api", // fName
    ""                      // pName
};

// Function Declarations
static void b_emlrt_marshallIn(const mxArray *scale1, const char_T *identifier,
                               emxArray_real_T *y);

static void b_emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static real_T b_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static void c_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static void d_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static void emlrt_marshallIn(const mxArray *alpha1, const char_T *identifier,
                             emxArray_real_T *y);

static void emlrt_marshallIn(const mxArray *u,
                             const emlrtMsgIdentifier *parentId,
                             emxArray_real_T *y);

static real_T emlrt_marshallIn(const mxArray *N, const char_T *identifier);

static real_T emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId);

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);

// Function Definitions
static void b_emlrt_marshallIn(const mxArray *scale1, const char_T *identifier,
                               emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(emlrtAlias(scale1), &thisId, y);
  emlrtDestroyArray(&scale1);
}

static void b_emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  d_emlrt_marshallIn(emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T b_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims{0};
  real_T ret;
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 0U, (void *)&dims);
  ret = *static_cast<real_T *>(emlrtMxGetData(src));
  emlrtDestroyArray(&src);
  return ret;
}

static void c_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims[2]{-1, -1};
  int32_T iv[2];
  int32_T i;
  const boolean_T bv[2]{true, true};
  emlrtCheckVsBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                            (const char_T *)"double", false, 2U,
                            (void *)&dims[0], &bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real_T(ret, i, static_cast<emlrtRTEInfo *>(nullptr));
  ret->data = static_cast<real_T *>(emlrtMxGetData(src));
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void d_emlrt_marshallIn(const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims[2]{1, -1};
  int32_T iv[2];
  int32_T i;
  const boolean_T bv[2]{false, true};
  emlrtCheckVsBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                            (const char_T *)"double", false, 2U,
                            (void *)&dims[0], &bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real_T(ret, i, static_cast<emlrtRTEInfo *>(nullptr));
  ret->data = static_cast<real_T *>(emlrtMxGetData(src));
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void emlrt_marshallIn(const mxArray *alpha1, const char_T *identifier,
                             emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  emlrt_marshallIn(emlrtAlias(alpha1), &thisId, y);
  emlrtDestroyArray(&alpha1);
}

static void emlrt_marshallIn(const mxArray *u,
                             const emlrtMsgIdentifier *parentId,
                             emxArray_real_T *y)
{
  c_emlrt_marshallIn(emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T emlrt_marshallIn(const mxArray *N, const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(emlrtAlias(N), &thisId);
  emlrtDestroyArray(&N);
  return y;
}

static real_T emlrt_marshallIn(const mxArray *u,
                               const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = b_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
{
  static const int32_T iv[2]{0, 0};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, &u->size[0], 2);
  emlrtAssign(&y, m);
  return y;
}

void alphaCalc_api(const mxArray *const prhs[6], int32_T nlhs,
                   const mxArray *plhs[2])
{
  emxArray_real_T *B;
  emxArray_real_T *alpha;
  emxArray_real_T *alpha1;
  emxArray_real_T *scale;
  emxArray_real_T *scale1;
  emxArray_real_T *trans;
  const mxArray *prhs_copy_idx_0;
  const mxArray *prhs_copy_idx_1;
  real_T N;
  real_T T;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&alpha1, 2, &f_emlrtRTEI, true);
  emxInit_real_T(&scale1, 2, &f_emlrtRTEI, true);
  emxInit_real_T(&trans, 2, &f_emlrtRTEI, true);
  emxInit_real_T(&B, 2, &f_emlrtRTEI, true);
  emxInit_real_T(&alpha, 2, &f_emlrtRTEI, true);
  emxInit_real_T(&scale, 2, &f_emlrtRTEI, true);
  prhs_copy_idx_0 = emlrtProtectR2012b(prhs[0], 0, false, -1);
  prhs_copy_idx_1 = emlrtProtectR2012b(prhs[1], 1, false, -1);
  // Marshall function inputs
  alpha1->canFreeData = false;
  emlrt_marshallIn(emlrtAlias(prhs_copy_idx_0), "alpha1", alpha1);
  scale1->canFreeData = false;
  b_emlrt_marshallIn(emlrtAlias(prhs_copy_idx_1), "scale1", scale1);
  trans->canFreeData = false;
  emlrt_marshallIn(emlrtAlias(prhs[2]), "trans", trans);
  B->canFreeData = false;
  emlrt_marshallIn(emlrtAlias(prhs[3]), "B", B);
  N = emlrt_marshallIn(emlrtAliasP(prhs[4]), "N");
  T = emlrt_marshallIn(emlrtAliasP(prhs[5]), "T");
  // Invoke the target function
  alphaCalc(alpha1, scale1, trans, B, N, T, alpha, scale);
  // Marshall function outputs
  alpha->canFreeData = false;
  plhs[0] = emlrt_marshallOut(alpha);
  emxFree_real_T(&alpha);
  emxFree_real_T(&B);
  emxFree_real_T(&trans);
  emxFree_real_T(&scale1);
  emxFree_real_T(&alpha1);
  if (nlhs > 1) {
    scale->canFreeData = false;
    plhs[1] = emlrt_marshallOut(scale);
  }
  emxFree_real_T(&scale);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

// End of code generation (_coder_alphaCalc_api.cu)
