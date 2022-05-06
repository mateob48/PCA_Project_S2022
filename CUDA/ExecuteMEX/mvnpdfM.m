function pdf = mvnpdfM(x,mu,sigma)
  [d,p] = size(x);
  % mu can be a scalar, a 1xp vector or a nxp matrix
    r = chol(sigma);
    pdf = (2*pi)^(-p/2) * exp(-sum((x-mu)/r,2)/2) / prod(diag(r));
  end