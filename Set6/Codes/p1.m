function y = p1(x,x0,y0,x1,y1)
y = ((x-x1)/(x0-x1))*y0 + ((x-x0)/(x1-x0))*y1;
end