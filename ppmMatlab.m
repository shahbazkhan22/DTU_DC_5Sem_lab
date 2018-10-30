ts = 0.1;
tmax = 30;
Am = 0.85;
Ac = 4;
t = 0:ts:tmax;
x = Am*sin(t);
figure(1)
subplot(4,1,1)
plot(t,x)
xlabel('Time')
ylabel('Magnitude')
title('Sine wave')

grid on;
y = Ac*sawtooth(4*t);
subplot(4,1,2)
plot(t,y)
xlabel('Time')
ylabel('Magnitude')
title('Sawtooth wave')

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
xlabel('Time')
ylabel('Magnitude')
title('PAM wave')

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
xlabel('Time')
ylabel('Magnitude')
title('PPM wave')

fs = 1/ts;
freq1 = ts*fftshift(abs(fft(pwm)));
f = ((-fs/2)+fs/length(freq1)):fs/length(freq1):fs/2;

figure(2)
freq2 = ts*fftshift(abs(fft(ppm)));
plot(f,freq2)
xlabel('Frequency')
ylabel('Magnitude')
title('PPM wave frequency')
grid on;