ts = 0.01;
tmax = 30;
Am = 0.85;
Ac = 4;
t = 0:ts:tmax;
x = Am*sin(t);
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
title('PWM wave')
grid on;
fs = 1/ts;
freq1 = ts*fftshift(abs(fft(pwm)));
f = ((-fs/2)+fs/length(freq1)):fs/length(freq1):fs/2;
subplot(4,1,4)
plot(f,freq1)
xlabel('Frequency')
ylabel('Magnitude')
title('Spectrum of PWM Wave')
grid on;