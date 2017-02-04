function Xclass = SplitClass(class,Y,X)

yBin = sign(Y+1);
if class == -1
    yBin = (yBin-1).^2; 
end
X(yBin==0,:) = [];
Xclass = X;

end