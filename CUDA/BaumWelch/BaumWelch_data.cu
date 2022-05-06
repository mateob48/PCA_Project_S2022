//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// BaumWelch_data.cu
//
// Code generation for function 'BaumWelch_data'
//

// Include files
#include "BaumWelch_data.h"
#include "rt_nonfinite.h"

// Variable Definitions
emlrtCTX emlrtRootTLSGlobal{nullptr};

emlrtContext emlrtContextGlobal{
    true,                                               // bFirstTime
    false,                                              // bInitialized
    131626U,                                            // fVersionInfo
    nullptr,                                            // fErrorFunction
    "BaumWelch",                                        // fFunctionName
    nullptr,                                            // fRTCallStack
    false,                                              // bDebugMode
    {3130694236U, 2616137409U, 972914731U, 129233577U}, // fSigWrd
    nullptr                                             // fSigMem
};

emlrtRTEInfo i_emlrtRTEI{
    52,    // lineNo
    9,     // colNo
    "div", // fName
    "C:\\Program "
    "Files\\MATLAB\\R2022a\\toolbox\\eml\\eml\\+coder\\+internal\\div.m" // pName
};

emlrtRTEInfo j_emlrtRTEI{
    50,          // lineNo
    1,           // colNo
    "BaumWelch", // fName
    "C:\\Users\\mateo\\OneDrive\\Documents\\Mateo\\Project "
    "PAC\\Code\\CUDA\\BaumWelch.m" // pName
};

// End of code generation (BaumWelch_data.cu)
