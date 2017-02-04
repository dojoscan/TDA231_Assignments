function [labels,clusters] = kMeansClustering(k,points)

[nPoints,nDim] = size(points);
maxVect = max(points);
minVect = min(points);
diffVect = maxVect-minVect;
clusters = (rand(k,nDim).*diffVect)+minVect;
disagree = 100;
oldLabels = ones(nPoints,1);

while disagree > 0 
 distMat = pdist2(points,clusters);
 [~,newLabels] = min(distMat,[],2);
 for i = 1:k
    clusters(i,:) = mean(points((newLabels==i),:)); 
 end
 disagree = nnz(newLabels-oldLabels);
 oldLabels = newLabels;
end

labels = newLabels;

end