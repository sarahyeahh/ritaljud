
clear, clc, close all

% get a section of the sound file
[x,fs] = audioread('1000Hz.wav');
%record audio use 
x = x(:,1);             % get the first channel
xmax = max(abs(x));     % find the maximum value
x = x/xmax;             % scalling the signal

% time & discretisation parameters
N = length(x);
t = (0:N-1)/fs;       

% plotting of the waveform
figure;
plot(t, x, 'r')
xlim([0 max(t)])
ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
grid on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Normalized amplitude')
title('The signal in the time domain')

% plotting of the spectrogram
figure;
spectrogram(x, 1024, 3/4*1024, [], fs, 'yaxis')
h = colorbar;
set(h, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(h, 'Magnitude, dB');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Spectrogram of the signal')

% spectral analysis
win = hanning(N);       % window
K = sum(win)/N;         % coherent amplification of the window
X = abs(fft(x.*win))/N; % FFT of the windowed signal
NUP = ceil((N+1)/2);    % calculate the number of unique points
X = X(1:NUP);           % FFT is symmetric, throw away second half 
if rem(N, 2)            % odd nfft excludes Nyquist point
  X(2:end) = X(2:end)*2;
else                    % even nfft includes Nyquist point
  X(2:end-1) = X(2:end-1)*2;
end
f = (0:NUP-1)*fs/N;     % frequency vector
X = 20*log10(X);        % spectrum magnitude

% plotting of the spectrum
figure;
semilogx(f, X, 'r') % f=frekvens, x=magnitude
xlim([0 max(f)])
grid on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
title('Amplitude spectrum of the signal')
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')

% plotting of the histogram
figure;
histfit(x)
xlim([-1.1*max(abs(x)) 1.1*max(abs(x))])
grid on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Signal amplitude')
ylabel('Number of samples')
title('Probability distribution of the signal')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
legend('probability distribution of the signal', 'standard normal distribution')

% computing of the autocorrelation
[Rx, lags] = xcorr(x, 'coeff');
d = lags/fs;

% plotting of the autocorrelation
figure;
plot(d, Rx, 'r')
grid on
xlim([-max(d) max(d)])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Delay, s')
ylabel('Autocorrelation')
title('Autocorrelation of the signal')
line([-max(abs(d)) max(abs(d))], [0.02 0.02], 'Color', 'k', 'LineWidth', 2, 'LineStyle', '--');

% Sigma and Mu estimation
[u s] = normfit(x);
sigma = num2str(s);
mu = num2str(u);
disp(['Sigma = ' sigma])
disp(['Mu = ' mu])

% computing of the peak (crest) factor
rms = sqrt(mean(x.^2));
peak = max(abs(x));
Q = 20*log10(peak/rms);
Qstr = num2str(Q);
disp(['Peak (crest) factor Q = ' Qstr ' dB'])

% computing of the dynamic range 
x(x==0) = [];
maxval = peak;
minval = min(abs(x));
D = 20*log10(maxval/minval);
Dstr = num2str(D);
disp(['Dynamic range D = ' Dstr ' dB'])

% computing of the autocorrelation time
ind = find(Rx>0.02, 1, 'last');
RT = (ind-N)/fs;
RTstr = num2str(RT);
disp(['Autocorrelation time = ' RTstr ' sec'])