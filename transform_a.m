function [ T ] = transform_a(m, n, q, r_q, phi_q, k)
    %B = ones(2*n+1, 1);             %temp. resort
    T = zeros(2*m*q+q, 2*n+1);
    for i = -m:m
        for j = n:-n
           T(i+m+1, j-n+1) = besselj(i+j, k*r_q(i+m+1))*exp(-1i*(i+j)*phi_q(i+m+1));
        end
    end
end