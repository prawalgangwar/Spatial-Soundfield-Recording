function [ A ] = cofficients_a(M, sam_R, sam_P, mic_r, mic_p, f, R_o)

    sam_x = sam_R .* cos(sam_P);
    sam_y = sam_R .* sin(sam_P);

    sp = zeros(1, 2*M+1);
    %size(sp)
    for n = 1:2*M+1
        sp(n) = sound_pressure_inside(Inf, sam_R(n), sam_P(n), f, R_o);
    end
    
    k = 2*pi*f/340;
    
    mic_x = mic_r * cos(mic_p);
    mic_y = mic_r * sin(mic_p);
    
    %Matrix Translation
    rt_x =  sam_x - mic_x;
    rt_y =  sam_y - mic_y; 
    
    r_x = sqrt(rt_x .* rt_x + rt_y .* rt_y);
    r_p = atan(rt_y./rt_x);

    J = zeros(2*M+1,2*M+1);
    
    for n = 1:2*M+1
        for j = 1:2*M+1
            J(n,j) = besselj(n-M-1, k*r_x(j)) * exp(1i*(n-M-1)*r_p(j));
        end
    end

    A = sp/J;
    %A = sp * inv(J);
end

