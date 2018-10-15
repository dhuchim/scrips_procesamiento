clc
clear all
close all
wp = 0.2*pi; % digital Passband freq in Hz
ws = 0.3*pi; % digital Stopband freq in Hz
Rp = 1; % Passband ripple in dB
As = 15; % Stopband attenuation in dB 
T = 1; % Set T=1
OmegaP = wp / T; % Prototype Passband freq
OmegaS = ws / T; % Prototype Stopband freq
[cs,ds] = afd_butt(OmegaP,OmegaS,Rp,As);
[b,a] = imp_invr(cs,ds,T); 
[C,B,A] = dir2par(b,a)
[db,mag,pha,grd,w] = freqz_m(b,a);

figure('Name','Ejemplo 8.11','Numbertitle','off');
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
xticks([0 0.2 0.3 1]);yticks([0 2 4 6 8 10]);
ylabel('Samples');xlabel('frequency in pi units');