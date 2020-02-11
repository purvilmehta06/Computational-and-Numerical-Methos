function y = third(x0,y0,x1,y1,x2,y2,x3,y3)
y = (second(x1,y1,x2,y2,x3,y3)-second(x0,y0,x1,y1,x2,y2))/(x3-x0);
end