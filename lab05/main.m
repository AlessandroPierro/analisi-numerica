f = @(x) x.*cos(10*x);

I = 0.2495;

a = 1;
b = 2;

I_rectangular = @(n) rectangle_int(f, a, b, n);
I_trapezoidal = @(n) trapezoid_int(f, a, b, n);
I_simpson = @(n) simpson_int(f, a, b, n);

n = 2.^[1:20];

I_rect = arrayfun(I_rectangular, n);
I_trap = arrayfun(I_trapezoidal, n);
I_simp = arrayfun(I_simpson, n);

plot(1:20, (I - [I_rect; I_trap; I_simp]), "-*")
legend("rect", "trap", "simp")