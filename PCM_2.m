ts = 0.01
tmax = 30
Am  = 5
t = 0:ts:tmax;
m = Am*sin(2*pi*t/30);
subplot(3,1,1)
plot(t,m)
xlabel('Time')
ylabel('Magnitude')
title('Message')
grid on

fs = 10
x = []
for i=1:tmax/ts+1
    if(rem(i,fs)==0)
        x(i) = m(i);
    else
        x(i) = 0;
    end
end
subplot(3,1,2)
plot(t,x)
xlabel('Time')
ylabel('Magnitude')
title('Sampled Message')
grid on

level = 2*Am;
step = 8
d = level/step
delta = []
for i=1:level+1
    delta(i) = -Am+(i-1)*d;
end
y = []
for i=1:tmax/ts+1
    for j = 1:level
        if(x(i)>delta(j) && x(i)<=delta(j+1))
            y(i) = (delta(j)+delta(j+1))/2;
        end
    end
end
subplot(3,1,3)
plot(t,y)
xlabel('Time')
ylabel('Magnitude')
title('Pulse Coded Message')
grid on

z = y - min(y);
z = dec2bin(z);
