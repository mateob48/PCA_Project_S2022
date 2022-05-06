//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_expectation_api.cu
//
// Code generation for function '_coder_expectation_api'
//

// Include files
#include "_coder_expectation_api.h"
#include "expectation.h"
#include "expectation_data.h"
#include "expectation_emxutil.h"
#include "expectation_types.h"
#include "rt_nonfinite.h"

// Variable Definitions
static emlrtRTEInfo f_emlrtRTEI{
    1,                        // lineNo
    1,                        // colNo
    "_coder_expectation_api", // fName
    ""                        // pName
};

// Function Declarations
static real_T (*b_emlrt_marshallIn(const mxArray *trans,
                                   const char_T *identifier))[16];

static real_T (*b_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[16];

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u);

static real_T c_emlrt_marshallIn(const mxArray *T, const char_T *identifier);

static real_T c_emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId);

static real_T (*d_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[40000];

static real_T (*e_emlrt_marshallIn(const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[16];

static real_T (*emlrt_marshallIn(const mxArray *alpha,
                                 const char_T *identifier))[40000];

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[40000];

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);

static real_T f_emlrt_marshallIn(const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

// Function Definitions
static real_T (*b_emlrt_marshallIn(const mxArray *trans,
                                   const char_T *identifier))[16]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[16];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(emlrtAlias(trans), &thisId);
  emlrtDestroyArray(&trans);
  return y;
}

static real_T (*b_emlrt_marshallIn(const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[16]
{
  real_T(*y)[16];
  y = e_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u)
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

static real_T c_emlrt_marshallIn(const mxArray *T, const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = c_emlrt_marshallIn(emlrtAlias(T), &thisId);
  emlrtDestroyArray(&T);
  return y;
}

static real_T c_emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = f_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*d_emlrt_marshallIn(const mxArray *src,
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

static real_T (*e_emlrt_marshallIn(const mxArray *src,
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

static real_T (*emlrt_marshallIn(const mxArray *alpha,
                                 const char_T *identifier))[40000]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[40000];
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(emlrtAlias(alpha), &thisId);
  emlrtDestroyArray(&alpha);
  return y;
}

static real_T (*emlrt_marshallIn(const mxArray *u,
                                 const emlrtMsgIdentifier *parentId))[40000]
{
  real_T(*y)[40000];
  y = d_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
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

static real_T f_emlrt_marshallIn(const mxArray *src,
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

void expectation_api(const mxArray *const prhs[6], int32_T nlhs,
                     const mxArray *plhs[2])
{
  emxArray_real_T *Gamma;
  emxArray_real_T *Xi;
  real_T(*B)[40000];
  real_T(*alpha)[40000];
  real_T(*beta)[40000];
  real_T(*trans)[16];
  real_T N;
  real_T T;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&Xi, 3, &f_emlrtRTEI, true);
  emxInit_real_T(&Gamma, 2, &f_emlrtRTEI, true);
  // Marshall function inputs
  alpha = emlrt_marshallIn(emlrtAlias(prhs[0]), "alpha");
  trans = b_emlrt_marshallIn(emlrtAlias(prhs[1]), "trans");
  B = emlrt_marshallIn(emlrtAlias(prhs[2]), "B");
  beta = emlrt_marshallIn(emlrtAlias(prhs[3]), "beta");
  T = c_emlrt_marshallIn(emlrtAliasP(prhs[4]), "T");
  N = c_emlrt_marshallIn(emlrtAliasP(prhs[5]), "N");
  // Invoke the target function
  expectation(*alpha, *trans, *B, *beta, T, N, Xi, Gamma);
  // Marshall function outputs
  Xi->canFreeData = false;
  plhs[0] = emlrt_marshallOut(Xi);
  emxFree_real_T(&Xi);
  if (nlhs > 1) {
    Gamma->canFreeData = false;
    plhs[1] = b_emlrt_marshallOut(Gamma);
  }
  emxFree_real_T(&Gamma);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

// End of code generation (_coder_expectation_api.cu)
