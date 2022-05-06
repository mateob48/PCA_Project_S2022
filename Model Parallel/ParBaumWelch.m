function [Mu,Cov,trans,Pi,Time]=ParBaumWelch(obs,N)
% Parallel Baum Welch algorithm to train Hidden Markov Model
%
%  Input:
%  - X: Observations (MxT)
%  - N: Number of states
%  (optional inputs)
%  - cyc: Number of iterations of the forward-backward algorithm   
%  - tol: Tolerance to stop iterations
%           
%  Output:
%  - Mu: Means of the normal distributions for each
%        observation in each state (MxN)
%  - Cov: Covariance of the normal distributions for eachs
%         observation in each state (MxMxN)
%  - Pi: Initial state probabilities (1xN)
%  - trans: Transition matrix (NxN)

tStart = tic;
X = obs;
p=length(X(1,:));
T=length(X(:,1));
cyc=100;
tol=0.00001;

% Find the initial means and covariance matrices for each of the states
% Split the observations into evenly size states from smallest to largest
%[idx]=Divide(X,N,'sort');

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

for cycle=1:cyc
    
    % Fordward and backward algorithm
    
    % Find the probabilty of each observation being from each state
    B = zeros(T,N);
    parfor i=1:N
        B(:,i) = mvnpdf(X,Mu(i,:),Cov(:,:,i));
    end
    B(B==0)=1e-200;
    
    % Initial alpha step
    alpha = zeros(T,N);
    alpha(1,:)=Pi.*B(1,:);
    scale(1)=sum(alpha(1,:));
    alpha(1,:)=alpha(1,:)./scale(1);
    
    % Alpha recursion with scaling to avoid underflow
    
    % Alpha recursion 
    for t=2:T
        for i=1:N
            alpha(t,i)=sum(alpha(t-1,:).*trans(:,i)')*B(t,i);
        end
        scale(t)=sum(alpha(t,:));
        alpha(t,:)=alpha(t,:)./scale(t);        
    end

    % Beta recursion 
    beta(T,:)=ones(1,N)/scale(T);
    for t=T-1:-1:1
        for i=1:N
            beta(t,i)=sum(trans(i,:).*B(t+1,:).*beta(t+1,:))/scale(t);
        end
    end
    
    % E (Expectation step) Estimate the state occupation probabilities
    for t=1:T-1
        for i=1:N
            for j=1:N
                Xi(t,i,j)=alpha(t,i)*trans(i,j)*B(t+1,j)*beta(t+1,j);
            end
        end
        a=Xi(t,:,:);
        Xi(t,:,:)=a./sum(a(:));
    end    
    Gamma=(sum(Xi,3));
    
    
    % M (Maximization step) Re-estimate the HMM parameters
    Pi=Gamma(1,:);
    
    parfor i=1:N
        trans(i,:)=squeeze(sum(squeeze(Xi(:,i,:)),1))/squeeze(sum(Gamma(:,i)));
    end
    
    parfor i=1:N
        Mu(i,:)=sum(X(1:end-1,:).*Gamma(:,i))./sum(Gamma(:,i));        
        d=X(1:end-1,:)-Mu(i,:);        
        Cov(:,:,i)=((d.*(Gamma(:,i)*ones(1,p)))'*d)./sum(Gamma(:,i));
    end
end
tEnd = toc(tStart);
Time = tEnd/4;
