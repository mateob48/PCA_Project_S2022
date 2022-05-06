clear
clc

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

% Initial alpha step
alphaF = zeros(TF,N);
scaleF = zeros(1,TF);
alphaF(1,:)=PiF.*BF(1,:);
scaleF(1)=sum(alphaF(1,:));
alphaF(1,:)=alphaF(1,:)./scaleF(1);

[alpha,scale] = alphaCalc_mex(alphaF,scaleF,transF,BF,N,TF);

betaF = zeros(TF,N);
betaF(TF,:)=ones(1,N)/scale(TF);

[beta] = betaCalc_mex(betaF,scale,transF,BF,N);

[Xi,Gamma] = expectation_mex(alpha,transF,BF,beta,TF,N);

Pi=Gamma(1,:);
    
for i=1:N
    transF(i,:)=squeeze(sum(squeeze(Xi(:,i,:)),1))/squeeze(sum(Gamma(:,i)));
end
    
    
for i=1:N
    MuF(i,:)=sum(XF(1:end-1,:).*Gamma(:,i))./sum(Gamma(:,i));       
    d=XF(1:end-1,:)-MuF(i,:);        
    CovF(:,:,i)=((d.*(Gamma(:,i)*ones(1,pF)))'*d)./sum(Gamma(:,i));
end