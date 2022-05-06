//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_BaumWelch_info.cpp
//
// Code generation for function 'BaumWelch'
//

// Include files
#include "_coder_BaumWelch_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

// Function Declarations
static const mxArray *emlrtMexFcnResolvedFunctionsInfo();

// Function Definitions
static const mxArray *emlrtMexFcnResolvedFunctionsInfo()
{
  const mxArray *nameCaptureInfo;
  const char_T *data[5]{
      "789cd555cb4ec240141d0c1a1f51d9e8da2f30c69090b830c15623869701d2106ba0b617"
      "28cc74b02fe00b5cfa2b7e8e0bf76eddb837f445db645212480d7773"
      "7b7266e69cb933bd8332a54a06217484dcf83970f3a187735ede42d188f399d8b84c7438"
      "da46d9c83c9f7ff7b24c3513a6a60b3489403053a144d524cd6ccec6",
      "80743028b64171989e8aa1a912688441758ec85d880ac09c9a7f730390470d8b207d602c"
      "1ce23008eaf1c1d86f76c97a9419f5c8c5f8a7db67ee4a6c19a01b22"
      "914ca0624d035e576d10792a5b0434d3102b0e51d7e91064f3ac5ee4448e2a20722dbe28"
      "de48161100cb837312f63f5ed1ff7e827f9fd760d221b636567a2ef6",
      "f5bb2beaef30f55d46a1d60b86f59d5785a917e5573eaf45c19c034baad7f192fee37931"
      "7ed7c97dfed3a1d2d243bfe83a553d2ffe4b6fca586fd9fb77c2d0cb"
      "c5f8a120158562757269b567c263bb75d150ef87211ff5049d241f8881d35a7fd3ffe355"
      "fbee5e827f9f970714cbd4eef8fbd9d4be9bda3b19142cfa4e7619fe",
      "d6d527e4b4fbeed7f75baa7a5e6c6adf3d65e8e5627c5979a88ff258c0e542a5865ff3fd"
      "e9a850e237bfeffe018062ce8d",
      ""};
  nameCaptureInfo = nullptr;
  emlrtNameCaptureMxArrayR2016a(&data[0], 3080U, &nameCaptureInfo);
  return nameCaptureInfo;
}

mxArray *emlrtMexFcnProperties()
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *epFieldName[6]{
      "Name",           "NumberOfInputs", "NumberOfOutputs",
      "ConstantInputs", "FullPath",       "TimeStamp"};
  const char_T *propFieldName[6]{"Version",      "ResolvedFunctions",
                                 "Checksum",     "EntryPoints",
                                 "CoverageInfo", "IsPolymorphic"};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 6, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 2);
  emlrtSetField(xEntryPoints, 0, (const char_T *)"Name",
                emlrtMxCreateString((const char_T *)"BaumWelch"));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"NumberOfInputs",
                emlrtMxCreateDoubleScalar(2.0));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"NumberOfOutputs",
                emlrtMxCreateDoubleScalar(5.0));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, (const char_T *)"FullPath",
      emlrtMxCreateString(
          (const char_T
               *)"C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
                 "PAC\\Code\\CUDA\\BaumWelch.m"));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"TimeStamp",
                emlrtMxCreateDoubleScalar(738613.92225694447));
  xResult =
      emlrtCreateStructMatrix(1, 1, 6, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, (const char_T *)"Version",
                emlrtMxCreateString((const char_T *)"9.12.0.1884302 (R2022a)"));
  emlrtSetField(xResult, 0, (const char_T *)"ResolvedFunctions",
                (mxArray *)emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, (const char_T *)"Checksum",
                emlrtMxCreateString((const char_T *)"d735UWpZhJBCDUmiJWTVCG"));
  emlrtSetField(xResult, 0, (const char_T *)"EntryPoints", xEntryPoints);
  return xResult;
}

// End of code generation (_coder_BaumWelch_info.cpp)
