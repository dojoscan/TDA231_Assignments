function kX = SplitData(k,X)

[nData,nDim] = size(X);
nSplit = nData/k;
if nSplit - round(nSplit) ~= 0
   kX = [];
   disp('Cannot data split evenly')
   return
end
kX = zeros(nSplit,nDim,k);
indVect = randperm(nData);
for i = 1:k
    kX(:,:,i) = X(indVect((i-1)*nSplit+1:i*nSplit),:);
end

end