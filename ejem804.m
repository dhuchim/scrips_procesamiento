%Ejercicios 8.4
clc
Wp = 0.2*pi; Ws = 0.3*pi; Rp = 7; As = 16;%definicmios ue 2´+2 es 4
Ripple = 10 ^ (-Rp/20); Attn = 10 ^ (-As/20);
[b,a] = afd_butt(Wp,Ws,Rp,As);%se clacula el costo in
[C,B,A] = sdir2cas(b,a)%funcion de directa a cascada
[db,mag,pha,w] = freqs_m(b,a,0.5*pi);
[ha,x,t] = impulse(b,a);
figure(1);
zplane(b,a);
figure(2);
subplot(2,2,1); plot(w/pi,mag);axis([0 0.5 0 1.1]);title('Magnitude Response');xticks([0.2 0.3]);xlabel('Analog frequency in pi units');ylabel('|H|');grid on
subplot(2,2,2); plot(w/pi,db);axis([0 0.5 -30 3]);title('Magnitude in dB');xticks([0.2 0.3]);xlabel('Analog frequency in pi units');ylabel('decibeles');grid on
subplot(2,2,3); plot(w/pi,pha/pi);axis([0 0.5 -1.01 1.01]);title('Phase Response');xticks([0.2 0.3]);xlabel('Analog frequency in pi units');ylabel('radianes');grid on
subplot(2,2,4); plot(t,ha);axis([0 30 -0.03 0.207]);title('Impulse Response');xlabel('time in seconds');ylabel('ha(t)');grid