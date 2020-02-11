function y =actual(x)
    y = x.^2 + 2*x + 2 -2*(x+1).*log(1+x);
end