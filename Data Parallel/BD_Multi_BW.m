tic
clear 
clc
N = 4;
%obs = rand(5000,58);

TotalF = cell(1,N);
ObsStructF = cell(1,N);
trainStructF = cell(1,N);
testStructF = cell(1,N);

TotalM = cell(1,N);
ObsStructM = cell(1,N);
trainStructM = cell(1,N);
testStructM = cell(1,N);

MuStructF = cell(1,N);
CovStructF = cell(1,N);
MatrixStructF = cell(1,N);
PiStructF = cell(1,N);
MuStructM = cell(1,N);
CovStructM = cell(1,N);
MatrixStructM = cell(1,N);
PiStructM = cell(1,N);


for i=1:N
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


parfor i = 1:N
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

toc