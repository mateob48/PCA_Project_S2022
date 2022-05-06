function y = new_mvnpdf(X, Mu, Sigma)
%MVNPDF Multivariate normal probability density function (pdf).
%   Y = MVNPDF(X) returns the probability density of the multivariate normal
%   distribution with zero mean and identity covariance matrix, evaluated at
%   each row of X.  Rows of the N-by-D matrix X correspond to observations or
%   points, and columns correspond to variables or coordinates.  Y is an
%   N-by-1 vector.
%
%   Y = MVNPDF(X,MU) returns the density of the multivariate normal
%   distribution with mean MU and identity covariance matrix, evaluated
%   at each row of X.  MU is a 1-by-D vector, or an N-by-D matrix, in which
%   case the density is evaluated for each row of X with the corresponding
%   row of MU.  MU can also be a scalar value, which MVNPDF replicates to
%   match the size of X.
%
%   Y = MVNPDF(X,MU,SIGMA) returns the density of the multivariate normal
%   distribution with mean MU and covariance SIGMA, evaluated at each row
%   of X.  SIGMA is a D-by-D matrix, or an D-by-D-by-N array, in which case
%   the density is evaluated for each row of X with the corresponding page
%   of SIGMA, i.e., MVNPDF computes Y(I) using X(I,:) and SIGMA(:,:,I).
%   If the covariance matrix is diagonal, containing variances along the 
%   diagonal and zero covariances off the diagonal, SIGMA may also be
%   specified as a 1-by-D matrix or a 1-by-D-by-N array, containing 
%   just the diagonal. Pass in the empty matrix for MU to use its default 
%   value when you want to only specify SIGMA.
%
%   If X is a 1-by-D vector, MVNPDF replicates it to match the leading
%   dimension of MU or the trailing dimension of SIGMA.
%
%   Example:
%
%      mu = [1 -1]; Sigma = [.9 .4; .4 .3];
%      [X1,X2] = meshgrid(linspace(-1,3,25)', linspace(-3,1,25)');
%      X = [X1(:) X2(:)];
%      p = mvnpdf(X, mu, Sigma);
%      surf(X1,X2,reshape(p,25,25));
%
%   See also MVTPDF, MVNCDF, MVNRND, NORMPDF.

%   Copyright 1993-2008 The MathWorks, Inc.
%   $Revision: 1.2.4.8 $  $Date: 2008/02/29 13:12:08 $

% Get size of data.  Column vectors provisionally interpreted as multiple scalar data.
[n,d] = size(X);

% Assume zero mean, data are already centered
if nargin < 2
    X0 = X;

% Get scalar mean, and use it to center data
elseif numel(Mu) == 1
    X0 = X - Mu;

% Get vector mean, and use it to center data
elseif ismatrix(Mu)
    [n2,d2] = size(Mu);
    if d2 ~= d % has to have same number of coords as X
        error('stats:mvnpdf:InputSizeMismatch',...
              'X and MU must have the same number of columns.');
    elseif n2 == n % lengths match
        X0 = X - Mu;
    elseif n2 == 1 % mean is a single row, rep it out to match data
        X0 = bsxfun(@minus,X,Mu);
    elseif n == 1 % data is a single row, rep it out to match mean
        n = n2;
        X0 = bsxfun(@minus,X,Mu);  
    else % sizes don't match
        error('stats:mvnpdf:InputSizeMismatch',...
              ['X or MU must be a row vector, or X and MU must have the '...
              'same number of rows.']);
    end
    
else
    error('stats:mvnpdf:BadMu','MU must be a matrix.');
end

% Assume identity covariance, data are already standardized
if nargin < 3
    % Special case: if Sigma isn't supplied, then interpret X
    % and Mu as row vectors if they were both column vectors
    if (d == 1) && (numel(X) > 1)
        X0 = X0';
        d = size(X0,2);
    end
    xRinv = X0;
    logSqrtDetSigma = 0;
    
% Single covariance matrix
elseif ismatrix(Sigma)
    sz = size(Sigma);
    if sz(1)==1 && sz(2)>1
        % Just the diagonal of Sigma has been passed in.
        sz(1) = sz(2);
        sigmaIsDiag = true;
    else
        sigmaIsDiag = false;
    end
    
    % Special case: if Sigma is supplied, then use it to try to interpret
    % X and Mu as row vectors if they were both column vectors.
    if (d == 1) && (numel(X) > 1) && (sz(1) == n)
        X0 = X0';
        d = size(X0,2);
    end
    
    %Check that sigma is the right size
    if sz(1) ~= sz(2)
        error('stats:mvnpdf:BadCovariance',...
              'SIGMA must be a square matrix or a vector.');
    elseif ~isequal(sz, [d d])
        error('stats:mvnpdf:InputSizeMismatch',...
              ['SIGMA must be a square matrix with size equal to the ' ...
              'number of columns in X, or a row vector with length '...
              'equal to the number of columns in X.']);
    else
        if sigmaIsDiag
            if any(Sigma<=0)
                error('stats:mvnpdf:BadDiagSigma', ...
                    'All elements of diagonal SIGMA must be positive.');
            end
            R = sqrt(Sigma);
            xRinv = bsxfun(@rdivide,X0,R);
            logSqrtDetSigma = sum(log(R));
        else
            % Make sure Sigma is a valid covariance matrix
            [R,err] = cholcov_M(Sigma,0);
            if err ~= 0
                error('stats:mvnpdf:BadCovariance', ...
                    'SIGMA must be symmetric and positive definite.');
            end
            % Create array of standardized data, and compute log(sqrt(det(Sigma)))
            xRinv = X0 / R;
            logSqrtDetSigma = sum(log(diag(R)));
        end
    end
    
end
% The quadratic form is the inner products of the standardized data
quadform = sum(xRinv.^2, 2);

y = exp(-0.5*quadform - logSqrtDetSigma - d*log(2*pi)/2);