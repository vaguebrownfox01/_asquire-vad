close;
audio_files = dir("grouped_unpackd_audio/eee");
audio_files(1:2)=[];
all_fns = {audio_files(:).name};

fms = zeros(1, length(all_fns));
count = zeros(4, length(all_fns));

for k=1:length(all_fns)
    filename = all_fns{k};

    % input
    [sig, fs] = audioread(filename);
    t = (1:length(sig)) / fs;

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
    fms(k) = freq(i);

    % calc frequency range - r: start, end
    off = 55;
    if (fms(k) - off > 0)
        r.start = fms(k) - off;
    else
        r.start = fms(k) + 5;
    end
    r.end = fms(k) + off;

    pred_count = countStimsL(filename, r, 0.9, 0.2);

    t = split(filename, "_");t = t{length(t)};
    t = split(t, "."); t = t{1};
    true_count = str2double(t);

    disp(["true_count" true_count ";" "pred_count" pred_count]);
    
    count(1, k) = true_count;
    count(2, k) = pred_count;
    count(3, k) = abs(true_count - pred_count);
end

count(4, :) = count(3, :) > 1;

cor = find(count(4, :) == 0);

accuracy = length(cor) / length(count(4, : )) * 100;

figure;
subplot(2, 1, 1);
stem(1: length(fms), fms);

subplot(2, 1, 2);
stem(1: length(count), count(4, :));