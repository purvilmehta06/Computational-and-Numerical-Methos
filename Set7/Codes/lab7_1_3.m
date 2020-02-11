close all;
clear all;
clc;

x = [-0.5,0,0.25,1];
y = [0.731531,1.000000,1.268400,1.718282];
m = [0,2.438,-1.749,0];
figure(1);
for i=2:length(x)
    c = getC(y(i-1),x(i),x(i-1),m(i-1));
    d = getD(y(i),x(i),x(i-1),m(i));
    t = x(i-1):0.01:x(i);
    s = (m(i-1)/(6*(x(i)-x(i-1))))*((x(i)-t).^3) + (m(i)/(6*(x(i)-x(i-1))))*((t-(x(i-1))).^3) + c*(x(i)-t) + d*(t-x(i-1));
    if(i==2)
    f  = s;
    else
    f = cat(2,f,s(2:length(s)));
    end
    plot(t,s);
    hold on;
end

t = x(1):0.01:x(length(x));
fx = exp(t) - t.^3;
plot(t,fx);
%ans2 = pwl2(x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4),2);
legend('Spline Interpolation [-0.5-0]','Spline Interpolation [0-0.25]','Spline Interpolation [0.25-1]','Actual Function');
xlabel('x');ylabel('f(x)');
grid;

figure(2);
plot(t,fx-f);
grid;
title('Error Between Spline Interpolation and Actual function');
xlabel('x');ylabel('y(x)');
