
clear, close all

% get a section of the sound file
[x,fs] = audioread('1000Hz.wav');

%record audio use 
x = x(:,1);             % get the first channel
xmax = max(abs(x));     % find the maximum value
x = x/xmax;             % scalling the signal

% time & discretisation parameters
N = length(x);
t = (0:N-1)/fs;       

% plotting of the spectrogram
figure;

spectrogram(x, 1024, 3/4*1024, [], fs, 'yaxis')

h = colorbar;    %gör en colorbat   
colormap('jet')  %välj färgspektrum

set(h, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(h,'Magnitude, dB');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Spectrogram of the signal')

