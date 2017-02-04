function [vari] = reformInputData(x,imSize)

xReshape = reshape((x/255),[imSize,imSize]);
vari = horzcat(squeeze(var(xReshape,0,2))',squeeze(var(xReshape,0,1)));

end