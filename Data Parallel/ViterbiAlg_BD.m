function [max_indF,deltaF,prbF,max_indM,deltaM,prbM,Time]=ViterbiAlg_BD(obsF,MuF,CovF,PiF,transF,obsM,MuM,CovM,PiM,transM)
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
PiF(PiF==0)=1e-50;
pF=length(transF);
PiM(PiM==0)=1e-50;
pM=length(transM);


%Compute the observation probabilites, p(x|o)
parfor i=1:pF
    pdf_valsF(i,:) = mvnpdf(obsF,MuF(i,:),CovF(:,:,i));
    pdf_valsM(i,:) = mvnpdf(obsM,MuM(i,:),CovM(:,:,i));
end

%Initialisation
deltaF=zeros(pF,length(obsF(:,1)));
gammaF=ones(pF,length(obsF(:,1)));
deltaM=zeros(pM,length(obsM(:,1)));
gammaM=ones(pM,length(obsM(:,1)));

%Prevent zeros in the pdf distribution 
indF=pdf_valsF==0;
pdf_valsF(indF)=0.000001;
indM=pdf_valsM==0;
pdf_valsM(indM)=0.000001; 

parfor i=1:pF
    deltaF(i,1)=log(PiF(1,i))+log(pdf_valsF(i,1));
    prbF(i,1)=PiF(1,i)*pdf_valsF(i,1);
    deltaM(i,1)=log(PiM(1,i))+log(pdf_valsM(i,1));
    prbM(i,1)=PiM(1,i)*pdf_valsM(i,1); 
end
scaleF = zeros(1,length(obsF));
scaleF(1)=sum(prbF(:,1));
prbF(:,1)=prbF(:,1)./scaleF(1);
scaleM = zeros(1,length(obsM));
scaleM(1)=sum(prbM(:,1));
prbM(:,1)=prbM(:,1)./scaleM(1);

%Recursive calculation
for t=2:length(obsF)
    for state=1:pF
        deltaF(state,t)=max(deltaF(:,t-1)+log(transF(:,state)))+log(pdf_valsF(state,t));
        prbF(state,t)=max(prbF(:,t-1).*transF(:,state))*pdf_valsF(state,t);
        [~,max_gammF]=max(deltaF(:,t-1)+log(transF(:,state)));
        gammaF(state,t)=max_gammF;
        
        deltaM(state,t)=max(deltaM(:,t-1)+log(transM(:,state)))+log(pdf_valsM(state,t));
        prbM(state,t)=max(prbM(:,t-1).*transM(:,state))*pdf_valsM(state,t);
        [~,max_gammM]=max(deltaM(:,t-1)+log(transM(:,state)));
        gammaM(state,t)=max_gammM;
    end
    scaleF(t)=sum(prbF(:,t));
    prbF(:,t)=prbF(:,t)./scaleF(t);
    scaleM(t)=sum(prbM(:,t));
    prbM(:,t)=prbM(:,t)./scaleM(t);
end

%Termination
s_MAPF=zeros(1,length(obsF(:,1)));
[~,s_MAPF(end)]=max(deltaF(:,end));
Prob_maxF=max(deltaF(:,end));

s_MAPM=zeros(1,length(obsM(:,1)));
[~,s_MAPM(end)]=max(deltaM(:,end));
Prob_maxM=max(deltaM(:,end));

%Backtracking
for t=length(obsF)-1:-1:1
    s_MAPF(t)=gammaF(s_MAPF(t+1),t);
    s_MAPM(t)=gammaM(s_MAPM(t+1),t);
end

max_indF=s_MAPF;
max_indM=s_MAPM;

tEnd2 = toc(tStart2);
Time = tEnd2/4;