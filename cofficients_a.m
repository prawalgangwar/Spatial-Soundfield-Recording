function [ A ] = cofficients_a(N, sam_R, sam_P, mic_r, mic_p)
    sam_x = sam_R .* cos(sam_P);
    sam_y = sam_R .* sin(sam_P);
    
    sp = zeros(N);
    for n = 1:N
        sp(n) = soundfield(f, sam_R(n), sam_P(n));
    end
    
    mic_x = mic_r * cos(mic_p);
    mic_y = mic_r * sin(mic_p);
    
    %Matrix Rotation and Translation
    [rt_x, rt_y] = rotate_translate(sam_x, sam_y, mic_x, mic_y);
    
    r_x = sqrt(rt_x * rt_x + rt_y * rt_y);
    r_p = atan(rt_y/rt_x);

    J = zeros(N,N);
    
    for n = 1:N
        for j = 1:N
            J(n,j) = besselj(n, k*r_x) * exp(1i*n*r_p);
        end
    end
    
    A = S * inv(J);
end