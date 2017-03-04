clear all; clc;
addpath('tSNE_matlab')
load('medium_100_10k.mat')
k = 10;
clusterIdx = kmeans(wordembeddings,k, 'MaxIter', 10000000);
noPoints = size(wordembeddings,1);
noPicks = 1000;
chosenPointsIdx = randperm(noPoints,noPicks);
points = wordembeddings(chosenPointsIdx,:);
pointsClusterIdx = clusterIdx(chosenPointsIdx);
TSNE = tsne(points, pointsClusterIdx, 2, size(wordembeddings,2), 30);
figure
%scatter3(TSNE(:,1),TSNE(:,2),TSNE(:,3),10,pointsClusterIdx,'filled')
gscatter(TSNE(:,1),TSNE(:,2),pointsClusterIdx)

