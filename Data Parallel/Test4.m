clear
clc
tic
N = 4;
obs = rand(5000,58);

%[Mu,Cov,trans,Pi,Time]=ParBaumWelch(obs,N);


clear 
clc
N = 4;
%obs = rand(5000,58);

Total = cell(1,N);
ObsStruct = cell(1,N);
trainStruct = cell(1,N);
testStruct = cell(1,N);

for i=1:N
    [Total_Obs,Obs,trainD,testD]=load_example_data();
    Total{i} = Total_Obs;
    ObsStruct{i} = Obs;
    trainStruct{i} = trainD;
    testStruct{i} = testD;
end

X = ObsStruct{1};
p=length(X(1,:));
T=length(X(:,1));
cyc=100;
tol=0.00001;

Q=length(X);
idx = cell(1,4);
[~,I] = sort(X);
parfor i=1:N
    idx{i}=I(floor((i-1)*Q/N +1):floor(i*Q/N));
end

Cov=zeros(p,p,N);

CovCell = cell(1,N);
MeanCell = cell(1,N);
CovCell{1} = cov(X(idx{1},:));
CovCell{2} = cov(X(idx{2},:));
CovCell{3} = cov(X(idx{3},:));
CovCell{4} = cov(X(idx{4},:));
MeanCell{1} = mean(X(idx{1},:));
MeanCell{2} = mean(X(idx{2},:));
MeanCell{3} = mean(X(idx{3},:));
MeanCell{4} = mean(X(idx{4},:));

parfor i=1:N
    Cov(:,:,i) = CovCell{i};
    Mu(i,:)= MeanCell{i};
end

% Initialise Priors
Pi=rand(1,N);
Pi=Pi/sum(Pi);

