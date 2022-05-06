scale = zeros(1,10000);
trans = rand(4,4);
B = rand(10000,4);
beta = zeros(10000,4);
N = 4;

[beta] = betaCalc(beta,scale,trans,B,N);