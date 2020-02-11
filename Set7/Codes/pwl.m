function pwl(x0,y0,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,i)

y=0:0.01:x6;
x = x0:0.01:x1;
fx = p1(x,x0,y0,x1,y1);
x = x1:0.01:x2;
fx1 = p1(x,x1,y1,x2,y2);
x = x2:0.01:x3;
fx2 = p1(x,x2,y2,x3,y3);
x = x3:0.01:x4;
fx3 = p1(x,x3,y3,x4,y4);
x = x4:0.01:x5;
fx4 = p1(x,x4,y4,x5,y5);
x = x5:0.01:x6;
fx5 = p1(x,x5,y5,x6,y6);
ans  = cat(2,fx,fx1(2:length(fx1)),fx2(2:length(fx2)),fx3(2:length(fx3)),fx4(2:length(fx4)),fx5(2:length(fx5)));
figure(i);
plot(y,ans);
end