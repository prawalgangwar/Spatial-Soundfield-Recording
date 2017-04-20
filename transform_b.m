function [ T_E ] = transform_b(m, q, r_q, phi_q, f, R_s)
    k = 2*pi*f/340;
    n = round(k * exp(1) * R_s /2);
    T_E = zeros(2*m*q+q, 2*n+1);
    
    for t = 1:q
        for i = -m:m
            for j = -n:n
               temp = besselh(i-j, k*r_q(t))*exp(-1i*(i-j)*phi_q(t));
               T_E((2*m+1)*(t-1)+(m+1+i), j+n+1) = temp;
            end
        end
    end
end

