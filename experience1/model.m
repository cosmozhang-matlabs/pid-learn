function [ next_state ] = model( block, state, u, dt )

g = constants();

f_gravity = block.m * g;
k_friction = block.k_friction;
k_drive = block.k_drive;

v = state(2);
x = state(1);

a_friction = - g * k_friction * sign(v);
a_drive = k_drive * u / f_gravity;

vv = v + (a_drive + a_friction) * dt;
if (sign(vv) ~= sign(v)) && (sign(a_drive) == sign(v))
%     vv = 0;
end
xx = x + vv * dt;

next_state = [xx;vv];

end

