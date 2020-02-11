function [t, y1, y2] = runge_kutta(t0, tn, dt, y10, y20)

t = t0:dt:tn;
y1 = zeros(1, length(t));
y2 = zeros(1, length(t));
y1(1) = y10;
y2(1) = y20;

for i=2:length(t)
   [y1_v1, y2_v1] = f(t(i-1), y1(i-1), y2(i-1));
   [y1_v2, y2_v2] = f(t(i-1)+dt/2, y1(i-1)+(dt/2)*y1_v1, ...
                                     y2(i-1)+(dt/2)*y2_v1);
   [y1_v3, y2_v3] = f(t(i-1)+dt/2, y1(i-1)+(dt/2)*y1_v2, ...
                                     y2(i-1)+(dt/2)*y2_v2);
   [y1_v4, y2_v4] = f(t(i), y1(i-1)+dt*y1_v3, ... 
                              y2(i-1)+dt*y2_v3);
   
   y1(i) = y1(i-1) + (dt/6)*(y1_v1 + 2*y1_v2 + 2*y1_v3 + y1_v4);
   y2(i) = y2(i-1) + (dt/6)*(y2_v1 + 2*y2_v2 + 2*y2_v3 + y2_v4);
end
 
end