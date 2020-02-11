clear all; close all; clc;

dx = 0.01;
x = -4:dx:4;

y0 = 1;
a = 1;
mu = 0;
gauss = y0*exp(-(a*(x-mu).^2));
lorrentz = (1+(a*(x-mu).^2)).^-1;


figure(1);
plot(x, gauss, x, lorrentz);
title('Gaussian Curve v/s Lorrentz Approx.');
legend('Gaussian Curve', 'Lorrentz Approx.');
grid; xlabel('x'); ylabel('f(x)');


figure(2);
plot(x, gauss-lorrentz);
title('Difference between Gaussian Curve & Lorrentz Approx.');
grid; xlabel('x'); ylabel('f(x)');