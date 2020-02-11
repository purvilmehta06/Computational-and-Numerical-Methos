function z = hydraulic(H, X, D)
    z = H*(4-H^3) - 3*(X-D);
end