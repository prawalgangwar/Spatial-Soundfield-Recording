function [ T_E ] = transform_b(m, n, q, r_q, phi_q)
    T_E = zeros(2*m*q+q, 2*n+1);
    for i = -m:m
        for j = n:-n
           T_E(i+m+1, j-n+1) = besselh(i+j, k*r_q(i+m+1))*exp(-1i*(i+j)*phi_q(i+m+1)); 
        end
    end
end