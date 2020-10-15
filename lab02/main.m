if license('test', 'Optimization_Toolbox')
    n = 10;
    m = 1000;

    z = linspace(-1, 1, m);

    theta = @(t, n) cos((2*t - 1) * pi ./ (2*n));
    lebesgue = @(x, z) sum(abs(Lagrange(x, z)));
    lebesgue_con = @(x) max(lebesgue(x, z));
    
    L_eq = zeros(n, m);
    L_ch = zeros(n, m);
    L_op = zeros(n, m);

    for i = 1:n
        
        x_0 = sort(rand(1, i)*2-1);
        lb = -1 * ones(1,i);
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

else
    printf('optimization-toolbox is required to run this M-script');
end