function [mu,sigma] = ComputeMuSigma(class,X,Y)

yBin = sign(Y+1);
if class == -1
    yBin = (yBin-1).^2; 
end
N = sum(yBin,1);
mu = (yBin'*X)./N;
X(yBin==0,:) = [];
sigma = (1/N)*sum(sum((X-repmat(mu,N,1)).^2));

end