function [ sp ] = sound_pressure_inside(alpha, R, w, f, R_o)
    sp = 0;
    k = 2*pi*f/340;
    n_max = round(exp(1)*k*R_o/2);
    
    for n = -n_max:n_max 
        sp = sp + alpha(n+n_max+1)*besselj(n+n_max +1, k*R)*exp(1i*(n + n_max +1)*w);
    end
end

