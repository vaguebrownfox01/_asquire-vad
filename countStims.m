close all;
wavfile = 'j_aa.wav';

%%% read audio
[sig, fs] = audioread(wavfile);
t = (1:length(sig))/fs;

figure; 
subplot(3, 1, 1)
plot(t, sig, 'r', 'LineWidth',0.5);


n = length(t);
f = fft(sig, n);
PSD = f.*conj(f)/n;
freq = fs/n*(0:n);
L = 1:floor(n/2);

subplot(3, 1, 3);
plot(freq(L), PSD(L), 'b', 'LineWidth',0.5), hold on;

th = max(PSD) / 8;
i = PSD > th;
PSDclean = PSD.*i;
f = i.*f;
isig = ifft(f);

plot(freq(L), PSDclean(L), "-", 'Color', [.5, .1, 0], 'LineWidth',0.5);


subplot(3, 1, 2);
plot(t, isig, '-', 'Color', [.5 .1 0], 'LineWidth',0.5);
