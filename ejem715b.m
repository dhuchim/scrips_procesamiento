clc
clear all
close all
% T1 = 0.39
M = 40; alpha = (M-1)/2;l = 0:M-1; wl = (2*pi/M)*l;
Hdr = [1,1,0,0]; wdl = [0,0.25,0.25,1];
Hrs = [ones(1,5),0.39,zeros(1,29),0.39,ones(1,4)];
k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;
angH = [-alpha*(2*pi)/M*k1, alpha*(2*pi)/M*(M-k2)];
H = Hrs.*exp(j*angH); h = real(ifft(H,M));


[db,mag,pha,grd,w] = freqz_m(h,1); [Hr,ww,a,L] = Hr_Type2(h);
figure('Name','Ejercicio 7.15b','NumberTitle','off')
subplot(2,2,1);plot(wl(1:39)/pi,Hrs(1:39),'o',wdl,Hdr);
axis([0,1,-0.1,1.1]); title('Frequency Samples: M=40, Ti=0.39')
xlabel('frequency in pi units'); ylabel('Hr(k)');grid minor 


subplot(2,2,2); stem(l,h); axis([-1,M,-0.1,0.3])
title('Impulse Response'); xlabel('n'); ylabel('h(n)');

subplot(2,2,3); plot(ww/pi,Hr,wl(1:39)/pi,Hrs(1:39),'o');
axis([0,1,-0.2,1.2]); title('Amplitude Response')
xlabel('frequency in pi units'); ylabel('Hr(w)');grid minor

subplot(2,2,4);plot(w/pi,db); axis([0,1,-99,5]); grid on
title('Magnitude Response'); xlabel('frequency in pi units');
ylabel('Decibels');grid minor