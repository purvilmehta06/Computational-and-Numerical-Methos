clear all;
close all;
clc;

original = 0.5;
x = 1;
h=[0.1, 0.05, 0.025, 0.0125, 0.00625];
for i=1:length(h)
    tn(i) = fwdDiff(x, h(i));
    tn2(i) = ctrDiff(x, h(i));
    error(i) = tn(i)-original;
    error_2(i) = tn2(i)-original;0
end
v = [1:length(h)];
t = table(h',tn', error', tn2', error_2');
t.Properties.VariableNames = {'h' 'Dh' 'Error_fwd', 'Dhc','Error_cnt'};
disp(t);