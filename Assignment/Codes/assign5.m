clear all; close all; clc;

t0 = 0; tn = 50; dt = 0.001;

phi0 = 0.95; si0 = 0;
[t, lin_phi_1, lin_si_1] = runge_kutta(t0, tn, dt, phi0, si0, 0);
[t, nonlin_phi_1, nonlin_si_1] = runge_kutta(t0, tn, dt, phi0, si0, 1);

phi0 = 1.05; si0 = 0;
[t, lin_phi_2, lin_si_2] = runge_kutta(t0, tn, dt, phi0, si0, 0);
[t, nonlin_phi_2, nonlin_si_2] = runge_kutta(t0, tn, dt, phi0, si0, 1);

figure(1);
plot(lin_phi_1, lin_si_1, lin_phi_2, lin_si_2);
grid; xlabel('\phi'); ylabel('\psi'); axis('equal');
xlim([-1.5, 1.5]); ylim([-1.5, 1.5]);
legend('( \phi , \psi ) = (0.95, 0)', '( \phi , \psi ) = (1.05, 0)');
title('Assuming Linearity');

figure(2);
plot(nonlin_phi_1, nonlin_si_1, nonlin_phi_2, nonlin_si_2);
grid; xlabel('\phi'); ylabel('\psi'); axis('equal');
xlim([-1, 2]); ylim([-1, 1]); 
legend('( \phi , \psi ) = (0.95, 0)', '( \phi , \psi ) = (1.05, 0)');
title('Assuming Nonlinear Behaviour');

figure(3);
plot(lin_phi_1, lin_si_1, 'b', ...
     nonlin_phi_2, nonlin_si_2, 'r', ...
     nonlin_phi_1, nonlin_si_1, 'b', ...
     lin_phi_2, lin_si_2, 'r');
grid; xlabel('\phi'); ylabel('\psi'); axis('equal');
xlim([-1.5, 2]); ylim([-1.5, 1.5]); 
legend('( \phi , \psi ) = (0.95, 0)', '( \phi , \psi ) = (1.05, 0)');