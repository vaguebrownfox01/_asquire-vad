fs = 44100;                    % Sampling frequency (samples per second)
dt = 1/fs;                   % seconds per sample
dur = 0.5;             % seconds
t = (0:dt:dur-dt);     % seconds
F = 2000;                      % Sine wave frequency (hertz)
% beep = sin(2*pi*F*t);

zr05 = zeros(1, 0.5 * fs);
zr1 = zeros(1, 1 * fs);
zr3 = zeros(1, 3 * fs);
beep = sin(2*pi*F*t);
zr2 = zeros(1, 2 * fs);

wt_dur = 5; % sec
wt = wgn(1, wt_dur * fs, 0);

sig = [zr1, beep, zr05, wt, zr05, beep, zr05];

audiowrite("test_white.wav", sig, fs);
