clear all

Q = 10;
M = 1;
R_o = 4;
f = 140;

phi_q = 0:Q-1;
phi_q = phi_q*(2*pi/Q);
omega_q = phi_q;

phi_q = mod((pi + phi_q), 2*pi);
r_q = R_o*ones(1,Q);

sam_r = (R_o)*rand(1, 2*M+1);
sam_p = (2*pi)*rand(1, 2*M+1);
%sam_p = 0:2*M;
%sam_p = sam_p*(2*pi/(2*M+1));

coff_alpha = zeros(Q, 2*M+1);
for i = 1:Q
    coff_alpha(i, :) = cofficients_a(M, sam_r, sam_p, r_q(i), omega_q(i), f, R_o);
end

A = reshape(coff_alpha',(2*M+1)*Q,1);
T = transform_a(M, Q, r_q, phi_q, f, R_o);
%size(pinv(T))
%size(A)

B = pinv(T) * A;

[x, y] = meshgrid(-6:0.1:6,-6:0.1:6);
sx = size(x);

for i = -60:60
    for j = -60:60
        temp = sound_pressure_inside(B, sqrt(x(i+61, j+61)*x(i+61, j+61) + y(i+61, j+61)*y(i+61, j+61)), atan(y(i+61, j+61)/x(i+61, j+61)), f, R_o);
        z(i+61, j+61) = temp;
    end
end
size(z);
a = real(z);
%surf(x,y,a); 

%%%%%%%%%%%%%%%%%%%%%%%%EXTERIOR FIELD%%%%%%%%%%%%%%%%%%%%%%%
L = 4;
R_s = 1;
f=575;

sam_r = (R_o)*(R_s + rand(1, 2*M+1));
sam_p = (2*pi)*rand(1, 2*M+1);

coff_alpha = zeros(Q, 2*M+1);
for i = 1:Q
    coff_alpha(i, :) = cofficients_b(M, sam_r, sam_p, r_q(i), omega_q(i), f, R_s, L);
end

A1 = reshape(coff_alpha',(2*M+1)*Q,1);
T1 = transform_b(M, Q, r_q, phi_q, f, R_s);
D = pinv(T1)*A1;

for i = -60:60
    for j = -60:60
        temp = sound_pressure_outside(Inf, L, sqrt(x(i+61, j+61)*x(i+61, j+61) + y(i+61, j+61)*y(i+61, j+61)), atan(y(i+61, j+61)/x(i+61, j+61)), f, R_s);
        p(i+61, j+61) = temp;
    end
end

sz = size(p);
a = real(p);
surf(x,y,a);