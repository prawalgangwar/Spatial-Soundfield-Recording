function [ H ] = cylindrical_hankel( n, k, r )
    H = 0;
    mmax = 100;
    %phi and phi_q is unknown yet
    for m = -mmax:mmax
        H = H + besselh(m-n, k*rq)*besselj(m, k*r)*exp(1i*m*phi)*exp(1i*(n-m)*phi_q);
    end
end