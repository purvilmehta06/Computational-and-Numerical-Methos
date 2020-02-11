clear all; close all; clc;

x = 0:0.01:100;
y = x.*log(x);
figure(1);
plot(x, y);
grid; title('xln(x)');
xlabel('x');