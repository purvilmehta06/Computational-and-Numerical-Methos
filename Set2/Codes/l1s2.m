clear all; close all; clc;

x = -pi:0.01:pi;

fx = cos(x);
p1 = ones(length(x));
p2 = 1 - x.*x/2 ;
p3 = 1 - x.*x/2 ;

figure(1);
plot(x, fx, x, p1, x, p2, x, p3);
grid; xlabel('x'); ylabel('f(x)');
xlim([-pi,pi]);ylim([-4,1.5])
legend('f(x) = cos(x)', 'p_1(x)', 'p_2(x)', 'p_3(x)');