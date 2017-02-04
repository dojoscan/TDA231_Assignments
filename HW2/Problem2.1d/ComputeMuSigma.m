function [mu,sigma] = ComputeMuSigma(X)

N = size(X,1);
mu = sum(X)./N;
sigma = (1/N)*sum(sum((X-repmat(mu,N,1)).^2));

end