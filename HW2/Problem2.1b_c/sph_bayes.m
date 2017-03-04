function [P1, P2, Ytest]=sph_bayes(Xtest,X,Y,prior) % other parameters needed
   
[mu_pos,sigma_pos] = ComputeMuSigma(1,X,Y);
lik_pos = SphGauss(mu_pos,sigma_pos,Xtest);
[mu_neg,sigma_neg] = ComputeMuSigma(-1,X,Y);
lik_neg = SphGauss(mu_neg,sigma_neg,Xtest);

P1 = (lik_pos*prior(1))/(lik_pos*prior(1)+lik_neg*prior(2));
P2 = 1-P1;
Ytest = sign(P1-0.5);

end