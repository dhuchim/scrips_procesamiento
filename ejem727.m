 
% Band-1: 0 ? ? ? 0.2?, Slope = 1 sam/cycle
% Band-2: 0.4? ? ? ? 0.6?, Slope = 2 sam/cycle
% Band-3: 0.8? ? ? ? ?, Slope = 3 sam/cycle

f = [0 0.2 0.4 0.6 0.8 1]; % in w/pi unis
 m = [0,0.1,0.4,0.6,1.2,1.5]; % magnitude values
 h = firpm(25,f,m,'differentiator');
 [db,mag,pha,grd,w] = freqz_m(h,[1]);
 subplot(2,1,1); stem([0:25],h); title('Impulse Response');
 xlabel('n'); ylabel('h(n)'); axis([0,25,-0.6,0.6])
 set(gca,'XTickMode','manual','XTick',[0,25])
 set(gca,'YTickMode','manual','YTick',[-0.6:0.2:0.6]);
 subplot(2,1,2); plot(w/(2*pi),mag); title('Magnitude Response')
 xlabel('Normalized frequency f'); ylabel('|H|')
 set(gca,'XTickMode','manual','XTick',f/2)
 set(gca,'YTickMode','manual','YTick',[0,0.1,0.4,0.6,1.2,1.5]); grid