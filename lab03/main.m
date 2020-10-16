a = 0;
b = 2;
n = 5;

theta = @(t, n) (b-a)/2 * (cos((2*t - 1) * pi ./ (2*n)) + (a+1));

f = @(x) exp(-x/2);
df = @(x) -exp(x/2)/2;

z = linspace(a, b, 100);
x_ch = theta(1:n, n);
fx = f(x_ch);
dfx = df(x_ch);

x_ch = reshape([x_ch;x_ch], 1, [])';
d = DividedDifferenceHermite(x_ch, fx, dfx);


p = NewtonPol(x_ch, d, z);

figure;
subplot(1,2,1);
plot(z, [f(z); p], "-*");
title("Hermite Interpolation - Chebychev nodes");
legend("f : function", "p : interpolation");
subplot(1,2,2);
area(z, f(z)-p);
title("Interpolation Error");
legend("f(x) - p(x)");