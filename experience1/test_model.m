state0 = [0;10];

dt = 0.1;

ts = 0:dt:10;
len = size(ts,2);
ss = zeros(2, len);
ss(:,1) = state0;

for i = 2:len
    ss(:,i) = model(ss(:,i-1),0,dt);
end

plot(ts,ss(1,:)); hold on;
% plot(ts,ss(2,:)); hold on;