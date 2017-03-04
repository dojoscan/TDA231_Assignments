points = rand(100,2);
k = 5;
[labels,clusters] = kMeansClustering(k,points);
colours = 'rgbkymc';
figure(1)
scatter(points(:,1),points(:,2),[],labels,'filled')
hold on
scatter(clusters(:,1),clusters(:,2),100,1:k,'filled','s')