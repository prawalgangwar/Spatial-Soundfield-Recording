function [ sp ] = sound_pressure_outside(gamma, L, R, w, f, R_s )
    sp = 0;
    k = 2*pi*f/340;
    n_max = round(exp(1)*k*R_s/2);
    beta=0;
    phi_s = 0:L-1;
    phi_s = phi_s*(2*pi/L);
    
    for n = -n_max:n_max
        beta=0;
        if gamma==Inf
            for i = 1:L
                beta=beta+besselj(n, k*R_s)*exp(-1i*n*phi_s(i));
            end
            sp = sp + beta*besselh(n, k*R)*exp(1i*n*w);
        else 
            sp = sp + gamma(n+n_max+1)*besselh(n, k*R)*exp(1i*n*w);
        end
    end
end

