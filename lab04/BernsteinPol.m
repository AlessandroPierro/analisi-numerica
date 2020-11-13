function [T] = BernsteinPol(p, t)

    n = length(p);
    m = length(t);
    B = zeros(n, n);
    T = zeros(1, m);
    
    B(1, :) = p;
    
    for j = 1:m
        
        for i = 2:n
        
            B(i, i:n) = B(i-1, i-1:n-1) * (1-t(j)) + B(i-1, i:n) * t(j);
        
        end
        
        T(j) = B(n,n);
    
    end
        
end