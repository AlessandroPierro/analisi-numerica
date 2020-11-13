function [P] = LegendrePol(x, n)
    
    m = length(x);
    
    if n<0
        error("n can't be negative!");
    elseif n==0
        P = ones(1, m);
        return;
    end
    
    p = zeros(2, m);
    p(2,:) = 1;
    
    k2 = 2;
    
    for i = 1:n
        k1 = k2;
        k2 = k2 + (-1) ^ i;
        p(k2,:) = ((2*i-1)*x.*p(k1,:) - (i-1)*p(k2,:))./i;
    end
    
    P = p(k2,:);
end

