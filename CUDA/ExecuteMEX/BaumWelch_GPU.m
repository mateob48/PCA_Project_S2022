function [Mu,Cov,trans,Pi,Time]=BaumWelch_GPU(X,N)
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
        B(:,i) = new_mvnpdf_mex(X,Mu(i,:),Cov(:,:,i));
    end
    B(B==0)=1e-200;
    
    % Initial alpha step
    alpha = zeros(T,N);
    scale = zeros(1,T);
    alpha(1,:)=Pi.*B(1,:);
    scale(1)=sum(alpha(1,:));
    alpha(1,:)=alpha(1,:)./scale(1);
    
    % Alpha recursion GPU 
    [alpha,scale] = alphaCalc_mex(alpha,scale,trans,B,N,T);

    % Beta recursion GPU
    beta = zeros(T,N);
    beta(T,:)=ones(1,N)/scale(T);

    [beta] = betaCalc_mex(beta,scale,trans,B,N);
    
    % E (Expectation step) Estimate the state occupation probabilities
    % which is necessary to obtain the training step of the HMM model
    [Xi,Gamma] = expectation_mex(alpha,trans,B,beta,T,N);
    
    
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
