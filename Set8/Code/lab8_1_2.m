close all ;
clear all;
clc;

x = [0 1 2 3 4 5 6];
y = [2.0000 2.1592 3.1697 5.4332 9.1411 14.406 21.303];
xx = x(1):0.01:x(length(x));
figure(1);
plot(xx,spline(x,y,xx));
grid on;
title('Spline Interpolation');
xlabel('x');ylabel('f(x)');

x = [-2,-1,0];
y = [-15,-8,-3];
xx = x(1):0.01:x(length(x));
figure(2);
plot(xx,spline(x,y,xx));
hold on;
plot(xx,p2(xx,x(1),y(1),x(2),y(2),x(3),y(3)));
grid on;
legend('Spline Interpolation','Quadratic Lagrange Interpolation');
title('Comarision between Quadratic Lagrange and Spline Interpolation');
xlabel('x');ylabel('f(x)');

figure(3);
plot(xx,spline(x,y,xx)-p2(xx,x(1),y(1),x(2),y(2),x(3),y(3)));
title('Error between two methods');
xlabel('x');ylabel('f(x)');grid;