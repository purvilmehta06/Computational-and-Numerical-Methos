function y = find_func(h,a,b,y0)
    x = a:h:b; 
    y = zeros(1,length(x));
    y(1) = y0;
    for i=2:length(x)
        y(i) = y(i-1) + h*derivative(x(i-1),y(i-1));
    end
end