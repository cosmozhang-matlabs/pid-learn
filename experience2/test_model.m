p = pid_param(1,0,0);
spec = 50;

dt = 0.01;
ts = 0:dt:1;
len = size(ts,2);
state = zeros(1,len);

sum_err = 0;
last_err = 0;
for i = 2:len
    err = spec - state(1,i-1);
    sum_err = sum_err + err * dt;
    del_err = (err - last_err) / dt;
    last_err = err;
    u = p.p * err + p.i * sum_err + p.d * del_err;
    state(i) = model(state(i-1), u, dt);
end

plot(ts, state, 'b'); hold on;
plot(ts, ones(1,len)*spec, 'r--');