n = 10;
m = 1000;

z = linspace(-1, 1, m);

theta = @(t, n) cos((2*t - 1) * pi ./ (2*n)); 
lebesgue = @(x, z) sum(abs(Lagrange(x, z)));

L_eq = zeros(n, m);
L_ch = zeros(n, m);

for i = 1:n
    
    L_eq(i, :) = lebesgue(linspace(-1, 1, i), z);
    L_ch(i, :) = lebesgue(theta(1:i, i), z);
    
end

Lc_eq = max(L_eq, [], 2);
Lc_ch = max(L_ch, [], 2);
