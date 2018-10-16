clc
clear all; close all;
wplp = 0.2*pi;
wslp = 0.3*pi;
Rp = 1;
As = 15; 
T = 1; Fs = 1/T;
OmegaP = (2/T)*tan(wplp/2); 
OmegaS = (2/T)*tan(wslp/2);
[cs,ds] = afd_chb1(OmegaP,OmegaS,Rp,As);
[blp,alp] = bilinear(cs,ds,Fs);
wphp = 0.6*pi;
alpha = -(cos((wplp+wphp)/2))/(cos((wplp-wphp)/2))
Nz = -[alpha,1]; Dz = [1,alpha];
[bhp,ahp] = zmapping(blp,alp,Nz,Dz); [C,B,A] = dir2cas(bhp,ahp)
%Graficas
[db,mag,pha,grd,w] = freqz_m(bhp,ahp);
[db2,mag2,pha2,grd2,w2] = freqz_m(blp,alp);
figure('Name','Ejemplo 8.26','Numbertitle','off');
subplot(2,2,1); plot(w2/pi,mag2);title('Lowpass Filter Magnitude Response');grid on;
axis([0 1 0 1]);xticks([0 0.2 1]);yticks([0 0.8913 1]);
ylabel('|H|');xlabel('frequency in pi units');
subplot(2,2,2); plot(w2/pi,db2);title('Lowpass Filter Magnitude in dB');grid on;
axis([0 1 -30 0]);xticks([0 0.2 1]);yticks([-30 -1 0]);
ylabel('decibels');xlabel('frequency in pi units');
subplot(2,2,3); plot(w/pi,mag);title('Highpass Filter Magnitude Response');grid on;
axis([0 1 0 1]);xticks([0 0.6 1]);yticks([0 0.8913 1]);
ylabel('|H|');xlabel('frequency in pi units');
subplot(2,2,4); plot(w/pi,db);title('Highpass Filter Magnitude in dB');grid on;
axis([0 1 -30 0]);xticks([0 0.6 1]);yticks([-30 -1 0]);
ylabel('decibels');xlabel('frequency in pi units');






