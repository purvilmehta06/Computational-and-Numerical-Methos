close all; clear all; clc;

x0 = 0;
xn = 6;
y0 = 2;

steps = [0.2, 0.1, 0.05];

for steps_i=1:length(steps)
    h = steps(steps_i);
    x = x0:h:xn;
    y_euler = zeros(1, length(x));
    y_back = zeros(1, length(x));
    y_trap = zeros(1, length(x));
    y_henn = zeros(1, length(x));
    y_actual = x.^2+2*x+2-2*(x+1).*log(x+1);
    
    n = 1:length(x)-1;
    y_euler(1) = y0;
    y_back(1) = y0;
    y_trap(1) = y0;
    y_henn(1) = y0;
    
%     y_euler(2:end) = y0*(1-h).^n;
%     y_back(2:end) = y0*(1+h).^-n;
%     y_trap(2:end) = y0*((2-h)/(2+h)).^n;
%     
%     for xi=2:length(x)
%        y_henn(xi) = y_henn(xi-1) + (h/2)*(-y_henn(xi-1) -(1-h)*y_henn(xi-1));
%     end
    
    for xi=2:length(x)
       y_euler(xi) = y_euler(xi-1) + h*((y_euler(xi-1)+x(xi-1)^2-2)/(x(xi-1)+1));
       y_back(xi) = (y_back(xi-1)*x(xi)+y_back(xi-1)+h*(x(xi)^2-2))...
           /(x(xi)+1-h);
       y_trap(xi) = (y_trap(xi-1) + (h/2)*...
           ((y_euler(xi-1)+x(xi)^2-2)/(x(xi-1)+1) + (x(xi)^2-2)/(x(xi)+1)))...
           /(1-0.5*h*(x(xi)+1)^-1);
       y_henn(xi) = y_henn(xi-1) + (h/2)*((y_henn(xi-1)+x(xi-1)^2-2)/(x(xi-1)+1) + ...
           (y_henn(xi-1)*(x(xi-1)+1)+h*y_henn(xi-1)+(x(xi-1)+1)*x(xi)^2 + h*x(xi-1)^2-2*(x(xi-1)+1)-2*h)/((x(xi-1)+1)*(x(xi)+1)));
    end
    
    figure(steps_i);
    plot(x, y_euler, x, y_back, x, y_trap, x, y_henn, x, y_actual);
    legend('Eulers Method','Eulers Backward Method',...
        'Trapezoidal Method','Henns Method', 'Actual');
    grid on; xlabel('X'); ylabel('Y');
    title(strcat('h = ', num2str(h)));
    
    figure(steps_i+5);
    plot(x, abs(y_actual-y_euler), x, abs(y_actual-y_back),...
        x, abs(y_actual-y_trap), x, abs(y_actual-y_henn));
    legend('Eulers Method','Eulers Backward Method',...
        'Trapezoidal Method','Henns Method');
    grid on; xlabel('X'); ylabel('Y');
    title(strcat('Error for h = ', num2str(h)));
        
end