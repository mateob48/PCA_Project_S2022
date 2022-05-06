N = 4;
X = rand(5000,58);

[Mu,Cov,trans,Pi,Time]=ParBaumWelch(X,N);
