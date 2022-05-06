alpha = zeros(10000,4);
trans = rand(4,4);
B = rand(10000,4);
N = 4;
T = 10000;
beta = zeros(10000,4);

[Xi,Gamma] = expectation(alpha,trans,B,beta,T,N);