alpha = zeros(10000,4);
scale = zeros(1,10000);
trans = rand(4,4);
B = rand(10000,4);
N = 4;
T = 10000;

[alpha,scale] = alphaCalc(alpha,scale,trans,B,N,T);