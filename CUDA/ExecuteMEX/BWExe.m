X = rand(1000,58);
N = 4;

[Mu,Cov,trans,Pi,Time]=BaumWelch(X,N);