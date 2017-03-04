function class = SphClassify(mu_pos,mu_neg,sigma_pos,sigma_neg,prior,x)

lik_pos = SphGauss(mu_pos,sigma_pos,x);
lik_neg = SphGauss(mu_neg,sigma_neg,x);
p = (lik_pos*prior(1))/((lik_pos*prior(1))+(lik_neg*prior(2)));
if p > 0.5
    class = 1;
elseif p < 0.5
    class = -1;
else
    class = 0;
end

end