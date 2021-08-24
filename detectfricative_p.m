close all;
wavfile='data/j_zz.wav';
% fc1=4900;fc2=5100;
fc1=5000;fc2=6000;
%fc1=500;fc2=1000;
engwin=0.9;%in sec
ThPercent=0.09;

%%% read audio
[sig,fs]=audioread(wavfile);

%%% design filter
[b,a]=cheby2(4,40,[fc1 fc2]/(fs/2),'bandpass');
% freqz(b,a)

%%% filter signal
f_sig=filtfilt(b,a,sig);

%%% compute st energy
N=round(engwin*fs);
ind=1:N;
indall=[ind'];
while indall(end,end)<length(f_sig)-N
%     size(indall)
    indall=[indall indall(:,end)+N];
%     pause
end
f_sig_ind=f_sig(indall);
st_eng=mean(f_sig_ind.^2,1);
T=indall(round(N/2),:)/fs;

%%% detect segments
Th=ThPercent*max(st_eng);
temp=sign(st_eng-Th);
temp1=temp(1:end-1).*temp(2:end);
length(find(temp1<0))

subplot(211);plot([1:length(sig)]/fs,sig);
subplot(212);plot([1:length(sig)]/fs,f_sig);hold on;
plot(T,st_eng/max(st_eng)*max(f_sig),'g');
plot([T(1) T(end)],[1 1]*ThPercent*max(f_sig),'k');
