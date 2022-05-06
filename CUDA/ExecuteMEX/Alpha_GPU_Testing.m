%% CPU Implementation
tic
Var = 7;
Obs = 100;
alphaData = cell(1,Var);
scaleData = cell(1,Var);
transData = cell(1,Var);
BData = cell(1,Var);
T = Obs;
N = 4;
for j = 1:Var
    alpha = rand(Obs,N);
    scale = rand(1,Obs);
    trans = rand(N,N);
    B = rand(Obs,N);
    
    alphaData{j} = alpha;
    scaleData{j} = scale;
    transData{j} = trans;
    BData{j} = B;
end

alphaStruct_CPU = cell(1,Var);
scaleStruct_CPU = cell(1,Var);

for i = 1:Var
    [alpha,scale] = alphaCalc(alphaData{i},scaleData{i},transData{i},BData{i},N,T);
    alphaStruct_CPU{i} = alpha;
    scaleStruct_CPU{i} = scale;
end
toc

%% GPU Implementation

tic
Var = 6;
Obs = 10;
alphaData = cell(1,Var);
scaleData = cell(1,Var);
transData = cell(1,Var);
BData = cell(1,Var);
T = Obs;
N = 4;
for j = 1:Var
    alpha = rand(Obs,N);
    scale = rand(1,Obs);
    trans = rand(N,N);
    B = rand(Obs,N);
    
    alphaData{j} = alpha;
    scaleData{j} = scale;
    transData{j} = trans;
    BData{j} = B;
end

alphaStruct_GPU = cell(1,Var);
scaleStruct_GPU = cell(1,Var);

for i = 1:Var
    [alpha,scale] = alphaCalc_mex(alphaData{i},scaleData{i},transData{i},BData{i},N,T);
    alphaStruct_GPU{i} = alpha;
    scaleStruct_GPU{i} = scale;
end
toc

