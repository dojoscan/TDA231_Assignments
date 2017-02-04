X = load('hw6_p1a.mat');
X = X.X;
k = 2;
[labelsCon,labels2,~] = kMeansClustering2(k,X);
XSame = X(labelsCon==labels2,:);
labelsSame = labelsCon(labelsCon==labels2);
XDiff = X(labelsCon~=labels2,:);
labelsDiff = labelsCon(labelsCon~=labels2);
colours = 'rgbkymc';
figure(1)
scatter(XSame(:,1),XSame(:,2),[],labelsSame,'filled')
hold on
scatter(XDiff(:,1),XDiff(:,2),[],labelsDiff)