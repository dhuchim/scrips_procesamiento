clc
clear all; close all;
ws = 0.4586*pi; 
wp = 0.6*pi;
Rp = 1; 
As = 15; 
[N,wn] = cheb1ord(wp/pi,ws/pi,Rp,As);
[b,a] = cheby1(N,Rp,wn,'high');
[b0,B,A] = dir2cas(b,a)
%Graficas
[db,mag,pha,grd,w] = freqz_m(b,a);
figure('Name','Ejemplo 8.28','Numbertitle','off');
subplot(2,2,1); plot(w/pi,mag);title('Magnitude Response');grid on;
axis([0 1 0 1]);xticks([0 0.46 0.6 1]);yticks([0 0.1778 0.8913 1]);
ylabel('|H|');xlabel('frequency in pi units');
subplot(2,2,2); plot(w/pi,pha/pi);title('Phase Response');grid on;
axis([0 1 -1 1]);xticks([0 0.46 0.6 1]);yticks([-1 -0.5 0 0.5 1]);
ylabel('pi units');xlabel('frequency in pi units');
subplot(2,2,3); plot(w/pi,db);title('Magnitude in dB');grid on;
axis([0 1 -30 0]);xticks([0 0.46 0.6 1]);yticks([-15 -1 0]);
ylabel('decibels');xlabel('frequency in pi units');
subplot(2,2,4); plot(w/pi,grd);title('Group Delay');grid on;
axis([0 1 0 10]);xticks([0 0.46 0.6 1]);yticks([0 2 4 6 8 10]);
ylabel('Samples');xlabel('frequency in pi units');


