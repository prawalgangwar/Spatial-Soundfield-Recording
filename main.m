Q = 10;
M = 2;
R_o = 4;

phi_q = 0:Q-1;
phi_q = phi_q*(2*pi/Q);

omega_q = phi_q;
phi_q = mod((pi + phi_q), 2*pi);
r_q = R_o*ones(Q,1);

R = -6:0.1:6;
W = -pi:0.01:pi;

coff_alpha = zeros(Q, 2*M+1);
coff_alpha(1,:) = cofficients_a(M, N, Q, r_q, phi_q, k); 

L = 4;
R_s = 1;