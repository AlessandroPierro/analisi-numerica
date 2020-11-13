f = @(x) (x+3).*sin(3*x+9)./4;

a = -1;
b = 1;
n = 10;

I = -0.1284; % TODO : adding symbolical computation of the inegral

I_Gauss = zeros(1, n);
I_Simpson = zeros(1, n);

for i = 1:10
    I_Gauss(1,i) = gauss_int(f, i);
    I_Simpson(1,i) = simpson_int(f, a, b, i);
end
   
err_Gauss = abs(I - I_Gauss);
err_Simpson = abs(I - I_Simpson);

semilogy(1:n, [err_Gauss; err_Simpson], "-*");
legend("Gauss", "Composite Simpson");
title("Remainder of integration");
xlabel("Order");
