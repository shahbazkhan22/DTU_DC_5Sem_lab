ts = 0.0001;
t = 0:ts:50;
x = (square(10*t,50)+1)/2;
y = sin(t);
subplot(4,1,1)
plot(t,y)
subplot(4,1,2)
plot(t,x)
subplot(4,1,3)
m = x.*y;
plot(t,m)
M = fft(m)*ts;
fs = 1/ts;
f = ((-fs/2)+fs/length(M)):fs/length(M):fs/2;
subplot(4,1,4)
plot(f,fftshift(abs(M)))
