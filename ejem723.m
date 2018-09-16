% Pasabajas usando ParksMcClellan
%wp = 0.2pi , ws = 0.3pi ,Rp = 0.25 dB  As = 50 dB


wp = 0.2*pi; ws = 0.3*pi; Rp = 0.25; As = 50;
[delta1,delta2] = db2delta(Rp,As);
[N,f,m,weights] = firpmord([wp,ws]/pi,[1,0],[delta1,delta2]);
h = firpm(N,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
delta_w = 2*pi/1000; wsi=ws/delta_w+1; wpi = wp/delta_w;
Asd = -max(db(wsi:1:501))
N = N+1
h = firpm(N,f,m,weights); [db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(wsi:1:501))
N = N+1;
h = firpm(N,f,m,weights); [db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(wsi:1:501))
N = N+1;
h = firpm(N,f,m,weights); [db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(wsi:1:501))
N = N+1;
h = firpm(N,f,m,weights); [db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(wsi:1:501))
M = N+1;
x = 1:1:501 ;
f = (x>=0)&(x<=99)*1+(x>=152)&(x<=501).*1 ;
pa=f.*mag;
f2=(x<=100).*(mag-1)+(x>100).*0+(x>=150).*(mag);
subplot(2,2,1); stem(h); title('Respuesta al impulso');axis([0 46 -0.1 0.3]);%axis(x1 x2 y1 y2]);%respuesta impulso
subplot(2,2,2); plot(w/pi,db);title('Magnitud'); axis([0 1 -80 10]);%magnitud db
subplot(2,2,3); plot(w/pi,mag);title('Amplitud'); axis([0 1 -0.1 1.1]); %amplitud
subplot(2,2,4); plot(w/pi,f2);title('Error');axis([0 1 -0.0144 0.0144]); grid on
