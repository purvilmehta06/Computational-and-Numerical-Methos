clear all ;
close all;
clc;

x0=0;
y0=-1;
x1=1;
y1=-1;
x2=2;
y2=7;
x = -8:0.01:8;
p = p2(x,x0,y0,x1,y1,x2,y2);
n0 = first(x0,y0,x1,y1)*(x-x0) + y0; 
n1 = n0 + second(x0,y0,x1,y1,x2,y2).*(x-x0).*(x-x1);
figure(1);
plot(x,p);hold on;
plot(x,n1);
grid;
legend('Lagrange Interpolation','Newton Derived Interpolation');
title('Comparision of Newton derived difference and Langrange Interpolation');
xlabel('x');ylabel('f(x)');

figure(2);
plot(x,p-n1);
title('Error of Newton derived difference and Langrange Interpolation');
xlabel('x');ylabel('Error Function');

