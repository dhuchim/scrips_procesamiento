%graficas pendientes
clc;clear all;close all;
c = [1,1]; 
d = [1,5,6];
T = 0.1; 
[b,a] = imp_invr(c,d,T) 
[C,B,A] = sdir2cas(b,a) 
t=0:0.01:3;
[ha,x,t] =impulse(c,d,t);
[db,mag,pha,grd,w] = freqz_m(b,a);
[dba,maga,phaa,wa] = freqs_m(b,a,pi);
subplot(2,1,2); plot(w,mag);title('mag');hold on;axis([0 10 0 3]);

