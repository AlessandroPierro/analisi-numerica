function [I] = gauss_int(f, n)
    A = diag([1:n-1]./[1:2:2*n-3], 1) + diag([1:n-1]./[3:2:2*n-1], -1);
    xx = eig(A)';
    V = zeros(n);
    for i = 1:n
        V(i,:) = LegendrePol(xx, i-1);
    end
    b = [2; zeros(n-1,1)];
    a = V\b;
    I = a' * f(xx)';
end

