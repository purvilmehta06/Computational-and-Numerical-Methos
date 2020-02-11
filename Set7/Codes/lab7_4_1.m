clear all;
close all;
clc;
x = [0,1,2];
y = [1,1,5];
m = [0,6,0];
x1 = x(1):0.01:x(length(x));
n_1 = first(x(1),y(1),x(2),y(2))*(x1-x(1)) + y(1); 
n_2 = n_1 + second(x(1),y(1),x(2),y(2),x(3),y(3)).*(x1-x(1)).*(x1-x(2));

plot(x1,n_2);
grid;
title('Quadratic Newton Interpolation');
xlabel('x');
ylabel('f(x)');
figure(2);
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
grid;
legend('Spline Interpolation [0-1]','Spline Interpolation [1-2]');
xlabel('x');ylabel('f(x)');
title('Spline Interpolation');