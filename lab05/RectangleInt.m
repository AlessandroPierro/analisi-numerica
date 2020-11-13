function [I] = RectangleInt(f, a, b, n)
    x = linspace(a, b, n);
    f_x = f(x);
    I = sum(f_x) * (b-a) / n;
end

