function y = f12d(a, x)
    y = zeros(length(x));
    for i=1:length(x)
        y(i) = a-2*a*x(i);
    end
end