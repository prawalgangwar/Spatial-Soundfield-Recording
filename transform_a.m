function [ T ] = transform_a(m, q, r_q, phi_q, f, R_o)
    k = 2*pi*f/340;
    n = round(k * exp(1) * R_o /2);
    T = zeros(2*m*q+q, 2*n+1);
    
    for t = 1:q
        for i = -m:m
            for j = -n:n
               temp = besselj(i-j, k*r_q(t))*exp(-1i*(i-j)*phi_q(t));
               T((2*m+1)*(t-1)+(m+1+i), j+n+1) = temp;
            end
        end
    end
end

