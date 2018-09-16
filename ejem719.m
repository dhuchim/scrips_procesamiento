%diferenciador digital 
clc
M = 33; alpha = (M-1)/2; Dw = 2*pi/M; l = 0:M-1; wl = Dw*l;
k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;
Hrs = [j*Dw*k1,-j*Dw*(M-k2)];
angH = [-alpha*Dw*k1, alpha*Dw*(M-k2)];
H = Hrs.*exp(j*angH); h = real(ifft(H,M)); [Hr,ww,a,P]=Hr_Type3(h);
 
subplot(2,1,1); plot(ww/pi,Hr/pi); axis([0 1 -0.5 2]);title('Differentiator, frequency sampling design : M = 33');
subplot(2,1,2); stem(h);axis([0 32 -1.2 1.2]);title('Impulse response');
