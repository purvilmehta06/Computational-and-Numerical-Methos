clear all; close all; clc;

t0 = 0; tn = 4;

%1, 1.5.1.9
y10 = 3; y20 = 1.9;
[t_h1, y1_h1, y2_h1] = runge_kutta(t0, tn, 0.01, y10, y20);
[t_h2, y1_h2, y2_h2] = runge_kutta(t0, tn, 0.005, y10, y20);

figure(1);
plot(t_h1, y1_h1, t_h2, y1_h2);
grid; xlabel('X'); ylabel('Y1');
legend('h = 0.01', 'h = 0.005');
title('Prey');

figure(2);
plot(t_h1, y2_h1, t_h2, y2_h2);
grid; xlabel('X'); ylabel('Y2');
legend('h = 0.01', 'h = 0.005');
title('Predator');

figure(3);
plot(y1_h1, y2_h1, y1_h2, y2_h2); 
grid; xlabel('Y1'); ylabel('Y2');
legend('h = 0.01', 'h = 0.005');
title('Prey-Predator');