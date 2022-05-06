NumExperiments = 1;
HiddenStates = 4;

% Create the cell structures to store all the values calculated in each of
% the experiments

% Structure for the first function implementation
Total = cell(1,NumExperiments);
ObsStruct = cell(1,NumExperiments);
trainStruct = cell(1,NumExperiments);
testStruct = cell(1,NumExperiments);
actStruct = cell(1,NumExperiments);

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


% First function implementation
for i=1:NumExperiments
    [Total_F,Total_M,ObsF,ObsM,trainF,testF,trainM,testM,actF,actM]=load_data();
    Total{i} = Total_M;
    ObsStruct{i} = ObsM;
    trainStruct{i} = trainM;
    testStruct{i} = testM;
    actStruct{i} = actM;
end

% Second function implementation
for i = 1:NumExperiments
    [Mu,Cov,Matrix,Pi,tEnd1]=BaumWelch(trainStruct{i},HiddenStates);
    MuStruct{i} = Mu;
    CovStruct{i} = Cov;
    MatrixStruct{i} = Matrix;
    PiStruct{i} = Pi;
    tEnd1Struct{i} = tEnd1;
end

% Third function implementation
for i = 1:NumExperiments
    [max_ind,delta,prb,tEnd2]=viterbi_alg(testStruct{i},MuStruct{i},CovStruct{i},PiStruct{i},MatrixStruct{i});
    max_indStruct{i} = max_ind;
    deltaStruct{i} = delta;
    prbStruct{i} = prb;
    tEnd2Struct{i} = tEnd2;
end

