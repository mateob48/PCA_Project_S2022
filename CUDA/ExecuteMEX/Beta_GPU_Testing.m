%% CPU Implementation
tic
Var = 6;
Obs = 10000;
alphaData = cell(1,Var);
betaData = cell(1,Var);
scaleData = cell(1,Var);
transData = cell(1,Var);
BData = cell(1,Var);
T = Obs;
N = 4;
for j = 1:Var
    alpha = rand(Obs,N);
    beta = rand(Obs,N);
    scale = rand(1,Obs);
    trans = rand(N,N);
    B = rand(Obs,N);
    
    alphaData{j} = alpha;
    betaData{j} = beta;
    scaleData{j} = scale;
    transData{j} = trans;
    BData{j} = B;
end

betaStruct_CPU = cell(1,Var);

for i = 1:Var
    [beta] = betaCalc(betaData{i},scaleData{i},transData{i},BData{i},N);
    betaStruct_CPU{i} = beta;
end
toc

%% GPU Implementation

tic
Var = 6;
Obs = 10000;
alphaData = cell(1,Var);
betaData = cell(1,Var);
scaleData = cell(1,Var);
transData = cell(1,Var);
BData = cell(1,Var);
T = Obs;
N = 4;
for j = 1:Var
    alpha = rand(Obs,N);
    beta = zeros(Obs,N);
    scale = rand(1,Obs);
    trans = rand(N,N);
    B = rand(Obs,N);
    
    alphaData{j} = alpha;
    betaData{j} = beta;
    scaleData{j} = scale;
    transData{j} = trans;
    BData{j} = B;
end

betaStruct_GPU = cell(1,Var);

for i = 1:Var
    [beta] = betaCalc_mex(betaData{i},scaleData{i},transData{i},BData{i},N);;
    betaStruct_GPU{i} = beta;
end
toc