n = 9;
m = 100;

f = @(x, y) 1 ./ (1 + 25 * ((x.^2) + (y.^2)));

z = linspace(-1, 1, m);
x = linspace(-1, 1, n);

L = Lagrange(x, z);
F = zeros(n);
P = zeros(m);

for i = 1:9
    
    F(i, :) = f(x(i), x);
    
end

for h = 1:m
   
    for k = h:m
    
        P(h, k) = (F * L(:, k))' * L(:, h);
    
    end
    
end

P = (P + P') - eye(m).*diag(P);
