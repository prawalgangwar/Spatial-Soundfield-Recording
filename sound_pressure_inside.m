function [ sp ] = sound_pressure_inside(n_max, R, w, k )
    sp = 0;
    for n = -n_max:n_max 
        sp = sp + alpha(n,0,k)*cylindrical_bessel(n, k, R)*exp(1i*n*w);
    end
end

