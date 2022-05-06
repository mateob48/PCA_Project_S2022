function [max_ind,delta,prb,delta1,Time]=viterbi_alg(obs,Mu,Cov,Pi,trans)
% Viterbi algorithm to find the most probable hidden state sequence
%
%  Input:
%  - obs: Observations (MxT)
%  - Mu: Means of the normal distributions for each
%        observation in each state (MxN)
%  - Cov: Covariance of the normal distributions for eachs
%         observation in each state (MxMxN)
%  - Pi: Initial state probabilities (1xN)
%  - trans:  Transition matrix (NxN)
%    (optional inputs)
%  - continuous:    1 for continuous obs, 0 for discrete (default continuous)
%           
%   Output:
%   - max_ind: Indicies of the states of the most likely sequence
%   - delta: Log transformed probability of being in each state       
%   - prb: Probability of being in each state
% 

tStart2 = tic;
    
% Set probabilities of zero to be small
Pi(Pi==0)=1e-50;
p=length(trans);

%Compute the observation probabilites, p(x|o)
for i=1:p
    pdf_vals(i,:) = mvnpdf(obs,Mu(i,:),Cov(:,:,i));
end

% Initialisation
delta=zeros(p,length(obs(:,1)));
gamma=ones(p,length(obs(:,1)));

%Prevent zeros in the pdf distribution 
ind=pdf_vals==0;
pdf_vals(ind)=0.000001;


for i=1:p
    delta(i,1)=log(Pi(1,i))+log(pdf_vals(i,1));
    prb(i,1)=Pi(1,i)*pdf_vals(i,1);    
end

scale(1)=sum(prb(:,1));
prb(:,1)=prb(:,1)./scale(1);

%Recursive calculation
for t=2:length(obs)
    for state=1:p
        delta(state,t)=max(delta(:,t-1)+log(trans(:,state)))+log(pdf_vals(state,t));
        prb(state,t)=max(prb(:,t-1).*trans(:,state))*pdf_vals(state,t);
        [~,max_gamm]=max(delta(:,t-1)+log(trans(:,state)));
        gamma(state,t)=max_gamm;
    end
    scale(t)=sum(prb(:,t));
    prb(:,t)=prb(:,t)./scale(t);
end
delta1 = delta;
%Termination
s_MAP=zeros(1,length(obs(:,1)));
[~,s_MAP(end)]=max(delta(:,end));
Prob_max=max(delta(:,end));

%Backtracking
for t=length(obs)-1:-1:1
    s_MAP(t)=gamma(s_MAP(t+1),t);    
end
max_ind=s_MAP;
tEnd2 = toc(tStart2);
Time = tEnd2;
