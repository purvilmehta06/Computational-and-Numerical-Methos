function [t, phi, si] = runge_kutta(t0, tn, dt, phi0, si0, eps)

t = t0:dt:tn;
phi = zeros(1, length(t));
si = zeros(1, length(t));
phi(1) = phi0;
si(1) = si0;

for i=2:length(t)
   [phi_v1, si_v1] = f(t(i-1), phi(i-1), ... 
                                si(i-1), eps);
   [phi_v2, si_v2] = f(t(i-1)+dt/2, phi(i-1)+(dt/2)*phi_v1, ...
                                     si(i-1)+(dt/2)*si_v1, eps);
   [phi_v3, si_v3] = f(t(i-1)+dt/2, phi(i-1)+(dt/2)*phi_v2, ...
                                     si(i-1)+(dt/2)*si_v2, eps);
   [phi_v4, si_v4] = f(t(i), phi(i-1)+dt*phi_v3, ... 
                              si(i-1)+dt*si_v3, eps);
   
   phi(i) = phi(i-1) + (dt/6)*(phi_v1 + 2*phi_v2 + 2*phi_v3 + phi_v4);
   si(i) = si(i-1) + (dt/6)*(si_v1 + 2*si_v2 + 2*si_v3 + si_v4);
end
 
end