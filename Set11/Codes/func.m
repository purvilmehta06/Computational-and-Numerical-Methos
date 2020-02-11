function z = func(x)
    z = zeros(2, 1);
    z(1) = x(1).^2+4*x(2).^2-9;
    z(2) = 18*x(2)-14*x(1).^2+45;
end