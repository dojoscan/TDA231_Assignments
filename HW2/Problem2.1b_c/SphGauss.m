function likelihood = SphGauss(mu,sigma,x)

likelihood = (1/(2*pi*(sigma^2)))*exp(-((x-mu)*(x-mu)')/(2*(sigma^2)));

end