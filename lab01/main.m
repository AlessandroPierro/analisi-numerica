n = 9;
m = 100;

f = @(x, y) 1 / (1 + 25 * (x.^2 + y.^2));

z = linspace(-1, 1, m);
x = linspace(-1, 1, n);

L = Lagrange(x, z);

