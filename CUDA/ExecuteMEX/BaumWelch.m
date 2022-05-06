function [Mu,Cov,trans,Pi,Time]=BaumWelch(X,N)
% Baum Welch algorithm to train Hidden Markov Model
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
p=length(X(1,:));
T=length(X(:,1));

cyc=100;
tol=0.00001;


% Find the initial means and covariance matrices for each of the states
% Split the observations into evenly size states from smallest to largest
%[idx]=Divide(X,N,'sort');
Q=length(X);
idx = cell(1,4);
idx1 = coder.nullcopy(idx);
[~,I] = sortrows(X);
for i=1:N
    idx1{i}=I(floor((i-1)*Q/N +1):floor(i*Q/N));
end

Mu = zeros(N,p);
Cov=zeros(p,p,N);
for i=1:N
    Cov(:,:,i)=cov(X(idx1{i},:));
    Mu(i,:)=mean(X(idx1{i},:));
end

% Initialise Priors
Pi=rand(1,N);
Pi=Pi/sum(Pi);

% Initialise Transition matrix
trans=rand(N);
trans=trans./sum(trans')';

for cycle=1:cyc
    
    % Forward and backward algorithm to calculate the values of alpha and
    % betha to determine the initial state probabilities
    
    B = zeros(T,N);

    % Find the probabilty of each observation being from each state
    for i=1:N
        B(:,i) = new_mvnpdf(X,Mu(i,:),Cov(:,:,i));
    end
    B(B==0)=1e-200;
    
    % Initial alpha step
    alpha = zeros(T,N);
    scale = zeros(1,T);
    alpha(1,:)=Pi.*B(1,:);
    scale(1)=sum(alpha(1,:));
    alpha(1,:)=alpha(1,:)./scale(1);
    
    % Alpha recursion 
    for t=2:T
        for i=1:N
            alpha(t,i)=sum(alpha(t-1,:).*trans(:,i)')*B(t,i);
        end
        scale(t)=sum(alpha(t,:));
        alpha(t,:)=alpha(t,:)./scale(t);        
    end
    
    % Beta recursion
    beta = zeros(T,N);
    beta(T,:)=ones(1,N)/scale(T);
    for t=T-1:-1:1
        for i=1:N
            beta(t,i)=sum(trans(i,:).*B(t+1,:).*beta(t+1,:))/scale(t);
        end
    end
    
    % E (Expectation step) Estimate the state occupation probabilities
    % which is necessary to obtain the training step of the HMM model
    Xi=zeros(T-1,N,N);
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
    
    
    % M (Maximization step) Re-estimate the HMM parameters to obtain the
    % maximum likelihood of the calculated parameters
    Pi=Gamma(1,:);
    
    for i=1:N
        trans(i,:)=squeeze(sum(squeeze(Xi(:,i,:)),1))/squeeze(sum(Gamma(:,i)));
    end
    
    
    for i=1:N
        Mu(i,:)=sum(X(1:end-1,:).*Gamma(:,i))./sum(Gamma(:,i));       
        d=X(1:end-1,:)-Mu(i,:);        
        Cov(:,:,i)=((d.*(Gamma(:,i)*ones(1,p)))'*d)./sum(Gamma(:,i));
    end
end
tEnd = toc(tStart);
Time = tEnd;
