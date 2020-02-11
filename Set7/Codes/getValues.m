function [q,w,e,r] = getValues(x,y)
q = zeros(1,length(x));
w = zeros(1,length(x));
e = zeros(1,length(x));
r = zeros(1,length(x));
for i=2:length(x)-1
    q(i) = (x(i)-x(i-1))/6;
    w(i) = (x(i+1)-x(i-1))/3;
    e(i) = (x(i+1) - x(i))/6;
    r(i) = (y(i+1)-y(i))/(x(i+1)-x(i)) - (y(i)-y(i-1))/(x(i)-x(i-1));
end
end