load('dataset2.mat')
scatter3(x(:,1),x(:,2),x(:,3),5,horzcat(sign(y+1),(sign(y+1)-1).^2,zeros(size(y,1),1)))
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')