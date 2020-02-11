function y = trap(a,b,n)
    h = (b-a)/n;
    x = [a:h:b];
    fx = atan(1+x.^2);
    y= sum(fx) - fx(1)/2 - fx(length(fx))/2;
    y = y*h;
end