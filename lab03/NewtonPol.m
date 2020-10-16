function [p] = NewtonPol(x, d, z)
    
    n = length(x);
    m = length(z);
    p = ones(1, m)*d(n);

    for i = n:-1:2
        
        p = p .* (z - x(i-1)) + d(i-1);
        
    end

end