% Initialise Transition matrix
trans=rand(N);
trans=trans./sum(trans')';
    
    % Fordward and backward algorithm
    
    % Find the probabilty of each observation being from each state
    B = zeros(T,N);
    parfor i=1:N
        B(:,i) = mvnpdf(X,Mu(i,:),Cov(:,:,i));
    end
    B(B==0)=1e-200;
    
    % Initial alpha step
    alpha1 = zeros(T,N);
    alpha1(1,:)=Pi.*B(1,:);
    scale1(1)=sum(alpha1(1,:));
    alpha1(1,:)=alpha1(1,:)./scale1(1);
    
    [alpha,scale] = alphaCalc(alpha1,scale1,trans,B,N,T);
toc
%% Alpha parallel - big data application
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

XF = ObsStructF{1};
XM = ObsStructM{1};

pF=length(XF(1,:));
TF=length(XF(:,1));
pM=length(XM(1,:));
TM=length(XM(:,1));

T = cell(1,2);
T{1} = TF;
T{2} = TM;
cyc=20;

% Find the initial means and covariance matrices for each of the states
% Split the observations into evenly size states from smallest to largest
%[idx]=Divide(X,N,'sort');

QF=length(XF);
idxF = cell(1,4);
[~,IF] = sort(XF);

QM=length(XM);
idxM = cell(1,4);
[~,IM] = sort(XM);

parfor i=1:N
    idxF{i}=IF(floor((i-1)*QF/N +1):floor(i*QF/N));
    idxM{i}=IM(floor((i-1)*QM/N +1):floor(i*QM/N));
end

CovF=zeros(pF,pF,N);
MuF = zeros(N,pF);
CovCellF = cell(1,N);
MeanCellF = cell(1,N);
CovCellF{1} = cov(XF(idxF{1},:));
CovCellF{2} = cov(XF(idxF{2},:));
CovCellF{3} = cov(XF(idxF{3},:));
CovCellF{4} = cov(XF(idxF{4},:));
MeanCellF{1} = mean(XF(idxF{1},:));
MeanCellF{2} = mean(XF(idxF{2},:));
MeanCellF{3} = mean(XF(idxF{3},:));
MeanCellF{4} = mean(XF(idxF{4},:));

CovM=zeros(pM,pM,N);
MuM = zeros(N,pM);
CovCellM = cell(1,N);
MeanCellM = cell(1,N);
CovCellM{1} = cov(XM(idxM{1},:));
CovCellM{2} = cov(XM(idxM{2},:));
CovCellM{3} = cov(XM(idxM{3},:));
CovCellM{4} = cov(XM(idxM{4},:));
MeanCellM{1} = mean(XM(idxM{1},:));
MeanCellM{2} = mean(XM(idxM{2},:));
MeanCellM{3} = mean(XM(idxM{3},:));
MeanCellM{4} = mean(XM(idxM{4},:));

parfor i=1:N
    CovF(:,:,i) = CovCellF{i};
    MuF(i,:)= MeanCellF{i};
    CovM(:,:,i) = CovCellM{i};
    MuM(i,:)= MeanCellM{i};
end

% Initialise Priors
Pi=rand(1,N);
Pi=Pi/sum(Pi);

% Initialise Transition matrix
trans = cell(1,2);
transF=rand(N);
transF=transF./sum(transF')';

transM=rand(N);
transM=transM./sum(transM')';

trans{1} = transF;
trans{2} = transM;
%for cycle=1:cyc
    
    % Fordward and backward algorithm
    
    % Find the probabilty of each observation being from each state
    BF = zeros(TF,N);
    BM = zeros(TM,N);
    B = cell(1,2);
    parfor i=1:N
        BF(:,i) = mvnpdf(XF,MuF(i,:),CovF(:,:,i));
        BM(:,i) = mvnpdf(XM,MuM(i,:),CovM(:,:,i));
    end
    BF(BF==0)=1e-200;
    BM(BM==0)=1e-200;
    B{1} = BF;
    B{2} = BM;

    % Initial alpha step
    alphaF = zeros(TF,N);
    alphaF(1,:)=Pi.*BF(1,:);
    scaleF(1)=sum(alphaF(1,:));
    alphaF(1,:)=alphaF(1,:)./scaleF(1);
    
    alphaM = zeros(TM,N);
    alphaM(1,:)=Pi.*BM(1,:);
    scaleM(1)=sum(alphaM(1,:));
    alphaM(1,:)=alphaM(1,:)./scaleM(1);


    alphacell = cell(1,2);
    alphacell{1} = alphaF;
    alphacell{2} = alphaM;
    scalecell = cell(1,2);
    scalecell{1} = scaleF;
    scalecell{2} = scaleM;

    alphaT = cell(1,2);
    scaleT = cell(1,2);
    % Alpha recursion with scaling to avoid underflow
    
    
    % Alpha recursion
    parfor u = 1:2
        [alpha,scale] = alphaCalc(alphacell{u},scalecell{u},trans{u},B{u},N,T{u})
        alphaT{u} = alpha;
        scaleT{u} = scale;
    end

    NalphaF = alphaT{1};
    NalphaM = alphaT{2};
    scaleF = scaleT{1};
    scaleM = scaleT{2};
    % Beta recursion 
    betaF = zeros(TF,N);
    betaF(TF,:)=ones(1,N)/scaleF(TF);
    betaM = zeros(TM,N);
    betaM(TM,:)=ones(1,N)/scaleM(TM);

%     betacell = cell(1,2);
%     betacell{1} = betaF;
%     betacell{2} = betaM;

    betaT = cell(1,2);
    newBF = B{1};
    newBM = B{2};

    vBF = newBF;
    vBM = newBM;
    transF2 = transF;
    transM2 = transM;
    for t=T{1}-1:-1:1
        for i=1:N
            betaF(t,i)=sum(transF2(i,:).*vBF(t+1,:).*betaF(t+1,:))/scaleF(t);
            betaM(t,i)=sum(transM2(i,:).*vBM(t+1,:).*betaM(t+1,:))/scaleM(t);
        end
    end

    betaT{1} = betaF;
    betaT{2} = betaM;
    NbetaF = betaT{1};
    NbetaM = betaT{2};

    for t=1:TF-1
        for i=1:N
            for j=1:N
                XiF(t,i,j)=NalphaF(t,i)*transF2(i,j)*vBF(t+1,j)*NbetaF(t+1,j);
                XiM(t,i,j)=NalphaM(t,i)*transM2(i,j)*vBM(t+1,j)*NbetaM(t+1,j);
            end
        end
        aF=XiF(t,:,:);
        XiF(t,:,:)=aF./sum(aF(:));
        aM=XiM(t,:,:);
        XiM(t,:,:)=aM./sum(aM(:));
    end    
    GammaF=(sum(XiF,3));
    GammaM=(sum(XiM,3));
    
    
    % M (Maximization step) Re-estimate the HMM parameters
    PiF=GammaF(1,:);
    PiM=GammaM(1,:);
    
    parfor i=1:N
        transF(i,:)=squeeze(sum(squeeze(XiF(:,i,:)),1))/squeeze(sum(GammaF(:,i)));
        transM(i,:)=squeeze(sum(squeeze(XiM(:,i,:)),1))/squeeze(sum(GammaM(:,i)));
    end
    
    parfor i=1:N
        MuF(i,:)=sum(XF(1:end-1,:).*GammaF(:,i))./sum(GammaF(:,i));        
        dF=XF(1:end-1,:)-MuF(i,:);        
        CovF(:,:,i)=((dF.*(GammaF(:,i)*ones(1,pF)))'*dF)./sum(GammaF(:,i));
        MuM(i,:)=sum(XM(1:end-1,:).*GammaM(:,i))./sum(GammaM(:,i));        
        dM=XM(1:end-1,:)-MuM(i,:);        
        CovM(:,:,i)=((dM.*(GammaM(:,i)*ones(1,pM)))'*dM)./sum(GammaM(:,i));
    end


%end
toc

%% Testing ParBaumWelch_BD

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

obsF = trainStructF{1};
obsM = trainStructM{1};

[MuF,CovF,MuM,CovM,transF,transM,PiF,PiM,Time]=ParBaumWelch_BD(obsF,obsM,N);

toc

%% Viterbi

