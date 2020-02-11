close all;
clc;
clear all;


h = [0.2 0.1 0.05];
a = 0;
b = 6;
y0 = 2;
y = cell(1,length(h)+1);
x = cell(1,length(h)+1);
for i=1:length(h)
    y{i} = find_func(h(i),a,b,y0);
    x{i} = [a:h(i):b];
   %lot(x{i},y{i});
end

x{length(h)+1} = [a:0.01:b];
y{length(h)+1} = actual(x{length(h)+1});
figure(5);
for i=1:length(h)+1
    plot(x{i},y{i});
    hold on;
end
legend('h = 0.2','h = 0.1','h = 0.05','Actual Function');
grid;
title('Eulers Method');
xlabel('x');ylabel('y');


for i=1:length(h)
    figure(i);
    plot(x{i},y{i}-actual(x{i}));
    grid;
    title(strcat('Error Plot for h = ', num2str(h(i))));
    xlabel('x');ylabel('y');
end\