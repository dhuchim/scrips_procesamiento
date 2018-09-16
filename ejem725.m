% Filtro pasa altas
% ws = 0.6pi, wp = 0.75pi,
% As = 50 dB Rp = 0.5 dB
ws = 0.6*pi; wp = 0.75*pi; Rp = 0.5; As = 50;
[delta1,delta2] = db2delta(Rp,As);
[N,f,m,weights] = firpmord([ws,wp]/pi,[0,1],[delta2,delta1]);
h = firpm(N,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
delta_w = 2*pi/1000; wsi=ws/delta_w; wpi = wp/delta_w;
Asd = -max(db(1:1:wsi));
N = N+2;
h = firpm(N,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(1:1:wsi));
M = N+1;