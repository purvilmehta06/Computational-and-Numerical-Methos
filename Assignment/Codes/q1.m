p = 0.01:0.01:0.99;
n = length(p);
H = zeros(1, n);

k = 1;
H = -k*(p.*log2(p) + (1-p).*log2(1-p));

figure(1);
plot(p, H);
title('Entropy Curve');
xlabel('Probability P'); ylabel('Entropy H');grid;
epsilon = p -0.5;
a = k;
b = 4*k/log(2);
approx = a - b*(epsilon.^2);

figure(2);
plot(p, approx, p, H);
title('Comparison b/w Approx and Actual Functions');
xlabel('Probability P'); ylabel('Entropy H');
legend('Approx', 'True'); grid;