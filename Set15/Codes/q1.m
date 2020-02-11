clear all; close all; clc;

x0 = 0;
xn = 10;
y0 = 1;
steps = [0.1, 0.05];

for steps_i = 1:length(steps)
    h = steps(steps_i);
    
    x = x0:h:xn;
    y_first = zeros(1, length(x));
    y_second = zeros(1, length(x));
    y_actual = sin(x) + cos(x);
    
    y_first(1) = y0; y_second = y0;
    
    for xi=2:length(x)
       y_first(xi) = y_first(xi-1) + h*(-y_first(xi-1)+2*cos(x(xi-1)));
       y_second(xi) = y_second(xi-1) + h*(-y_second(xi-1)+2*cos(x(xi-1)))...
           +(h^2/2)*(y_second(xi-1)-2*(cos(x(xi-1))+sin(x(xi-1))));
    end
    
    figure(steps_i);
    plot(x, y_first, x, y_second, x, y_actual);
    legend('First Order','Second Order', 'Actual');
    grid on; xlabel('X'); ylabel('Y');
    title(strcat('h = ', num2str(h)));
    
    figure(steps_i+5);
    plot(x, abs(y_actual-y_first), x, abs(y_actual-y_second));
    legend('First Order','Second Order');
    grid on; xlabel('X'); ylabel('Y');
    title(strcat('Error for h = ', num2str(h)));
    
end