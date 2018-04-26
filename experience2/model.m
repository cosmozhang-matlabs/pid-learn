function [ new_state ] = model( state, u, dt )

sv = -1;

new_state = state + u * normrnd(1,0.1) + sv * normrnd(1,0.1) * dt;

end

