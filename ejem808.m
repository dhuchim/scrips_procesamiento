clc
Wp = 0.2*pi; Ws = 0.3*pi; Rp = 1; As = 16;
Ripple = 10 ^ (-Rp/20); Attn = 10 ^ (-As/20);
% Analog filter design:
[b,a] = afd_elip(Wp,Ws,Rp,As);
% Calculation of second-order sections:
[C,B,A] = sdir2cas(b,a)
% Calculation of Frequency Response:
[db,mag,pha,w] = freqs_m(b,a,0.5*pi);
% Calculation of Impulse response:
[ha,x,t] = impulse(b,a);
subplot(2,2,1); plot(w/pi,mag);axis([0 0.5 0 1.1]);title('Magnitude Response');
xticks([0 0.2 0.3 0.5]);yticks([0.1585 0.8913 1]);xlabel('Analog frequency in pi units');ylabel('|H|');grid on
subplot(2,2,2); plot(w/pi,db);axis([0 0.5 -30 3]);title('Magnitude in dB');
xticks([0 0.2 0.3 0.5]);yticks([-30 -16 -1 0]);xlabel('Analog frequency in pi units');ylabel('decibeles');grid on
subplot(2,2,3); plot(w/pi,pha/pi);axis([0 0.5 -1.01 1.01]);title('Phase Response')
;xticks([0 0.2 0.3 0.5]);xlabel('Analog frequency in pi units');ylabel('radianes');grid on
subplot(2,2,4); plot(t,ha);axis([0 50 -0.07 0.28]);title('Impulse Response');
xlabel('time in seconds');ylabel('ha(t)');grid on