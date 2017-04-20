function [ sp ] = sound_pressure_inside(alpha, R, w, f, R_o)
    sp = 0;
    k = 2*pi*f/340;
    n_max = round(exp(1)*k*R_o/2);
    
    for n = -n_max:n_max  
        if alpha==Inf
            sp = sp + (1i)^(n)*exp(-1i*n*pi/4)*besselj(n, k*R)*exp(1i*(n)*w);
        else
            sp = sp + alpha(n+n_max+1)*besselj(n, k*R)*exp(1i*(n)*w);
        end
    end
end