clc
clear all
close all
wp = 0.2*pi;
ws = 0.3*pi;
Rp = 1;
As = 15; 
T = 1;
OmegaP = (2/T)*tan(wp/2); 
OmegaS = (2/T)*tan(ws/2);
N =ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(OmegaP/OmegaS)));
fprintf('\n*** Butterworth Filter Order = %2.0f \n',N)
OmegaC = OmegaP/((10^(Rp/10)-1)^(1/(2*N)));
wn = 2*atan((OmegaC*T)/2); 
wn = wn/pi;
[b,a]=butter(N,wn); [b0,B,A] = dir2cas(b,a)
[db,mag,pha,grd,w] = freqz_m(b,a);
%Graficas
figure('Name','Ejemplo 8.21','Numbertitle','off');
subplot(2,2,1); plot(w/pi,mag);title('Magnitude Response');grid on;
axis([0 1 0 1.1]);xticks([0 0.2 0.3 1]);yticks([0 0.1778 0.8913 1]);
ylabel('|H|');xlabel('frequency in pi units');
subplot(2,2,2); plot(w/pi,pha/pi);title('Phase Response');grid on;
axis([0 1 -1 1]);xticks([0 0.2 0.3 1]);yticks([-1 0 1]);
ylabel('pi units');xlabel('frequency in pi units');
subplot(2,2,3); plot(w/pi,db);title('Magnitude in dB');grid on;
axis([0 1 -40 5]);xticks([0 0.2 0.3 1]);yticks([-15 -1 0]);
ylabel('decibels');xlabel('frequency in pi units');
subplot(2,2,4); plot(w/pi,grd);title('Group Delay');grid on;
axis([0 1 0 10]);xticks([0 0.2 0.3 1]);yticks([0 2 4 6 8 10]);
ylabel('Samples');xlabel('frequency in pi units');





