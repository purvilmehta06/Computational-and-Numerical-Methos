clear all; close all; clc;

dx = 0.01;
x = -pi:dx:pi;

figure(1);
plot(x, sin(x/2)); hold on;
plot(x, sin(x), 'r'); hold on;
plot(x, sin(2*x), 'b'); hold on;
grid; title('x vs sin(kx)');
xlabel('x'); ylabel('sin(kx)');
legend('k = 0.5', 'k = 1', 'k = 2');

figure(2);
plot(x, sin(x), x, (sin(x)).^2);
grid; title('sin^2 x v/s sin x');
ylim([-1.5, 1.5]); xlim([-pi, pi]);xlabel('x');
legend('sin(x)', 'sin^2 (x)');