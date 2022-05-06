NumExperiments = 1;
HiddenStates = 4;

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
    [Total_F,Total_M,ObsF,ObsM,trainF,testF,trainM,testM]=load_total_data();
    Total{i} = Total_F;
    ObsStruct{i} = ObsF;
    trainStruct{i} = trainF;
    testStruct{i} = testF;
end

% Second function implementation
for i = 1:NumExperiments
    [Mu,Cov,Matrix,Pi]=GPU_BaumWelch(trainStruct{i},HiddenStates);
    MuStruct{i} = Mu;
    CovStruct{i} = Cov;
    MatrixStruct{i} = Matrix;
    PiStruct{i} = Pi;
end