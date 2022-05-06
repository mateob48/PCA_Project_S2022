function [TimeBW TimeV Sequence] = Multi_Core_Experiment(Exp, Hidd)

% Set the number of experiments and hidden states that the model has for
% experimentation
NumExperiments = Exp;
HiddenStates = Hidd;

% Create the cell structures to store all the values calculated in each of
% the experiments

% Structure for the first function implementation
Total = cell(1,NumExperiments);
ObsStruct = cell(1,NumExperiments);
trainStruct = cell(1,NumExperiments);
testStruct = cell(1,NumExperiments);

% Structures for the training section
MuStruct = cell(1,NumExperiments);
CovStruct = cell(1,NumExperiments);
MatrixStruct = cell(1,NumExperiments);
PiStruct = cell(1,NumExperiments);

% Structures for the testing section
max_indStruct = cell(1,NumExperiments);
deltaStruct = cell(1,NumExperiments);
prbStruct = cell(1,NumExperiments);

% Timing structures
tStartStruct = cell(1,NumExperiments);
tEndStruct = cell(1,NumExperiments);
tStart1Struct = cell(1,NumExperiments);
tEnd1Struct = cell(1,NumExperiments);
tStart2Struct = cell(1,NumExperiments);
tEnd2Struct = cell(1,NumExperiments);

% Output Variables
TimeBW = cell(1,NumExperiments);
TimeV = cell(1,NumExperiments);
Sequence = cell(1,NumExperiments);

% First function implementation
for i=1:NumExperiments
    [Total_Obs,Obs,trainD,testD]=load_example_data();
    Total{i} = Total_Obs;
    ObsStruct{i} = Obs;
    trainStruct{i} = trainD;
    testStruct{i} = testD;
end

% Second function implementation
parfor i = 1:NumExperiments
    [Mu,Cov,Matrix,Pi,tEnd1]=ParBaumWelch(trainStruct{i},HiddenStates);
    MuStruct{i} = Mu;
    CovStruct{i} = Cov;
    MatrixStruct{i} = Matrix;
    PiStruct{i} = Pi;
    tEnd1Struct{i} = tEnd1;
end

% Third function implementation
parfor i = 1:NumExperiments
    [max_ind,delta,prb,tEnd2]=Parviterbi_alg(testStruct{i},MuStruct{i},CovStruct{i},PiStruct{i},MatrixStruct{i});
    max_indStruct{i} = max_ind;
    deltaStruct{i} = delta;
    prbStruct{i} = prb;
    tEnd2Struct{i} = tEnd2;
end

% Assignation
TimeBW = tEnd1Struct;
TimeV = tEnd2Struct;
Sequence = max_indStruct;
end