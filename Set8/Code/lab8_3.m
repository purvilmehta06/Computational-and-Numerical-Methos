clear all;
close all;
clc;

a = 0;
b=10;
%original = atan(5-pi) + atan(pi);
n=[2 4 8 16 32 64 128 256 512];
for i=1:length(n)
    tn(i) = trap(a,b,n(i));
    sim(i) = simp(a,b,n(i));
end
v = [1:length(n)];
t = table(n',tn',sim');
t.Properties.VariableNames = {'n' 'Tn' 'Sn' }
figure(1);
x = a:0.01:b;
fx = atan(1+x.^2);
plot(x,fx);
xlim([a,b]);
grid;