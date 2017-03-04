function sMap = CalculateMAP(x,alpha,beta)

n = size(x,1);
mu = mean(x);
muRep = repmat(mu,n,1);
diff = x-muRep;
bp = sum(sum(diff.^2),2)/2;
alphaPost = alpha + n;
betaPost = beta + bp;
sMap = betaPost/(alphaPost+1);

end