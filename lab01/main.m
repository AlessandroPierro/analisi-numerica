n = 9;
m = 100;

f = @(x, y) 1 ./ (1 + 25 * ((x.^2) + (y.^2)));
theta = @(t, n) cos((2*t - 1) * pi / (2*n)); 

z = linspace(-1, 1, m);
x = linspace(-1, 1, n);
x_1 = theta(1:n, n);

L = Lagrange(x, z);
F = zeros(n);
P = zeros(m);

L_1 = Lagrange(x_1, z);
F_1 = zeros(n);
P_1 = zeros(m);

for i = 1:9
    
    F(i, :) = f(x(i), x);
    F_1(i, :) = f(x_1(i), x_1);
    
end

for h = 1:m
   
    for k = h:m
    
        P(h, k) = (F * L(:, k))' * L(:, h);
        P_1(h, k) = (F_1 * L_1(:, k))' * L_1(:, h);
    
    end
    
end

P = (P + P') - eye(m).*diag(P);
P_1 = (P_1 + P_1') - eye(m).*diag(P_1);
