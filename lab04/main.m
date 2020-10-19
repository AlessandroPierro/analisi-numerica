n = 4;
m = 40;

x = [0 20 40 50;
     50 50 0 0;
     0 0 -50 -50;
     -50 -40 -20 0];

y = [-50 -30 -40 0;
    0 50 50 15;
    15 50 50 0;
    0 -40 -30 -50];

t = linspace(0, 1, m);

X = zeros(n, m);
Y = zeros(n, m);

for i=1:n
    X(i, :) = DeCasteljau(x(i, :), t);
    Y(i, :) = DeCasteljau(y(i, :), t);
end

% Plotting

figure;
hold on;
for i=1:n
    plot(X(i, :), Y(i, :), "-*");
end
title("4 Bézier Curves on 4 points");
xlim([-75, 75]);
ylim([-75, 75]);