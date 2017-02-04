function [mu, sigma] = sge(x)
%
% SGE Mean and variance estimator for spherical Gaussian distribution                               
%
% x     : Data matrix of size n x p where each row represents a 
%         p-dimensional data point e.g. 
%            x = [2 1;
%                 3 7;
%                 4 5 ] is a dataset having 3 samples each
%                 having two co-ordinates.
%
% mu    : Estimated mean of the dataset [mu_1 mu_2 ... mu_p] 
% sigma : Estimated standard deviation of the dataset (number)                 
%

% Calculate mu
mu = mean(x);

% Calculate sigma
n = size(x,1);
muRep = repmat(mu,n,1);
diff = x-muRep;
sigma = sum(sum(diff.^2),2)/n;

% Plot points
figure(1)
scatter(x(:,1),x(:,2),10,'b','filled')
hold on

distVec = sqrt(sum((x-muRep).^2,2));
fracOut = zeros(3,1);

% Plot circles
plotCol = 'rbg';
for k = 1:3
    viscircles(mu,k*sigma,'Color',plotCol(k))
    fracOut(k) = (sum(distVec>(k*sigma)))/n;  
end
for k = 1:3
     text(0+mu(1)+0.5,k*sigma+mu(2),['k = ', num2str(k), ' ,fracOut = ', num2str(fracOut(k))])
end
xlabel('x_0')
ylabel('x_1')


