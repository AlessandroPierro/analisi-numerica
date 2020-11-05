function [I] = simpson_int(f, a, b, n)
    if rem(n, 2) == 0
        n = n+1;
    end
    f_x = f(linspace(a, b, n));
    h = (b-a)/(3*n);
    I = h*sum([f_x(1), 4*sum(f_x(2:2:n-2)), 2*sum(f_x(3:2:n-3)), f_x(n)]);
end

