function [L] = Lagrange(x, z)

    n = length(x);
    p = length(z);
    
    numerators = prod(z-x');
    
    L = zeros(n, p);
    
    for i = 1:n
        
        denominators = prod(x(i)-x([1:i-1 i+1:n])) * (z-x(i));
        L(i, :) = numerators ./ denominators;
        L(i, isnan(L(i, :))) = 1;
        
    end

end
