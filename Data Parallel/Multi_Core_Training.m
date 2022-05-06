
NumTrain = 6;
HiddenStates = 4;
up1 = 10000;
up2 = 20000;

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
    [Total_Obs,Obs,trainD,testD]=load_example_data(up1, up2);
    Total{i} = Total_Obs;
    ObsStruct{i} = Obs;
    trainStruct{i} = trainD;
    testStruct{i} = testD;
end


% With spmd block

spmd(6)
    if labindex == 1
        [Mu,Cov,Matrix,Pi]=BaumWelch(trainStruct{1},HiddenStates);
        MuStruct = Mu;
        CovStruct = Cov;
        MatrixStruct = Matrix;
        PiStruct = Pi;
    elseif labindex == 2
        [Mu,Cov,Matrix,Pi]=BaumWelch(trainStruct{2},HiddenStates);
        MuStruct = Mu;
        CovStruct = Cov;
        MatrixStruct = Matrix;
        PiStruct = Pi;
    elseif labindex == 3
        [Mu,Cov,Matrix,Pi]=BaumWelch(trainStruct{3},HiddenStates);
        MuStruct = Mu;
        CovStruct = Cov;
        MatrixStruct = Matrix;
        PiStruct = Pi;
    elseif labindex == 4
        [Mu,Cov,Matrix,Pi]=BaumWelch(trainStruct{4},HiddenStates);
        MuStruct = Mu;
        CovStruct = Cov;
        MatrixStruct = Matrix;
        PiStruct = Pi;
    elseif labindex == 5
        [Mu,Cov,Matrix,Pi]=BaumWelch(trainStruct{5},HiddenStates);
        MuStruct = Mu;
        CovStruct = Cov;
        MatrixStruct = Matrix;
        PiStruct = Pi;
    elseif labindex == 6
        [Mu,Cov,Matrix,Pi]=BaumWelch(trainStruct{6},HiddenStates);
        MuStruct = Mu;
        CovStruct = Cov;
        MatrixStruct = Matrix;
        PiStruct = Pi;
    end
end
Mu1 = MuStruct{1};
Mu2 = MuStruct{2};
Mu3 = MuStruct{3};
Mu4 = MuStruct{4};
Mu5 = MuStruct{5};
Mu6 = MuStruct{6};

Cov1 = CovStruct{1};
Cov2 = CovStruct{2};
Cov3 = CovStruct{3};
Cov4 = CovStruct{4};
Cov5 = CovStruct{5};
Cov6 = CovStruct{6};

Trans1 = MatrixStruct{1};
Trans2 = MatrixStruct{2};
Trans3 = MatrixStruct{3};
Trans4 = MatrixStruct{4};
Trans5 = MatrixStruct{5};
Trans6 = MatrixStruct{6};

Pi1 = PiStruct{1};
Pi2 = PiStruct{2};
Pi3 = PiStruct{3};
Pi4 = PiStruct{4};
Pi5 = PiStruct{5};
Pi6 = PiStruct{6};

MuT = (Mu1+Mu2+Mu3+Mu4+Mu5+Mu6)/6;
CovT = (Cov1+Cov2+Cov3+Cov4+Cov5+Cov6)/6;
TransT = (Trans1+Trans2+Trans3+Trans4+Trans5+Trans6)/6;
PiT = (Pi1+Pi2+Pi3+Pi4+Pi5+Pi6)/2;

parfor i = 1:NumTrain
    [max_ind,delta,prb,tEnd2]=Parviterbi_alg(testStruct{i},MuT,CovT,PiT,TransT);
    max_indStruct{i} = max_ind;
    deltaStruct{i} = delta;
    prbStruct{i} = prb;
    tEnd2Struct{i} = tEnd2;
end