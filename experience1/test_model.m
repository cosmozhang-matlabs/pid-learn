state0 = [0;0];
b = block(10,0.5,0.1);
p = pid_param(2.5,0,0);
xspec = 200;

dt = 0.1;

ts = 0:dt:200;
len = size(ts,2);
ss = zeros(2, len);
ss(:,1) = state0;

% for ii = 0:50:400
%     for i = 2:len
%         ss(:,i) = model(b,ss(:,i-1),ii,dt);
%     end
%     plot(ts,ss(1,:)); hold on;
% end

sum_err = 0;
last_err = 0;
for i = 2:len
    err = xspec - ss(1,i-1);
    sum_err = sum_err + err * dt;
    del_err = (err - last_err) / dt;
    last_err = err;
    u = p.p * err + p.i * sum_err + p.d * del_err;
    ss(:,i) = model(b,ss(:,i-1),u,dt);
end
% plot(ts,ss(1,:)); hold on;
plotyy(ts,ss(1,:),ts,ss(2,:)); hold on;
plot(ts,ones(1,len)*xspec,'k--');