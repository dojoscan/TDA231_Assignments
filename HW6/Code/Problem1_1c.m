close all;
X = load('hw6_p1b.mat');
points = X.X;
k = 2;
g = kMeansClustering3(k,points);
gscatter(points(:,1),points(:,2),g)