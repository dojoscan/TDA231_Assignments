function [vari, xReform] = reformInputData(x,imSize)

xReshape = reshape((x/255),[imSize,imSize]);
vari = horzcat(squeeze(var(xReshape,0,2))',squeeze(var(xReshape,0,1)));
xReform = mean(vari);

end