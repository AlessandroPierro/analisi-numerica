f = @(x) x.*cos(10*x);

a = 1;
b = 2;

I = 0.2495; % TODO : symbolical calculus exact computation

I_rectangular = @(n) RectangleInt(f, a, b, n);
I_trapezoidal = @(n) TrapezoidInt(f, a, b, n);
I_simpson = @(n) SimpsonInt(f, a, b, n);

n = 2.^[1:20];

I_rect = arrayfun(I_rectangular, n);
I_trap = arrayfun(I_trapezoidal, n);
I_simp = arrayfun(I_simpson, n);

plot(1:20, (I - [I_rect; I_trap; I_simp])/I, "-*");
legend("reactangular", "trapezoidal", "Simpson");
title("relative ntegration error");
xlabel("Number of nodes");