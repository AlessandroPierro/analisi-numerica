f = @(x) (x+3).*sin(3*x+9)./4;

a = -1;
b = 1;
n = 10;

I = -0.1284; % TODO : adding symbolical computation of the inegral

I_Gauss = zeros(1, n);
I_Simpson = zeros(1, n);

for i = 1:10
    I_Gauss(1,i) = GaussInt(f, i);
    I_Simpson(1,i) = SimpsonInt(f, a, b, i);
end
   
err_Gauss = abs((I - I_Gauss)/I);
err_Simpson = abs((I - I_Simpson)/I);

semilogy(1:n, [err_Gauss; err_Simpson], "-*");
legend("Gauss", "Composite Simpson");
title("relative integration error");
xlabel("Order");
