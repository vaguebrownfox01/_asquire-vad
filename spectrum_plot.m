wavfile='4012_Aaa_1_5.wav';
[sig,fs]=audioread(wavfile);

t = 10*(0:1/fs:(length(sig)-1)/fs);


m = length(sig);       % original sample length
n = pow2(nextpow2(m));

y = fft(sig,n);
f = (0:n-1)*(fs/n)/10;

power = abs(y).^2/n;

frequency = f(1:floor(n/2));
amplitude = power(1:floor(n/2));

% get spectral power: fft
n = length(t);
f = fft(sig, n);
PSD = f .* conj(f) / n;
freq = fs / n * (0:n);
L = 1:floor(n / 2);

PSD = PSD(L);
freq = freq(L);

% get max freq component
[~, i] = max(PSD);
m_freq = freq(i);

disp(["m_freq" m_freq]);

plot(t, sig);
plot(frequency, amplitude);

