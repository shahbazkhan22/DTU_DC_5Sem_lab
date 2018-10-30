clc;

min = 0
max = 5
step = 0.003
Number_ofsteps = 8;
Am = 1
t = min:step:max;
x=[]
x = Am*sin(2*pi*t);
pulse = []
for i=1:max/step+1
    if(rem(i,10)==1)
        pulse(i) = 1;
    else
        pulse(i) = 0;
    end
end
msg = x.*pulse;

yCap=zeros(size(msg));
yDashCap = zeros(size(msg));

for i=2:max/step+1
    yCap(i) = quantize((msg(i)-yDashCap(i-1)),2*Am,Number_ofsteps);
    yDashCap(i) = yCap(i) + yDashCap(i-1);
end



xCap = [];
xCap = zeros(size(msg));
for i=2:max/step+1
    xCap(i) = yCap(i)+xCap(i-1);
end

for i=2:max/step+1
    if xCap(i)<=0.2 && xCap(i)>=-0.2
        xCap(i) = 0;
    end
end

%[b,a] = besself(1,1);
%xCapFreq = fftshift(fft(xCap));
%XCap = ifftshift(ifft(xCapFreq.*b));


subplot(5,1,1)
plot(t,x)
xlabel('Time')
ylabel('Magnitude')
title('Message Signal')
subplot(5,1,2)
plot(t,pulse)
xlabel('Time')
ylabel('Magnitude')
title('Pulse Train')
subplot(5,1,3)
plot(t,msg)
xlabel('Time')
ylabel('Magnitude')
title('Sampled Message Signal')
subplot(5,1,4)
plot(t,yCap)
xlabel('Time')
ylabel('Magnitude')
title('Differential Pulse Code Modulated Signal')
subplot(5,1,5)
plot(t,xCap)
xlabel('Time')
ylabel('Magnitude')
title('Demodulated Signal')
