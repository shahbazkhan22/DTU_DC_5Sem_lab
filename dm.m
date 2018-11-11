clc;
initial = 0;
final = 5;
step = 0.01;
fc = 1/pi;
delta = 0.1;
tb = 2;
t = initial:step:final;
msg = sin(2*pi*fc*t);
msg_sampled = []
for i=1:final/step+1
    if(rem(i,3)==0)
        msg_sampled(i) = msg(i);
    else
        msg_sampled(i) = 0;
    end
end
figure(1)
subplot(4,1,1)
plot(t,msg)
xlabel('Time')
ylabel('Magnitude')
title('Message signal')
grid on
subplot(4,1,2)
plot(t,msg_sampled)
xlabel('Time')
ylabel('Magnitude')
title('Sampled Message signal')
grid on

transmitted = zeros(size(msg));
delta_train = zeros(size(msg));
transmitted(1) = msg(1);
for i=2:final/step+1
    if(rem(i,3)==0)
        if(transmitted(i-1)<msg(i))
            delta_train(i) = delta;
            transmitted(i) = transmitted(i-1)+delta;
        else
            delta_train(i) = -delta;
            transmitted(i) = transmitted(i-1)-delta;
        end
    else
        delta_train(i) = delta_train(i-1);
        transmitted(i) = transmitted(i-1);
    end
end
pulse_train = zeros(size(msg));
for i=1:(final/step+1)
    if(delta_train(i)>0)
        pulse_train(i) = 1;
    end
    if(delta_train(i)<0)
        pulse_train(i) = -1;
    end
    
end
subplot(4,1,3)
plot(t,pulse_train)
xlabel('Time')
ylabel('Magnitude')
title('Transmitted Message signal')
grid on
subplot(4,1,4)
plot(t,transmitted,t,msg)
xlabel('Time')
ylabel('Magnitude')
title('Demodulated signal') 
grid on
