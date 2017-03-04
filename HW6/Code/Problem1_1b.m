close all

X = load('hw6_p1a.mat');
X = X.X;
k = 2;
[labelsCon,labels2,~] = kMeansClustering2(k,X);
XSame = X(labelsCon==labels2,:);
labelsSame = labelsCon(labelsCon==labels2);
XDiff = X(labelsCon~=labels2,:);
labelSame = labelsCon(labelsCon == labels2);
labelDiff = labelsCon(labelsCon~=labels2);
labelsDiff = labelsCon(labelsCon~=labels2);
labelsCat = vertcat(labelsSame,labelsDiff)
colours = 'rgbkymc';
figure(1)
G = vertcat(ones(size(XSame,1),1),3*ones(size(XDiff,1),1));
gscatter(vertcat(XSame(:,1),XDiff(:,1)),vertcat(XSame(:,2),XDiff(:,2)),G.*labelsCat);
legend('Class A', 'Class B', 'Changed B->A', 'Changed A->B')
figure(2)
gscatter(vertcat(XSame(:,1),XDiff(:,1)),vertcat(XSame(:,2),XDiff(:,2)),labelsCat);
%scatter(XDiff(:,1),XDiff(:,2),[],labelsDiff)
legend('Class A', 'Class B', 'Changed A->B', 'Changed B->A')