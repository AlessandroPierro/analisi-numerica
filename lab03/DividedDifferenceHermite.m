function [d] = DividedDifferenceHermite(x, fx, dfx)
    
    x = reshape([x;x], 1, [])';
    fx = reshape([fx;fx], 1, [])';
    n = length(x);
    
    d = zeros(n, 1);
    d(1) = fx(1);
    d(2:2:n) = dfx;
    d(3:2:n) = (fx(3:2:n)-fx(2:2:n-1)) ./ (x(3:2:n) - x(2:2:n-1));
    
    for i = 3:n
        
        d(i:n) = (d(i:n)-d(i-1:n-1)) ./ (x(i:n) - x(1:n-(i-1)));
    
    end
    
end

