close all;clc;clear all;
%%%%%%%jacob

x = [-100; -100; -100];
i=1;
actual = [1;2;-1];
p = [0 1 1; 2 0 3; 3 4 0];

b = [10; 19; 0];

c = [9 0 0; 0 10 0; 0 0 11];
eps = 10^10;
error = [];
y = [];
while(eps > 10^-5)
    y = [y,x];
    prev =x;
    x = inv(c)*(b-p*x);
    eps = sqrt(sum((x-prev).^2));
    error = [error,sqrt(sum((actual-prev).^2))];
    i =i+1;
end
itr = [1:i-1];
table_data = table(itr',y',error');


