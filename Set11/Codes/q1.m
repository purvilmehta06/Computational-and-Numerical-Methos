clear all;
close all;
clc;

x = -3:0.01:3;
y1 = sqrt((1/4)*(9-x.^2));
y2 = -y1;

y3 = (14*x.^2-45)/18;

figure(1);

plot(x, y3, 'b', x, y1, 'r', x, y2, 'r');
title('Plot of f(x, y) and g(x, y) on X-Y plane');
xlabel('X-axis'); ylabel('Y-axis');
grid on; legend('g(x, y)', 'f(x, y)');

%%%%%%%%%%%%%%
x = [1; -1];
xs = [x];
eps = 10^10;

while(eps > 10^-5)
    prev = x;
    x = x - inv(frechet(x))*func(x);
    xs = [xs, x];
    eps = sqrt(sum((x-prev).^2));
end

table_data = table(xs')