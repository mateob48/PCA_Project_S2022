% Set the number of experiments and hidden states that the model has for
% experimentation
NumTrain = 5;
HiddenStates = 4;

% Create the cell structures to store all the values calculated in each of
% the experiments

% Structure for the first function implementation
Total = cell(1,NumTrain);
ObsStruct = cell(1,NumTrain);
trainStruct = cell(1,NumTrain);
testStruct = cell(1,NumTrain);

% Structures for the training section
MuStruct = cell(1,NumTrain);
CovStruct = cell(1,NumTrain);
MatrixStruct = cell(1,NumTrain);
PiStruct = cell(1,NumTrain);

% Structures for the testing section
max_indStruct = cell(1,NumTrain);
deltaStruct = cell(1,NumTrain);
prbStruct = cell(1,NumTrain);


% First function implementation
for i=1:NumTrain
    [Total_Obs,Obs,trainD,testD]=load_example_data();
    Total{i} = Total_Obs;
    ObsStruct{i} = Obs;
    trainStruct{i} = trainD;
    testStruct{i} = testD;
end

% Second function implementation
for i = 1:NumTrain
    [Mu,Cov,Matrix,Pi,tEnd1]=BaumWelch(trainStruct{i},HiddenStates);
    MuStruct{i} = Mu;
    CovStruct{i} = Cov;
    MatrixStruct{i} = Matrix;
    PiStruct{i} = Pi;
end

% Third function implementation
for i = 1:NumTrain
    [max_ind,delta,prb,tEnd2]=viterbi_alg(testStruct{i},MuStruct{i},CovStruct{i},PiStruct{i},MatrixStruct{i});
    max_indStruct{i} = max_ind;
    deltaStruct{i} = delta;
    prbStruct{i} = prb;
end
