//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// _coder_new_mvnpdf_info.cpp
//
// Code generation for function 'new_mvnpdf'
//

// Include files
#include "_coder_new_mvnpdf_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

// Function Declarations
static const mxArray *emlrtMexFcnResolvedFunctionsInfo();

// Function Definitions
static const mxArray *emlrtMexFcnResolvedFunctionsInfo()
{
  const mxArray *nameCaptureInfo;
  const char_T *data[4]{
      "789cc593cd4ec2401485a706892e5056ae7d02572424ee48ab09864a13202e1c83757a91"
      "cafc603bd4fa042e7d151fc7857b5fc3f497966452922adecdedc997"
      "9973e6ce14697d5343081da1a4c266d25ba96ea77d0f956b936b8a9ed53e6a94d665fc3d"
      "ed447009a14c04b719e42b1dc15c6e73397e5d02f2c0173400272633",
      "97c2d865302a8aeb48b1cb02ca4584a26f7d0e64315a31e4cdfd75425a14f93c3e14e76d"
      "6c390f53318ff606bfbdb8d3cff1c407cfc7cc9620f09083e1b90160"
      "439015032e7d6cc6c0f2c41310796af574ac0b07b03e317a98c3cb94057ce9ccce5821ff"
      "b266fec38afc192773418908a6d97932fffb9afe4da57f421cb17aa0",
      "f07bf73550fa9579edfbca07165f57e5bc8eb7ccaffaff5ae820eec4f8d476e987bebedf"
      "76ea97d67ff9858afdb67d7f270abff6061f3857d6a2436fe8a06b0e"
      "e973e7315c74fbc63a8755e153950329f45fefff0363a77a24",
      ""};
  nameCaptureInfo = nullptr;
  emlrtNameCaptureMxArrayR2016a(&data[0], 1680U, &nameCaptureInfo);
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
  xInputs = emlrtCreateLogicalMatrix(1, 3);
  emlrtSetField(xEntryPoints, 0, (const char_T *)"Name",
                emlrtMxCreateString((const char_T *)"new_mvnpdf"));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"NumberOfInputs",
                emlrtMxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"NumberOfOutputs",
                emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"ConstantInputs", xInputs);
  emlrtSetField(
      xEntryPoints, 0, (const char_T *)"FullPath",
      emlrtMxCreateString(
          (const char_T
               *)"C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
                 "PAC\\Code\\CUDA\\new_mvnpdf.m"));
  emlrtSetField(xEntryPoints, 0, (const char_T *)"TimeStamp",
                emlrtMxCreateDoubleScalar(738610.61946759257));
  xResult =
      emlrtCreateStructMatrix(1, 1, 6, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, (const char_T *)"Version",
                emlrtMxCreateString((const char_T *)"9.12.0.1884302 (R2022a)"));
  emlrtSetField(xResult, 0, (const char_T *)"ResolvedFunctions",
                (mxArray *)emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, (const char_T *)"Checksum",
                emlrtMxCreateString((const char_T *)"I0LuEf7uT7rdYFbxgkqK6D"));
  emlrtSetField(xResult, 0, (const char_T *)"EntryPoints", xEntryPoints);
  return xResult;
}

// End of code generation (_coder_new_mvnpdf_info.cpp)
