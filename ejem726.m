% Filtro de "escalera"

w1 = 0; w2 = 0.3*pi; delta1 = 0.01;
w3 = 0.4*pi; w4 = 0.7*pi; delta2 = 0.005;
w5 = 0.8*pi; w6 = pi; delta3 = 0.001;
weights = [delta3/delta1 delta3/delta2 1];
Dw = min((w3-w2), (w5-w3));
M = ceil((-20*log10((delta1*delta2*delta3)^(1/3))-13)/(2.285*Dw)+1)
M = 51
f = [0 w2/pi w3/pi w4/pi w5/pi 1];
m = [1 1 0.5 0.5 0 0];
h = firpm(M-1,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
delta_w = 2*pi/1000;

w1i=floor(w1/delta_w)+1; w2i = floor(w2/delta_w)+1;
w3i=floor(w3/delta_w)+1; w4i = floor(w4/delta_w)+1;
w5i=floor(w5/delta_w)+1; w6i = floor(w6/delta_w)+1;
Asd = -max(db(w5i:w6i))
M = M-1; 
h = firpm(M-1,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(w5i:w6i))
M = M-1; 
h = firpm(M-1,f,m,weights);
[db,mag,pha,grd,w] = freqz_m(h,[1]);
Asd = -max(db(w5i:w6i))
M
