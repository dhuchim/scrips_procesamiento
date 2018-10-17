%graficas pendientes
clc;clear all;close all;
c = [1,1]; 
d = [1,5,6];
T = 0.1;Fs=1/T;
t=0:0.1:3;
[b,a] = imp_invr(c,d,T) 
[C,B,A] = sdir2cas(b,a) 
[ha,x,t] =impulse(c,d,t);
subplot(2,1,1);plot(t,ha );hold on;stem(t,ha,'b');axis([0 3 -0.1 1]);
title('Impulse Responses');xlabel('time in sec');ylabel('Amplitude');
[db,magd,pha,grd,wd] = freqz_m(b,a);
[db,mags,pha,ws] = freqs_m(c,d,2*pi*Fs);
subplot(2,1,2); plot(ws/(2*pi),mags*Fs,wd/(2*pi)*Fs,magd,'b')
xlabel('frequency in Hz'); title('Magnitude Responses');
ylabel('Magnitude'); text(1.4,.5,'Analog filter'); text(1.5,1.5,'Digital filter')





