clear all; close all; clc;

dx = 0.01;

st = 0.01;
en = 4;
x = st:dx:en;

figure(1);
plot(x, log(x)); hold on;
plot(x, exp(x)); hold on;
plot(x, x); hold on;
xlim([st, 4]); ylim([-1, 3]);
grid; xlabel('X'); ylabel('F(x)');
legend('logx', 'expx', 'x');

x = -4:dx:4;
figure(2);
plot(x, exp(x)); hold on;
plot(x, exp(-x)); hold on;
xlim([-4, 4]); ylim([0, 8]);
grid; xlabel('X'); ylabel('F(x)');
legend('e^x', 'e^{-x}');
