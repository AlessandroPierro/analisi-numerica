function [I] = TrapezoidInt(f, a, b, n)
    x = linspace(a, b, n);
    f_x = f(x);
    I = ((b-a)/(2*n))*sum([f_x(1), 2*sum(f_x(2:n-1)), f_x(n)]);
end

