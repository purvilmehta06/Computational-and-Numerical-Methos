function [z1, z2] = f(t, y1, y2)

A = 4;
B = 0.5;
C = 3;
D = 1/3;

z = zeros(1, 2);
z1 = A*y1*(1-B*y2);
z2 = C*y2*(D*y1-1);

end