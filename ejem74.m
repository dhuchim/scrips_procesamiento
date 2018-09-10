clc
clear all
h = [-4,1,-1,-2,5,6,5,-2,-1,1,-4];
M = length(h); n = 0:M-1;

[Hr,w,a,L] = Hr_Type1(h);
a;L;
amax = max(a)+1; amin = min(a)-1;
figure('Name','Ejercicio 7.4','NumberTitle','off')
subplot(2,2,1); stem(n,h); axis([-1 2*L+1 amin amax])
xlabel('n'); ylabel('h(n)'); title('Impulse Response')
subplot(2,2,3); stem(0:L,a); axis([-1 2*L+1 amin amax])
xlabel('n'); ylabel('a(n)'); title('a(n) coefficients')
subplot(2,2,2); plot(w/pi,Hr);grid
xlabel('frequency in pi units'); ylabel('Hr')
title('Type-1 Amplitude Response')
subplot(2,2,4); zplane(h,1);title('Pole–Zero Plot')