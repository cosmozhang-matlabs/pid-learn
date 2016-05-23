function [ next_state ] = model( state, u, dt )

syms xx;
logistic(xx) = 1 / (1 + exp(-xx));

g = 9.8;
fvb = 10;
fvk = 50;
fvo = 0.01;
fvth = 0.05;

m = 10;
f_gravity = m * g;
k_friction = 0.1;
k_drive = 0.5;

v = state(2);
p = state(1);

% a_friction = - g * k_friction * max([logistic(fvk * v - fvb) + logistic(- fvk * v - fvb) - fvo, 0]);
% a_friction = - g * k_friction * sign(v) * (abs(v) > fvth);
a_friction = - g * k_friction * sign(v);
a_drive = k_drive * u / f_gravity;

vv = v + a_drive + a_friction;
if sign(vv) ~= sign(v)
    vv = 0;
end
pp = p + vv * dt;

next_state = [pp;vv];

end

