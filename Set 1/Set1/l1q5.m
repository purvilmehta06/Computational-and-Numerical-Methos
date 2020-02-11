clear all; close all; clc;

x = -4:0.01:4;

figure(1);
for a = 12:-4:0
   y = -2*a + 12*x.*x;
   plot(x, y); hold on;
   xlim([-3.5, 3.5]);
end
grid; legend('a = 12', 'a = 8', 'a = 4', 'a = 0');
title('{d^2y}/{dx^2} = -2a + 12x^2');
