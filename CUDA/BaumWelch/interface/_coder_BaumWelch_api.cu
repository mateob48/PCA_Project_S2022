//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_BaumWelch_api.cu
//
// Code generation for function '_coder_BaumWelch_api'
//

// Include files
#include "_coder_BaumWelch_api.h"
#include "BaumWelch.h"
#include "BaumWelch_data.h"
#include "BaumWelch_emxutil.h"
#include "BaumWelch_types.h"
#include "rt_nonfinite.h"

// Variable Definitions
static emlrtRTEInfo bb_emlrtRTEI{
    1,                      // lineNo
    1,                      // colNo
    "_coder_BaumWelch_api", // fName
    ""                      // pName
};

// Function Declarations
static real_T b_emlrt_marshallIn(const mxArray *N, const char_T *identifier);

static real_T b_emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId);

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u);

static real_T (*c_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[58000];

static real_T d_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static real_T (*emlrt_marshallIn(const mxArray *X,
                                 const char_T *identifier))[58000];

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[58000];

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);

static const mxArray *emlrt_marshallOut(const real_T u);

// Function Definitions
static real_T b_emlrt_marshallIn(const mxArray *N, const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(emlrtAlias(N), &thisId);
  emlrtDestroyArray(&N);
  return y;
}

static real_T b_emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = d_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u)
{
  static const int32_T iv[3]{0, 0, 0};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(3, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, &u->size[0], 3);
  emlrtAssign(&y, m);
  return y;
}

static real_T (*c_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[58000]
{
  static const int32_T dims[2]{1000, 58};
  real_T(*ret)[58000];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 2U,
                          (void *)&dims[0]);
  ret = (real_T(*)[58000])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T d_emlrt_marshallIn(const mxArray *src,
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

static real_T (*emlrt_marshallIn(const mxArray *X,
                                 const char_T *identifier))[58000]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[58000];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(emlrtAlias(X), &thisId);
  emlrtDestroyArray(&X);
  return y;
}

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[58000]
{
  real_T(*y)[58000];
  y = c_emlrt_marshallIn(emlrtAlias(u), parentId);
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

static const mxArray *emlrt_marshallOut(const real_T u)
{
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateDoubleScalar(u);
  emlrtAssign(&y, m);
  return y;
}

void BaumWelch_api(BaumWelchStackData *SD, const mxArray *const prhs[2],
                   int32_T nlhs, const mxArray *plhs[5])
{
  emxArray_real_T *Cov;
  emxArray_real_T *Mu;
  emxArray_real_T *Pi;
  emxArray_real_T *trans;
  real_T(*X)[58000];
  real_T N;
  real_T Time;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&Mu, 2, &bb_emlrtRTEI, true);
  emxInit_real_T(&Cov, 3, &bb_emlrtRTEI, true);
  emxInit_real_T(&trans, 2, &bb_emlrtRTEI, true);
  emxInit_real_T(&Pi, 2, &bb_emlrtRTEI, true);
  // Marshall function inputs
  X = emlrt_marshallIn(emlrtAlias(prhs[0]), "X");
  N = b_emlrt_marshallIn(emlrtAliasP(prhs[1]), "N");
  // Invoke the target function
  BaumWelch(SD, *X, N, Mu, Cov, trans, Pi, &Time);
  // Marshall function outputs
  Mu->canFreeData = false;
  plhs[0] = emlrt_marshallOut(Mu);
  emxFree_real_T(&Mu);
  if (nlhs > 1) {
    Cov->canFreeData = false;
    plhs[1] = b_emlrt_marshallOut(Cov);
  }
  emxFree_real_T(&Cov);
  if (nlhs > 2) {
    trans->canFreeData = false;
    plhs[2] = emlrt_marshallOut(trans);
  }
  emxFree_real_T(&trans);
  if (nlhs > 3) {
    Pi->canFreeData = false;
    plhs[3] = emlrt_marshallOut(Pi);
  }
  emxFree_real_T(&Pi);
  if (nlhs > 4) {
    plhs[4] = emlrt_marshallOut(Time);
  }
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

// End of code generation (_coder_BaumWelch_api.cu)
