function y = second(x0,y0,x1,y1,x2,y2)
y = (first(x1,y1,x2,y2)-first(x0,y0,x1,y1))/(x2-x0);
end