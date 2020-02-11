function z = frechet(x)
    z = zeros(2, 2);
    z(1, 1) = 2*x(1);
    z(1, 2) = 8*x(2);
    z(2, 1) = -28*x(1);
    z(2, 2) = 18;
end