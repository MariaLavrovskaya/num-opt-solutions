clear all; close all;

f = @(x) x.^2; %objective
f1 = @(x) 1-x; %inequality constraint
L = @(x,lambda) f(x) + lambda.*f1(x); %lagrangian
g = @(lambda) -1/4*lambda.^2 + lambda; %dual function

%% 
[X,Lambda] = meshgrid((-1:0.01:1), (-0.5:0.01:1.5));
alpha = 3; %scale x
beta = 4; %scale lambda

%% 

figure,contourf(alpha*X, beta*Lambda, L(alpha*X, beta*Lambda)); xlabel('x'); ylabel('\lambda'); colorbar;

%% We sliced along each lambda and took the inf wrt to x

figure,surfc(alpha*X,beta*Lambda, L(alpha*X, beta*Lambda), 'EdgeColor', 'none');  xlabel('x'); ylabel('\lambda'); colorbar;
%This is where the dual function lives on the Lagrangian. The line that is
%tracing the path how the dual function corresponds to the Lagrangian.
%Not a surprise. Strong duality implies zero duality gap
hold on; plot3(beta*(-0.5:0.01:1.5)/2, beta*(-0.5:0.01:1.5), g(beta*(-0.5:0.01:1.5)), 'LineWidth', 2, 'Color', 'm')
% hold on; plot3(0,0,g(0), 'yx', 'MarkerSize',10) %unconstraint min
hold on; plot3(1,2,g(2), 'go', 'MarkerSize',15) %constraint min

saveas(gcf,'qp-demonstration.png')