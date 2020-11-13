function [P] = Interpole(f, x, z)
    
    n = length(x);
    m = length(z);
    
    L = LagrangePol(x, z);
    P = zeros(m);
    
    [X, Y] = meshgrid(x, x);
    F = f(X, Y);
    
    for h = 1:m
   
        for k = h:m
    
            P(h, k) = (F * L(:, k))' * L(:, h);
        
        end
    
    end
    
    P = (P + P') - eye(m).*diag(P);
    
end

