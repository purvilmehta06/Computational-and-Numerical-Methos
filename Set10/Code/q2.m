close all;clc;clear all;
x = -100*[[1 1 1]];
i=1;
actual = [1,2,-1];
p = [9 1 1; 2 10 3; 3 4 11];
b = [10; 19; 0];
eps = 10^10;
error = [sqrt(sum((actual-x).^2))];

i = 1;
while(eps > 10^-5)
    x(i+1, 1) = (1/p(1, 1)) * (b(1)-p(1, 2)*x(i, 2)-p(1, 3)*x(i, 3));
    
    x(i+1, 2) = (1/p(2, 2)) * (b(2)-p(2, 1)*x(i+1, 1)-p(2, 3)*x(i, 3));
    
    x(i+1, 3) = (1/p(3, 3)) * (b(3)-p(3, 1)*x(i+1, 1)-p(3, 2)*x(i+1, 2));
    eps = sqrt(sum((x(i+1)-x(i)).^2));
    i = i +1;
    error = [error,sqrt(sum((actual-x(i,:)).^2))];
end

itr = [1:i];
table_data = table(itr',x,error');