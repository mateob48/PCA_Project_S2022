
NumTrain = 6;
HiddenStates = 4;

% Create the cell structures to store all the values calculated in each of
% the experiments

% Structure for the first function implementation
Total = cell(1,NumTrain);
ObsStruct = cell(1,NumTrain);
trainStruct = cell(1,NumTrain);
testStruct = cell(1,NumTrain);

% Structures for the training section
MuStruct = [];
CovStruct = [];
MatrixStruct = [];
PiStruct = [];

% Structures for the testing section
max_indStruct = cell(1,NumTrain);
deltaStruct = cell(1,NumTrain);
prbStruct = cell(1,NumTrain);

% Output Variables
TimeBW = cell(1,NumTrain);
TimeV = cell(1,NumTrain);
Sequence = cell(1,NumTrain);

% First function implementation
for i=1:NumTrain
    [Total_Obs,Obs,trainD,testD]=load_example_data();
    Total{i} = Total_Obs;
    ObsStruct{i} = Obs;
    trainStruct{i} = trainD;
    testStruct{i} = testD;
end


% With spmd block
[Mu,Cov,Matrix,Pi]=BaumWelch_GPU(trainStruct{1},HiddenStates);
MuStruct = Mu;
CovStruct = Cov;
MatrixStruct = Matrix;
PiStruct = Pi;

