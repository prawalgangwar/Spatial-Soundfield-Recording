function [ T ] = transform_a(m, q, r_q, phi_q, f, R_o)
    k = 2*pi*f/340;
    n = round(k * exp(1) * R_o /2);
    T = zeros(2*m*q+q, 2*n+1);
    
    for q = 1:q
        for i = -m:m
            for j = -n:n
               temp = besselj(i-j, k*r_q(q))*exp(-1i*(i-j)*phi_q(q));
               T((2*m+1)*(q-1)+(m+1+i), j+n+1) = temp;
            end
        end
    end
end