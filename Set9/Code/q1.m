close all;
clc;
clear all;

y= [0; 3; 2];
x = [1 2 3;2 2 3;-1 -3 0];

ans = inv(x)*y

y = [1;1;-1;-1];
x = [4 3 2 1;3 4 3 2;2 3 4 3;1 2 3 4];

ans1 = inv(x)*y

fans = inv([1 1 -1;1 2 -2;-2 1 1])
