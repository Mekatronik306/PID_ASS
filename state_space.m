% Author: Pontus Svensson
function [dz, acceleration] = state_space(z, u)
%#codegen
dz = zeros(4, 1);
acceleration = 0;    
k_s = 18600; % N/m
k_t = 196000; % N/m
c_s = 1000; % Ns/m
c_t = 1000; % Ns/m
m_s = 250; % kg
m_u = 50; % kg

% State vector
z_s = z(1);
dz_s = z(2);
z_u = z(3);
dz_u = z(4);

% Control force from PID
z_r = u(1);
F_a = u(2);

% state space equations
ddz_s = (-k_s*(z_s - z_u) - c_s*(dz_s - dz_u) + F_a) / m_s;
ddz_u = (k_s*(z_s - z_u) + c_s*(dz_s - dz_u) - k_t*(z_u - z_r) - c_t*(dz_u) - F_a) / m_u;

% Return the derivatives of the state vector
dz = [dz_s; ddz_s; dz_u; ddz_u];

% Output the acceleration of m_s for observation
acceleration = ddz_s;
end