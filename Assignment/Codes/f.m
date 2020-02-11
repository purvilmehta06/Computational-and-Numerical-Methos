function [phi_dot, si_dot] = f(t, phi, si, eps)

A = 0.03;
B = 0.03;
C = 1;
D = -1;

z = zeros(1, 2);
phi_dot = si;
si_dot = -eps*(A*phi + B*si)*si ...
    -(C*phi + eps*D*phi^2);

end