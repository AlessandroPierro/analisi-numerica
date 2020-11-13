function [L] = LagrangePol(x, z)

    n = length(x);
    p = length(z);
    
    numerators = prod(z-x');
    
    L = zeros(n, p);
    
    for i = 1:n
        
        den = prod(x(i)-x([1:i-1 i+1:n])) * (z-x(i));
        L(i, :) = numerators ./ den;    
        L(i, isnan(L(i, :))) = 1;           % handles 0 / 0
        
    end

end
