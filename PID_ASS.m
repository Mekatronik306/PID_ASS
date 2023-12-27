% Author: Pontus Svensson
k_s = 18600; % N/m
k_t = 196000; % N/m
c_s = 1000; % Ns/m
c_t = 1000; % Ns/m
m_s = 250; % kg
m_u = 50; % kg

A = [0,1,0,0;-(k_s/m_s),-(c_s/m_s),k_s/m_s,c_s/m_s;0,0,0,1;k_s/m_u,c_s/m_u,-(k_t+k_s)/m_u,-((c_s+c_t)/m_u)];
B = [0,0;1/m_s,0;0,0;0,-1/m_u];
C = [1,0,0,0;-(k_s/m_s), -(c_s/m_s), k_s/m_s, c_s/m_s;0,0,1,0;  k_s/m_u,c_s/m_u, -(k_t+k_s)/m_u,-(c_s)/m_u];
% C = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1;];
D = [0,0;0,0;0,0;0,0];

% Convert the state-space representation to transfer function
sys = ss(A, B, C, D);
tf_sys = tf(sys);

% Display the transfer functions
tf_sys