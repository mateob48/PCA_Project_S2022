//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_betaCalc_api.cu
//
// Code generation for function '_coder_betaCalc_api'
//

// Include files
#include "_coder_betaCalc_api.h"
#include "betaCalc.h"
#include "betaCalc_data.h"
#include "rt_nonfinite.h"

// Function Declarations
static real_T (*b_emlrt_marshallIn(const mxArray *scale1,
                                   const char_T *identifier))[10000];

static real_T (*b_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[10000];

static real_T (*c_emlrt_marshallIn(const mxArray *trans,
                                   const char_T *identifier))[16];

static real_T (*c_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[16];

static real_T d_emlrt_marshallIn(const mxArray *N, const char_T *identifier);

static real_T d_emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId);

static real_T (*e_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[40000];

static real_T (*emlrt_marshallIn(const mxArray *beta1,
                                 const char_T *identifier))[40000];

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[40000];

static const mxArray *emlrt_marshallOut(const real_T u[40000]);

static real_T (*f_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[10000];

static real_T (*g_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[16];

static real_T h_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

// Function Definitions
static real_T (*b_emlrt_marshallIn(const mxArray *scale1,
                                   const char_T *identifier))[10000]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[10000];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(emlrtAlias(scale1), &thisId);
  emlrtDestroyArray(&scale1);
  return y;
}

static real_T (*b_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[10000]
{
  real_T(*y)[10000];
  y = f_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*c_emlrt_marshallIn(const mxArray *trans,
                                   const char_T *identifier))[16]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[16];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = c_emlrt_marshallIn(emlrtAlias(trans), &thisId);
  emlrtDestroyArray(&trans);
  return y;
}

static real_T (*c_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[16]
{
  real_T(*y)[16];
  y = g_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T d_emlrt_marshallIn(const mxArray *N, const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(emlrtAlias(N), &thisId);
  emlrtDestroyArray(&N);
  return y;
}

static real_T d_emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = h_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*e_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[40000]
{
  static const int32_T dims[2]{10000, 4};
  real_T(*ret)[40000];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 2U,
                          (void *)&dims[0]);
  ret = (real_T(*)[40000])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*emlrt_marshallIn(const mxArray *beta1,
                                 const char_T *identifier))[40000]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[40000];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(emlrtAlias(beta1), &thisId);
  emlrtDestroyArray(&beta1);
  return y;
}

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[40000]
{
  real_T(*y)[40000];
  y = e_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u[40000])
{
  static const int32_T iv[2]{0, 0};
  static const int32_T iv1[2]{10000, 4};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, &iv1[0], 2);
  emlrtAssign(&y, m);
  return y;
}

static real_T (*f_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[10000]
{
  static const int32_T dims[2]{1, 10000};
  real_T(*ret)[10000];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 2U,
                          (void *)&dims[0]);
  ret = (real_T(*)[10000])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*g_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[16]
{
  static const int32_T dims[2]{4, 4};
  real_T(*ret)[16];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 2U,
                          (void *)&dims[0]);
  ret = (real_T(*)[16])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T h_emlrt_marshallIn(const mxArray *src,
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

void betaCalc_api(const mxArray *const prhs[5], const mxArray *plhs[1])
{
  const mxArray *prhs_copy_idx_0;
  real_T(*B)[40000];
  real_T(*beta)[40000];
  real_T(*beta1)[40000];
  real_T(*scale1)[10000];
  real_T(*trans)[16];
  real_T N;
  beta = (real_T(*)[40000])mxMalloc(sizeof(real_T[40000]));
  prhs_copy_idx_0 = emlrtProtectR2012b(prhs[0], 0, false, -1);
  // Marshall function inputs
  beta1 = emlrt_marshallIn(emlrtAlias(prhs_copy_idx_0), "beta1");
  scale1 = b_emlrt_marshallIn(emlrtAlias(prhs[1]), "scale1");
  trans = c_emlrt_marshallIn(emlrtAlias(prhs[2]), "trans");
  B = emlrt_marshallIn(emlrtAlias(prhs[3]), "B");
  N = d_emlrt_marshallIn(emlrtAliasP(prhs[4]), "N");
  // Invoke the target function
  betaCalc(*beta1, *scale1, *trans, *B, N, *beta);
  // Marshall function outputs
  plhs[0] = emlrt_marshallOut(*beta);
}

// End of code generation (_coder_betaCalc_api.cu)
