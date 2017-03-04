points = [2,2;4,4;4,0;0,0;2,0;0,2];
labels = [1,1,1,-1,-1,-1];
linepoints = [-1,4;4,-1];

figure
gscatter(points(:,1),points(:,2),labels,'br')
hold on
xlabel('x_1')
ylabel('x_2')
plot(linepoints(:,1),linepoints(:,2))
axis([-1 5 -1 5])
 
 



