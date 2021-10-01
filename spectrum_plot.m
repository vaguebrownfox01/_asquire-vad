wavfile='4016_Zzz_1_5.wav';
[sig,fs]=audioread(wavfile);

t = 10*(0:1/fs:(length(sig)-1)/fs);


m = length(sig);       % original sample length
n = pow2(nextpow2(m));

y = fft(sig,n);
f = (0:n-1)*(fs/n)/10;

power = abs(y).^2/n;

frequency = f(1:floor(n/2));
amplitude = power(1:floor(n/2));

plot(t, sig);
plot(frequency, amplitude);