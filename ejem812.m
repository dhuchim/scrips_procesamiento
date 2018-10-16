clc
clear all
close all 
wp = 0.2*pi; 
ws = 0.3*pi; 
Rp = 1;
As = 15; 
T = 1; 
OmegaP = wp / T; 
OmegaS = ws / T; 
[cs,ds] = afd_chb1(OmegaP,OmegaS,Rp,As);
[b,a] = imp_invr(cs,ds,T); [C,B,A] = dir2par(b,a)
[db,mag,pha,grd,w] = freqz_m(b,a);
figure('Name','Ejemplo 8.12','Numbertitle','off');
subplot(2,2,1); plot(w/pi,mag);title('Magnitude Response');grid on;
axis([0 1 0 1.1]);xticks([0 0.2 0.3 1]);yticks([0 0.1778 0.8913 1]);
ylabel('|H|');xlabel('frequency in pi units');
subplot(2,2,2); plot(w/pi,pha/pi);title('Phase Response');grid on;
axis([0 1 -1 1]);xticks([0 0.2 0.3 1]);yticks([0]);
ylabel('pi units');xlabel('frequency in pi units');
subplot(2,2,3); plot(w/pi,db);title('Magnitude in dB');grid on;
axis([0 1 -40 2]);xticks([0 0.2 0.3 1]);yticks([-15 -1 0]);
ylabel('decibels');xlabel('frequency in pi units');
subplot(2,2,4); plot(w/pi,grd);title('Group Delay');grid on;
axis([0 1 0 15]);xticks([0 0.2 0.3 1]);yticks([0 5 10 15]);
ylabel('Samples');xlabel('frequency in pi units');