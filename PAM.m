
ts = 0.01;
t = 0:ts:50;
x = (square(10*t,50)+1)/2;
y = sin(t);
subplot(4,1,1)
plot(t,y)
title('Sine Wave')
xlabel('Time')
ylabel('Magnitude')
grid on
subplot(4,1,2)
plot(t,x)
axis([0 50 -1 2])
title('Pulse Wave')
xlabel('Time')
ylabel('Magnitude')
grid on
subplot(4,1,3)
m = x.*y;
plot(t,m)
title('PAM Wave')
xlabel('Time')
ylabel('Magnitude')
grid on
M = fft(m)*ts;
fs = 1/ts;
f = ((-fs/2)+fs/length(M)):fs/length(M):fs/2;
subplot(4,1,4)
plot(f,fftshift(abs(M)))
title('Frequency Spectrum')
xlabel('Frequency')
ylabel('Magnitude')
grid on