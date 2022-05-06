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

f(1:4) = parallel.FevalFuture;
for idx = 1:4
    f(idx) = parfeval(@new_mvnpdf,1,XF,MuF(idx,:),CovF(:,:,idx));
end

magicResults = cell(1,4);
for idx = 1:4
    [completedIdx,value] = fetchNext(f);
    magicResults{completedIdx} = value;
    fprintf('Got result with index: %d.\n', completedIdx);
end