close all;
clear all;
clc;

x = [0,1,2,2.5,3,3.5,4];
y = [2.5,1/2,1/2,1.5,1.5,1.125,0];
m = [0,1.84,4.61,-7.34,0.76,-4.74,0];
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
pwl(x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4),x(5),y(5),x(6),y(6),x(7),y(7),1);
legend('Spline Interpolation [0-1]','Spline Interpolation [1-2]','Spline Interpolation [2-2.5]','Spline Interpolation [2.5-3]','Spline Interpolation [3-3.5]','Spline Interpolation [3.5-4]','Peicewise LI');
xlabel('x');ylabel('f(x)');
grid;

