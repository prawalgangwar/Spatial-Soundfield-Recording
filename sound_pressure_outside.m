function [ sp ] = sound_pressure_outside(n_max, R, w, k )
    sp = 0;
    for n = -n_max:n_max 
        sp = sp + beta(n,0,k)*cylindrical_hankel(n,k,R)*exp(1i*n*w);
    end
end