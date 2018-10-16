clc
clear all; close all;
wp = 0.2*pi; ws = 0.3*pi; Rp = 1;
As = 15; T = 1; 
OmegaP = (2/T)*tan(wp/2);
OmegaS = (2/T)*tan(ws/2);
ep = sqrt(10^(Rp/10)-1); 
A = 10^(As/20);
OmegaC = OmegaP; 
k = OmegaP/OmegaS; 
k1 = ep/sqrt(A*A-1); 
capk = ellipke([k.^2 1-k.^2]);
capk1 = ellipke([(k1 .^2) 1-(k1 .^2)]);
N = ceil(capk(1)*capk1(2)/(capk(2)*capk1(1)));
fprintf('\n*** Elliptic Filter Order = %2.0f \n',N)
wn = wp/pi; 
[b,a]=ellip(N,Rp,As,wn); [b0,B,A] = dir2cas(b,a)
%Graficas
[db,mag,pha,grd,w] = freqz_m(b,a);
figure('Name','Ejemplo 8.24','Numbertitle','off');
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
axis([0 1 0 15]);xticks([0 0.2 0.3 1]);yticks([0 5 10 15]);
ylabel('Samples');xlabel('frequency in pi units');


