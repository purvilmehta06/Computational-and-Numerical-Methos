clear all; close all; clc;

x0 = 0; xn = 1;
h = 1/40;
y0 = 0;
yn = log(2);

x = x0:h:xn;

p = -2*x./(1+x.^2);
q = ones(1, length(x));
r = -log(1+x.^2) + 2./(1+x.^2);

A = zeros(length(x)-2, length(x)-2);
Y = zeros(1, length(x)-2);
C = zeros(length(x)-2, 1);

A(1, 1) = (2 + h^2);
A(1, 2) = (h/2)*p(2)-1;
A(length(x)-2, length(x)-3) = -(h/2)*p(length(x)-1) - 1;
A(length(x)-2, length(x)-2) = (2+h^2);
C(1) = -h^2 * r(2) + (1+(h/2)*p(2)) * y0;
C(length(x)-2) = -h^2 * r(length(x)-1) - ((h/2) * p(length(x)-1) - 1)*yn;

for j=2:length(x)-3
    A(j, j-1) = -(h/2) * p(j+1) - 1;
    A(j, j) = (2 + h^2);
    A(j, j+1) = (h/2) * p(j+1) - 1;
    C(j) = -h^2 * r(j+1);
end

Y = inv(A)*C;
Y = [y0; Y; yn];

figure(1);
plot(x, Y, x, log(1+x.^2)); grid;
title('2 point boundary method');
legend('Approximated', 'Actual');
xlabel('X'); ylabel('Y');

figure(2);
plot(x, abs(Y'-log(1+x.^2))); grid;
title('Error');
xlabel('X'); ylabel('Y');

k = 1;
for i=1:4:41
   req_x(k) = x(i);
   req_y(k) = Y(i);
   k = k+1;
end

table_data = table(req_x', req_y')
