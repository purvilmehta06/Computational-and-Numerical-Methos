clear all; close all; clc;

x0 = 0; y0 = 0;
xn = 5;
steps = [0.2, 0.1, 0.05];

for steps_i=1:length(steps)
    h = steps(steps_i);
    x = x0:h:xn;
    actual = x.^1.1;

    second = zeros(1, length(x));
    second(1) = y0;

    for i=2:length(x)
       v1 = f(x(i-1), second(i-1));
       v2 = f(x(i), second(i-1)+ h*v1);

       second(i) = second(i-1) + (h/2)*(v1 + v2);
    end

    fourth = zeros(1, length(x));
    fourth(1) = y0;

    for i=2:length(x)
       v1 = f(x(i-1), fourth(i-1));
       v2 = f(x(i-1)+h/2, fourth(i-1) + (h/2)*v1);
       v3 = f(x(i-1)+h/2, fourth(i-1) + (h/2)*v2);
       v4 = f(x(i), fourth(i-1)+ h*v3);

       fourth(i) = fourth(i-1) + (h/6)*(v1 + 2*v2 + 2*v3 + v4);
    end

    figure(steps_i*10+1);
    plot(x, second, x, fourth, x, actual); grid;
    xlabel('X'); ylabel('Y'); title(strcat('h = ', num2str(h)));
    legend('2^{nd} Order RK', '4^{th} Order RK', 'Actual');

    figure(steps_i*10+2);
    plot(x, abs((actual-fourth)), ...
        x, abs((actual-second))); grid;
    xlabel('X'); ylabel('Abs Error'); title(strcat('Error for h = ', num2str(h)));
    legend('4^{th} Order RK', '2^{nd} Order RK');

end