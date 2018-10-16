clc;clear all; close all;
ws = [0.4*pi 0.7*pi];
wp = [0.25*pi 0.8*pi];
Rp = 1; 
As = 40; 
[N,wn] = cheb2ord(wp/pi,ws/pi,Rp,As);
[b,a] = cheby2(N,As,ws/pi,'stop');
[b0,B,A] = dir2cas(b,a)
%Graficas
[db,mag,pha,grd,w] = freqz_m(b,a);
figure('Name','Ejemplo 8.30','Numbertitle','off');
subplot(2,2,1); plot(w/pi,mag);title('Magnitude Response');grid on;
axis([0 1 0 1]);xticks([0 0.25 0.4 0.7 0.8 1]);yticks([0 0.8913 1]);
ylabel('|H|');xlabel('frequency in pi units');
subplot(2,2,2); plot(w/pi,pha/pi);title('Phase Response');grid on;
axis([0 1 -1 1]);xticks([0 0.25 0.4 0.7 0.8 1]);yticks([-1 -0.5 0 0.5 1]);
ylabel('pi units');xlabel('frequency in pi units');
subplot(2,2,3); plot(w/pi,db);title('Magnitude in dB');grid on;
axis([0 1 -50 0]);xticks([0 0.25 0.4 0.7 0.8 1]);yticks([-40 0]);
ylabel('decibels');xlabel('frequency in pi units');
subplot(2,2,4); plot(w/pi,grd);title('Group Delay');grid on;
axis([0 1 0 15]);xticks([0 0.25 0.4 0.7 0.8 1]);yticks([0 5 10 15]);
ylabel('Samples');xlabel('frequency in pi units');




