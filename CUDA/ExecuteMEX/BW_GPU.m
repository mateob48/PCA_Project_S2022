NumExperiments = 2;
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

% First function implementation
for i=1:NumExperiments
    [Total_Obs,Obs,trainD,testD]=load_example_data();
    Total{i} = Total_Obs;
    ObsStruct{i} = Obs;
    trainStruct{i} = trainD;
    testStruct{i} = testD;
end
train2 = cell(1,NumExperiments); 
for i = 1:NumExperiments
    train3 = trainStruct{i};
    train3 = train3(1:1000,:);
    train2{i} = train3;
end

% Second function implementation
parfor i = 1:NumExperiments
    [Mu,Cov,Matrix,Pi,tEnd1]=BaumWelch_mex(train2{i},HiddenStates);
    MuStruct{i} = Mu;
    CovStruct{i} = Cov;
    MatrixStruct{i} = Matrix;
    PiStruct{i} = Pi;
    tEnd1Struct{i} = tEnd1;
end

