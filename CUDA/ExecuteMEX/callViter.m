obs = rand(1000,58);
Mu = mean(obs);
Cov = rand(58,58,4);
Pi = rand(1,4);
trans = rand(4,4);

[max_ind,delta,prb,delta1,Time]=viterbi_alg(obs,Mu,Cov,Pi,trans);
