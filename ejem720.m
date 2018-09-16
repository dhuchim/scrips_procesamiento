%transformador Hilbert digital de 51 puntos 
clc
M = 51; alpha = (M-1)/2; Dw = 2*pi/M; l = 0:M-1; wl = Dw*l;
k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;
Hrs = [0,-j*ones(1,(M-3)/2),-0.39j,0.39j,j*ones(1,(M-3)/2)];
angH = [-alpha*Dw*k1, alpha*Dw*(M-k2)];
H = Hrs.*exp(j*angH); h = real(ifft(H,M)); [Hr,ww,a,P]=Hr_Type3(h);
subplot(2,1,1); plot(ww/pi,abs(Hr),wl(1:M)/pi,Hrs(1:M)+1,'o'); axis([0 1 0 2]);title('Hilbert Transformer, frequency sampling design : M = 51');
subplot(2,1,2); stem(h);axis([0 50 -1 1]);title('Impulse response');