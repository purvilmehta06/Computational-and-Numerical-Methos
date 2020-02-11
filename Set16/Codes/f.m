function z = f(x, y)
%z = -y + 2*cos(x);
z = -y + (x.^0.1).*(1.1 + x);
end