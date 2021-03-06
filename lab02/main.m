if license('test', 'Optimization_Toolbox')
    n = 10;     % number of nodes
    m = 1000;   % number of evaluation points

    z = linspace(-1, 1, m);

    theta = @(t, n) cos((2*t - 1) * pi ./ (2*n));
    lebesgue = @(x, z) sum(abs(LagrangePol(x, z))); % Lebesgue function
    lebesgue_con = @(x) max(lebesgue(x, z));        % Lebesgue constant
    
    L_eq = zeros(n, m);    
    L_ch = zeros(n, m);     
    L_op = zeros(n, m);

    for i = 1:n
        
        x_0 = sort(rand(1, i)*2-1);
        lb = - ones(1,i);
        ub = ones(1,i);

        x_eq = linspace(-1, 1, i);
        x_ch = theta(1:i, i);
        x_op = fmincon(lebesgue_con, x_0, [], [], [], [], lb, ub);

        L_eq(i, :) = lebesgue(x_eq, z);
        L_ch(i, :) = lebesgue(x_ch, z);
        L_op(i, :) = lebesgue(x_op,z);

    end

    Lc_eq = max(L_eq, [], 2);
    Lc_ch = max(L_ch, [], 2);
    Lc_op = max(L_op, [], 2);
    
    % Plotting
    figure;
    subplot(1, 2, 1);
    plot(1:n, [Lc_eq, Lc_ch, Lc_op], "-*");
    legend("Equally spaced nodes", "Chebychev nodes", "Optimal nodes");
    title("Lebesgue Constant");
    xlabel("number of nodes");
    ylabel("Lebesgue constant");
    
    subplot(1, 2, 2);
    plot(z, [L_eq(n, :); L_ch(n, :); L_op(n, :)]', "-*");
    legend("Equally spaced nodes", "Chebychev nodes", "Optimal nodes");
    title("Lebesgue Function");
    xlabel("x in [-1, 1]");
    ylabel("Lebesgue function");

else
    printf('optimization-toolbox is required to run this M-script');
end