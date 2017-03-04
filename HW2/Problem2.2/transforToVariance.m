function vars = transforToVariance(data)


data = reshape(data,16,16,1100,10)/255;


c1 = var(data, 0, 1);
c2 = var(data, 0, 2);
vars = cat(1, squeeze(c1),squeeze(c2));

