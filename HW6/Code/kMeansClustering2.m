function [labelsCon,labels2,clusters] = kMeansClustering2(k,points)

[nPoints,nDim] = size(points);
maxVect = max(points);
minVect = min(points);
diffVect = maxVect-minVect;
clusters = (rand(k,nDim).*diffVect)+minVect;
disagree = 100;
oldLabels = ones(nPoints,1);
it = 1;

while disagree > 0 
 distMat = pdist2(points,clusters);
 [~,newLabels] = min(distMat,[],2);
 if it == 2
    labels2 = newLabels; 
 end
 for i = 1:k
    clusters(i,:) = mean(points((newLabels==i),:)); 
 end
 disagree = nnz(newLabels-oldLabels);
 oldLabels = newLabels;
 it = it+1;
end
labelsCon = newLabels;

end