tic
clear 
clc
N = 4;
NumExp = 5;
%obs = rand(5000,58);

TotalF = cell(1,NumExp);
ObsStructF = cell(1,NumExp);
trainStructF = cell(1,NumExp);
testStructF = cell(1,NumExp);

TotalM = cell(1,NumExp);
ObsStructM = cell(1,NumExp);
trainStructM = cell(1,NumExp);
testStructM = cell(1,NumExp);

MuStructF = cell(1,NumExp);
CovStructF = cell(1,NumExp);
MatrixStructF = cell(1,NumExp);
PiStructF = cell(1,NumExp);
MuStructM = cell(1,NumExp);
CovStructM = cell(1,NumExp);
MatrixStructM = cell(1,NumExp);
PiStructM = cell(1,NumExp);

max_indStructF = cell(1,NumExp);
deltaStructF = cell(1,NumExp);
prbStructF = cell(1,NumExp);
max_indStructM = cell(1,NumExp);
deltaStructM = cell(1,NumExp);
prbStructM = cell(1,NumExp);

for i=1:NumExp
    [Total_F,Total_M,ObsF,ObsM,trainF,testF,trainM,testM]=load_total_data();
    TotalF{i} = Total_F;
    ObsStructF{i} = ObsF;
    trainStructF{i} = trainF;
    testStructF{i} = testF;
    TotalM{i} = Total_M;
    ObsStructM{i} = ObsM;
    trainStructM{i} = trainM;
    testStructM{i} = testM;
end


parfor i = 1:NumExp
    [MuF,CovF,MuM,CovM,MatrixF,MatrixM,PiF,PiM,Time]=ParBaumWelch_BD(trainStructF{i},trainStructM{i},N);

    MuStructF{i} = MuF;
    CovStructF{i} = CovF;
    MatrixStructF{i} = MatrixF;
    PiStructF{i} = PiF;
    
    MuStructM{i} = MuM;
    CovStructM{i} = CovM;
    MatrixStructM{i} = MatrixM;
    PiStructM{i} = PiM;
end

parfor i = 1:NumExp
    [max_indF,deltaF,prbF,max_indM,deltaM,prbM,Time]=ViterbiAlg_BD(testStructF{i},MuStructF{i},CovStructF{i},PiStructF{i},MatrixStructF{i},testStructM{i},MuStructM{i},CovStructM{i},PiStructM{i},MatrixStructM{i})
    max_indStructF{i} = max_indF;
    deltaStructF{i} = deltaF;
    prbStructF{i} = prbF;
    max_indStructM{i} = max_indM;
    deltaStructM{i} = deltaM;
    prbStructM{i} = prbM;
end
toc