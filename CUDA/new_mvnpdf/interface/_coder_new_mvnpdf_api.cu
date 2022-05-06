//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_new_mvnpdf_api.cu
//
// Code generation for function '_coder_new_mvnpdf_api'
//

// Include files
#include "_coder_new_mvnpdf_api.h"
#include "new_mvnpdf.h"
#include "new_mvnpdf_data.h"
#include "new_mvnpdf_types.h"
#include "rt_nonfinite.h"

// Function Declarations
static real_T (*b_emlrt_marshallIn(const mxArray *Mu,
                                   const char_T *identifier))[58];

static real_T (*b_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[58];

static real_T (*c_emlrt_marshallIn(const mxArray *Sigma,
                                   const char_T *identifier))[3364];

static real_T (*c_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[3364];

static real_T (*d_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[580000];

static real_T (*e_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[58];

static real_T (*emlrt_marshallIn(const mxArray *X,
                                 const char_T *identifier))[580000];

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[580000];

static const mxArray *emlrt_marshallOut(const real_T u[10000]);

static real_T (*f_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[3364];

// Function Definitions
static real_T (*b_emlrt_marshallIn(const mxArray *Mu,
                                   const char_T *identifier))[58]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[58];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(emlrtAlias(Mu), &thisId);
  emlrtDestroyArray(&Mu);
  return y;
}

static real_T (*b_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[58]
{
  real_T(*y)[58];
  y = e_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*c_emlrt_marshallIn(const mxArray *Sigma,
                                   const char_T *identifier))[3364]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[3364];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = c_emlrt_marshallIn(emlrtAlias(Sigma), &thisId);
  emlrtDestroyArray(&Sigma);
  return y;
}

static real_T (*c_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[3364]
{
  real_T(*y)[3364];
  y = f_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*d_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[580000]
{
  static const int32_T dims[2]{10000, 58};
  real_T(*ret)[580000];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 2U,
                          (void *)&dims[0]);
  ret = (real_T(*)[580000])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*e_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[58]
{
  static const int32_T dims[2]{1, 58};
  real_T(*ret)[58];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 2U,
                          (void *)&dims[0]);
  ret = (real_T(*)[58])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*emlrt_marshallIn(const mxArray *X,
                                 const char_T *identifier))[580000]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[580000];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(emlrtAlias(X), &thisId);
  emlrtDestroyArray(&X);
  return y;
}

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[580000]
{
  real_T(*y)[580000];
  y = d_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u[10000])
{
  static const int32_T iv[1]{0};
  static const int32_T iv1[1]{10000};
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateNumericArray(1, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, &iv1[0], 1);
  emlrtAssign(&y, m);
  return y;
}

static real_T (*f_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[3364]
{
  static const int32_T dims[2]{58, 58};
  real_T(*ret)[3364];
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src,
                          (const char_T *)"double", false, 2U,
                          (void *)&dims[0]);
  ret = (real_T(*)[3364])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

void new_mvnpdf_api(new_mvnpdfStackData *SD, const mxArray *const prhs[3],
                    const mxArray *plhs[1])
{
  real_T(*X)[580000];
  real_T(*y)[10000];
  real_T(*Sigma)[3364];
  real_T(*Mu)[58];
  y = (real_T(*)[10000])mxMalloc(sizeof(real_T[10000]));
  // Marshall function inputs
  X = emlrt_marshallIn(emlrtAlias(prhs[0]), "X");
  Mu = b_emlrt_marshallIn(emlrtAlias(prhs[1]), "Mu");
  Sigma = c_emlrt_marshallIn(emlrtAlias(prhs[2]), "Sigma");
  // Invoke the target function
  new_mvnpdf(SD, *X, *Mu, *Sigma, *y);
  // Marshall function outputs
  plhs[0] = emlrt_marshallOut(*y);
}

// End of code generation (_coder_new_mvnpdf_api.cu)
