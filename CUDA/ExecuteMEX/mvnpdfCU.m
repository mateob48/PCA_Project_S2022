x = rand(10000,58);
mu = mean(x);
sigma = cov(x);

y = new_mvnpdf(x,mu,sigma);
