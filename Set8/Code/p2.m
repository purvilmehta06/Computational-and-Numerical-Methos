function y = p2(x,x0,y0,x1,y1,x2,y2)
y = (((x-x1).*(x-x2))/((x0-x1)*(x0-x2)))*y0 + (((x-x0).*(x-x2))/((x1-x0)*(x1-x2)))*y1 + (((x-x0).*(x-x1))/((x2-x1)*(x2-x0)))*y2 ;
end