function [ J ] = cylindrical_bessel( n, k, r, W, rq, phi_q)
    J = 0;
    mmax = 100;
    %phi and phi_q is unknown yet
    for m = -mmax:mmax
        J = J + besselj(m-n, k*rq)*besselj(m, k*r)*exp(1i*m*phi)*exp(1i*(n-m)*phi_q);
    end
    J = J/exp(1i*n*W);
end