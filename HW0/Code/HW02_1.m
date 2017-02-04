mu = [1;1];
sigma = [0.1,-0.05;-0.05,0.2];
noPoints = 1000;
points = mvnrnd(mu,sigma,noPoints)';

% Level sets, solved using Mathematica
syms x
eq1_p = (1/10)*(sqrt(35)*sqrt(-5*x^2+10*x-4)-5*x+15);
eq1_m = (1/10)*(-sqrt(35)*sqrt(-5*x^2+10*x-4)-5*x+15);
eq2_p = (1/10)*(sqrt(35)*sqrt(-5*x^2+10*x-3)-5*x+15);
eq2_m = (1/10)*(-sqrt(35)*sqrt(-5*x^2+10*x-3)-5*x+15);
eq3_p = (1/10)*(sqrt(35)*sqrt(-5*x^2+10*x-2)-5*x+15);
eq3_m = (1/10)*(-sqrt(35)*sqrt(-5*x^2+10*x-2)-5*x+15);

% Compute function & no. of points
r = 3;
levelsR3 = Level(points,r,mu,sigma);
lessZero = levelsR3<0;
noPointsOut = noPoints-sum(lessZero);

figure(1)
colours = 'kb';
fplot(eq1_p,'r')
hold on
fplot(eq1_m,'r') 
fplot(eq2_p,'g')
fplot(eq2_m,'g')
fplot(eq3_p,'c')
fplot(eq3_m,'c')
for i = 1:noPoints
    scatter(points(1,i),points(2,i),10,colours(lessZero(i)+1),'filled')
end
title(['Levels sets, ' num2str(noPointsOut) ' points lying outside f(x, 3) = 0'])

figure(2)
scatter3(points(1,:),points(2,:),levelsR3)
xlabel('x_1');
ylabel('x_2');
zlabel('f(x,3)');

