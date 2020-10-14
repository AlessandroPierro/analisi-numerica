n = 9;
m = 100;

f = @(x, y) 1 ./ (1 + 25 * ((x.^2) + (y.^2)));
theta = @(t, n) cos((2*t - 1) * pi / (2*n)); 

z = linspace(-1, 1, m);
x = linspace(-1, 1, n);
x_chebychev = theta(1:n, n);

P = Interpole(f, x, z);
P_chebychev = Interpole(f, x_chebychev, z);

[X, Y] = meshgrid(z, z);
F = f(X, Y);

% Plotting
figure;
hold on;
subplot(2, 2, 1);
mesh(X, Y, F);
title("2D Runge Function");
subplot(2, 2, 2);
mesh(P);
title("Polynomial Interpolation - Equally spaced nodes");
subplot(2, 2, 3);
mesh(X, Y, F);
title("2D Runge Function");
subplot(2, 2, 4);
mesh(P_chebychev);
title("Polynomial Interpolation - Chebychev nodes");
hold off;
