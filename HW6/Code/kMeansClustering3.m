function [labelsCon] = kMeansClustering3(k,points)

[nPoints,nDim] = size(points);
disagree = 100;
it = 1;
sigma = 0.2;
oldLabels = randi(k,nPoints,1);
while disagree > 0 
  it, disagree
    onehot = full(ind2vec(oldLabels')');
 distMat = kdist(points,onehot,sigma);
 [~,newLabels] = min(distMat,[],2);
 
 disagree = nnz(newLabels-oldLabels);
 oldLabels = newLabels;
 it = it+1;
end
labelsCon = newLabels;

end