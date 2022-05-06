clc
clear
close all

[Total_F,Total_M,ObsF,ObsM,trainF,testF,trainM,testM]=load_total_data();

XF = trainF;
XM = trainM;
N = 4;

pF=length(XF(1,:));
TF=length(XF(:,1));
pM=length(XM(1,:));
TM=length(XM(:,1));
cycle = 100;

% Find the initial means and covariance matrices for each of the states
% Split the observations into evenly size states from smallest to largest
%[idx]=Divide(X,N,'sort');
QF=length(XF);
idxF = cell(1,4);
[~,IF] = sort(XF);

QM=length(XM);
idxM = cell(1,4);
[~,IM] = sort(XM);
for i=1:N
    idxF{i}=IF(floor((i-1)*QF/N +1):floor(i*QF/N));
    idxM{i}=IM(floor((i-1)*QM/N +1):floor(i*QM/N));
end

MuF = zeros(N,pF);
CovF=zeros(pF,pF,N);
MuM = zeros(N,pM);
CovM=zeros(pM,pM,N);
for i=1:N
    CovF(:,:,i)=cov(XF(idxF{i},:));
    MuF(i,:)=mean(XF(idxF{i},:));
    CovM(:,:,i)=cov(XM(idxM{i},:));
    MuM(i,:)=mean(XM(idxM{i},:));
end

% Initialise Priors
PiF=rand(1,N);
PiF=PiF/sum(PiF);
PiM=rand(1,N);
PiM=PiM/sum(PiM);

% Initialise Transition matrix
transF=rand(N);
transF=transF./sum(transF')';
transM=rand(N);
transM=transM./sum(transM')';

% Forward and backward algorithm to calculate the values of alpha and
% betha to determine the initial state probabilities
    
% Find the probabilty of each observation being from each state
BF = zeros(TF,N);
BstructF = cell(1,cycle);
BM = zeros(TM,N);
BstructM = cell(1,cycle);
for j = 1:cycle
    for i=1:N
        BF(:,i) = new_mvnpdf_mex(XF,MuF(i,:),CovF(:,:,i));
        BM(:,i) = new_mvnpdf_mex(XM,MuM(i,:),CovM(:,:,i));
    end
    BF(BF==0)=1e-200;
    BstructF{j} = BF;
    BM(BM==0)=1e-200;
    BstructM{j} = BM;

end