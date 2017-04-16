Q = 10;
M = 2;
%M = 3;
R_o = 4;

phi_q = 0:Q-1;
phi_q = phi_q*(2*pi/Q);

omega_q = phi_q;
phi_q = mod((pi + phi_q), 2*pi);
r_q = R_o*ones(Q,1);

R = -6:0.1:6;
W = -pi:0.01:pi;

S_e = exp(1i* k * R .* cos(W - pi/4));

%coff_alpha = cofficients_a(M, N, Q, r_q, phi_q, k); 

L = 4;
R_s = 1;