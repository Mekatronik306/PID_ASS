k_s = 1;
k_t = 1;
b_s = 1;
m_s = 10;
m_u = 10;

A = [0,1,0,0;-(k_s/m_s),-(b_s/m_s),k_s/m_s,b_s/m_s;0,0,0,1;k_s/m_u,b_s/m_u,-(k_t+k_s)/m_u,-(b_s/m_u)];
B = [0,0;1/m_s,0;0,0;0,k_t/m_u];
C = [-(k_s/m_s), -(b_s/m_s), k_s/m_s, b_s/m_s; 0,1,0,0; k_s/m_u,b_s/m_u, -(k_t+k_s)/m_u,-(b_s)/m_u;0,0,0,1];
D = [0,0;0,0;0,0;0,0];

% Convert the state-space representation to transfer function
sys = ss(A, B, C, D);
tf_sys = tf(sys);

% Display the transfer functions
tf_sys