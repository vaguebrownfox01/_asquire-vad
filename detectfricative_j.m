close all;
wavfile='j_aa.wav';
% fc1=4900;fc2=5100;
% fc1=5000;fc2=6000;
fc1=500;fc2=1000;
engwin=0.9;%in sec
ThPercent=0.2;

%%% read audio
[sig,fs]=audioread(wavfile);

%%% design filter
[b,a]=cheby2(4,40,[fc1 fc2]/(fs/2),'bandpass');
% freqz(b,a)

%%% filter signal
f_sig=filtfilt(b,a,sig);

%%% compute st energy
N=round(engwin*fs);
n_frames = floor(length(f_sig)/N);
st_eng = zeros(n_frames, 1);
T = st_eng;
for i = 0:n_frames-1
    idx_frame = i*N+1:(i+1)*N;
    frame = f_sig(idx_frame);
    st_eng(i+1) = mean(abs(frame)*2);
    T(i+1) = idx_frame(N/2)/fs;
end

%%% detect segments
Th=ThPercent*max(st_eng);
temp=sign(st_eng-Th);
temp1=temp(1:end-1).*temp(2:end);
count = length(find(temp1<0));
count / 2

subplot(211);plot([1:length(sig)]/fs,sig);
subplot(212);plot([1:length(sig)]/fs,f_sig);hold on;
plot(T,st_eng/max(st_eng)*max(f_sig),'g');
plot([T(1) T(end)],[1 1]*ThPercent*max(f_sig),'k');
