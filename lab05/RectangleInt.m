function [I] = RectangleInt(f, a, b, n)
    x = linspace(a, b, n);
    I = sum(f(x)) * (b-a) / (n-1);
end

