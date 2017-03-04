X = table2array(readtable('dataset0.txt'));
X = X(:,1:12);
covX = cov(X);
corX = corr(X);

noObs = size(X,1);
minX = min(X);
rangeX = max(X) - minX;
Y = zeros(size(X));
for i = 1:noObs
   Y(i,:) = (X(i,:)-minX)./rangeX;
end
covY = cov(Y);
corY = corr(Y);

figure(1)
subplot(2,2,1)
imagesc(covX)
title('Covariance X')
subplot(2,2,2)
imagesc(corX)
title('Correlation X')
subplot(2,2,3)
imagesc(covY)
title('Covariance Y')
subplot(2,2,4)
imagesc(corY)
title('Correlation Y')

[minCol,indCol] = min(corY);
[minCorr,indRow] = min(minCol);
indCol = indCol(indRow);
figure(2)
scatter(Y(:,indCol),Y(:,indRow),10,'b','filled')
title(['Min. Correlation in Y: ' num2str(minCorr) ' ,features ' ...
    num2str(indCol) ' & ' num2str(indRow)])
xlabel(['Feature ' num2str(indCol)])
ylabel(['Feature ' num2str(indRow)])