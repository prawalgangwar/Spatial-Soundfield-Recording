function [ temp ] = soundfield(f, R, omega, R_o)
    k = 2*pi*f/340;
    n_max = round(exp(1)*k*R_o/2);
    for j = -n_max:n_max
        B(j+n_max+1) = (1i)^j * exp(-1i * j * pi/4);
    end
    temp = sound_pressure_inside(B, R, omega, f, R_o);
end