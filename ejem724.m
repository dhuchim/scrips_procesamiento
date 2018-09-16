%Filtro pasabandas
% w1s = 0.2pi, w1p = 0.35pi
% w2p = 0.65pi, w2s = 0.8pi Rp = 1 dB ; As = 60 db
ws1 = 0.2*pi; wp1 = 0.35*pi; wp2 = 0.65*pi; ws2 = 0.8*pi;
Rp = 1.0; As = 60;
[delta1,delta2] = db2delta(Rp,As);
f = [ws1,wp1,wp2,ws2]/pi; m = [0,1,0]; delta = [delta2,delta1,delta2];
[N,f,m,weights] = firpmord(f,m,delta);
h = firpm(N,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
delta_w=2*pi/1000;
ws1i=floor(ws1/delta_w)+1; wp1i = floor(wp1/delta_w)+1;
ws2i=floor(ws2/delta_w)+1; wp2i = floor(wp2/delta_w)+1;
Asd = -max(db(1:1:ws1i))
N = N+1;
h = firpm(N,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(1:1:ws1i));
N = N+1;
h = firpm(N,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = 61.2843
y=1;
M = N+1
subplot(2,2,1); stem(h); title('Respuesta al impulso');axis([0 30 -0.4 0.5]);%axis(x1 x2 y1 y2]);%respuesta impulso
subplot(2,2,2); plot(w/pi,db);title('Magnitud'); axis([0 1 -80 10]);%magnitud db
subplot(2,2,3); plot(w/pi,mag);title('Amplitud'); axis([0 1 -0.1 1.1]); %amplitud


