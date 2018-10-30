ts = 0.01;
tmax = 30;
Am = 0.85;
Ac = 4;
t = 0:ts:tmax;
x = Am*sin(t);
figure(1)
subplot(4,1,1)
plot(t,x)
grid on;
y = Ac*sawtooth(4*t);
subplot(4,1,2)
plot(t,y)
grid on;
pwm = [];
for i=1:(tmax/ts)+1
    if(y(i)>x(i))
        pwm(i) = 1;
    else
        pwm(i) = 0;
    end
end
subplot(4,1,3)
plot(t,pwm)
grid on;
temp = [];
temp = diff(-pwm);
ppm = [];
if(pwm(1)>0)
    ppm(1) = pwm(1);
else
    ppm(1) = 0;
end
for i=2:(tmax/ts)+1
    if(temp(i-1)>=0)
        ppm(i) = temp(i-1);
    else
        ppm(i) = 0;
    end
end
subplot(4,1,4)
plot(t,ppm)
grid on;
fs = 1/ts;
freq1 = ts*fftshift(abs(fft(pwm)));
f = ((-fs/2)+fs/length(freq1)):fs/length(freq1):fs/2;
figure(2)
subplot(3,1,2)
plot(f,freq1)
grid on;
freq2 = ts*fftshift(abs(fft(ppm)));
subplot(3,1,3)
plot(f,freq2)
grid on;