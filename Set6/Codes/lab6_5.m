clear all ;
close all;
clc;

x0=0;y0=2.5;
x1=1;y1=0.5;
x2=2;y2=0.5;
x3=2.5;y3=1.5;
x4=3;y4=1.5;
x5=3.5;y5=1.125;
x6=4;y6=0;
y=0:0.01:x6;
x = x0:0.01:x1;
fx = p1(x,x0,y0,x1,y1);
x = x1:0.01:x2;
fx1 = p1(x,x1,y1,x2,y2);
x = x2:0.01:x3;
fx2 = p1(x,x2,y2,x3,y3);
x = x3:0.01:x4;
fx3 = p1(x,x3,y3,x4,y4);
x = x4:0.01:x5;
fx4 = p1(x,x4,y4,x5,y5);
x = x5:0.01:x6;
fx5 = p1(x,x5,y5,x6,y6);
ans  = cat(2,fx,fx1(2:length(fx1)),fx2(2:length(fx2)),fx3(2:length(fx3)),fx4(2:length(fx4)),fx5(2:length(fx5)));
figure(1);
plot(y,ans);
grid;
title('Piecewise linear interpolation');
xlabel('x');ylabel('f(x)');

x = x0:0.01:x2;
fx = p2(x,x0,y0,x1,y1,x2,y2);
n_1 = first(x0,y0,x1,y1)*(x-x0) + y0; 
n1 = n_1 + second(x0,y0,x1,y1,x2,y2).*(x-x0).*(x-x1);
figure(2);plot(x,fx);hold on;plot(x,n1);grid;
legend('Lagrange Interpolation','Newton Derived Second order Difference');
title('Quadratic Interpolation between [0-2]');
xlabel('x');ylabel('f(x)');
figure(3);
plot(x,fx-n1);grid;
title('Difference of Lagrange and Newton IP between [0-2]');
xlabel('x');ylabel('f(x)');

x = x2:0.01:x4;
fx1 = p2(x,x2,y2,x3,y3,x4,y4);
n_1 = first(x2,y2,x3,y3)*(x-x2) + y2; 
n2 = n_1 + second(x2,y2,x3,y3,x4,y4).*(x-x2).*(x-x3);
figure(4);plot(x,fx1);hold on;plot(x,n2);grid;
legend('Lagrange Interpolation','Newton Derived Second order Difference');
title('Quadratic Interpolation between [2-3]');
xlabel('x');ylabel('f(x)');
figure(5);
plot(x,fx1-n2);grid;
title('Difference of Lagrange and Newton IP between [2-3]');

x = x4:0.01:x6;
fx2 = p2(x,x4,y4,x5,y5,x6,y6);
n_1 = first(x4,y4,x5,y5)*(x-x4) + y4; 
n3 = n_1 + second(x4,y4,x5,y5,x6,y6).*(x-x4).*(x-x5);
figure(6);plot(x,fx2);hold on;plot(x,n3);grid;
legend('Lagrange Interpolation','Newton Derived Second order Difference');
title('Quadratic Interpolation between [3-4]');
xlabel('x');ylabel('f(x)');
figure(7);
plot(x,fx2-n3);
grid;
title('Difference of Lagrange and Newton IP between [3-4]');

ans  = cat(2,fx,fx1(2:length(fx1)),fx2(2:length(fx2)));
ans1 = cat(2,n1,n2(2:length(n2)),n3(2:length(n3)));
figure(8);
plot(y,ans);hold on;plot(y,ans1);
grid;
legend('Lagrange Interpolation','Newton Derived Second order Difference');
title('Quadratic Interpolation');
xlabel('x');ylabel('f(x)');
figure(9);
plot(y,ans-ans1);
title('Difference of Lagrange and Newton IP');
grid;


