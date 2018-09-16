% Transformador Hilbert sobre la banda 0.05? ? ? ? 0.95?

f = [0.05,0.95]; m = [1 1]; h = firpm(50,f,m,'hilbert');
[db,mag,pha,grd,w] = freqz_m(h,[1]);
subplot(2,1,1); stem([0:50],h); title('Impulse Response');
xlabel('n'); ylabel('h(n)'); axis([0,50,-0.8,0.8])
set(gca,'XTickMode','manual','XTick',[0,50])
set(gca,'YTickMode','manual','YTick',[-0.8:0.2:0.8]);
subplot(2,1,2); plot(w/pi,mag); title('Magnitude Response')
xlabel('frequency in pi units'); ylabel('|H|')
set(gca,'XTickMode','manual','XTick',[0,f,1])
set(gca,'YTickMode','manual','YTick',[0,1]);grid