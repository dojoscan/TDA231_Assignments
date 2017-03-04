function [vari, mu] = reformVariance(data,noSamples,imSize)

data_5 = reshape((data/255),[imSize,imSize,noSamples]);
vari = horzcat(squeeze(var(data_5,0,2))',squeeze(var(data_5,0,1))');
mu = mean(vari);

end