function [ S ] = soundfield(f, R, omega)
    k = 2*pi*f/340;
    t = cos(omega-pi/4);
    S = exp(1i*k*R*t);
end