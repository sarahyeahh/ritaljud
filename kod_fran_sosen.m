%% någonting

close all
%7a
load 'piano1.mat';
%fs = 10000; %varning 5 nollor är too much!!
soundsc(y1, fs);        %y1 = ljudet, fs = samplingsfrekvens

%8a) Ta reda på om synthesizern är stämd. Ettstrukta C ska vara ~ 523 Hz.
% Gör en frekvensanalys.
N = length(y1);  %antal sampel
X = fft(y1);     %utför frekvensanalys, Fouriertransformera via FFT

%Skapa en frekvensaxel med korrekt delning (steg)
%Frekvensaxelns steg blir "samplingsfrekvensen/antal sampel".
% Kan sluta vid halva samplingsfrekvensen, dvs f_sampl/2.
f = 0:(fs/N):(fs/2);

M = size (f,2);       %antal frekvenssteg
figure(9)
plot(f,abs(X(1:M))/2501);       %Rita ut resultatet

%8b 
%den är i princip stämd eftersom första stolpen är på ca 523 hz +-1.1024 Hz
felmarginalen = fs/N %1.1024 HZ


%% phonenumber
close all, clear all
[y,fs] = audioread( '500Hz.wav');

soundsc(y, fs);        %y1 = ljudet, fs = samplingsfrekvens
N = length(y);

%figure (1);
plot (y); 

%Dela upp signalen i intervall för varje ton
y1 = y(1:1100);
y2 = y(1200:2300);
y3 = y(2400:3400);
y4 = y(3600:4600);
y5 = y(4800:5800);
y6 = y(6000:7000);
y7 = y(7200:8200);

%Fouriertransformera signalen för varje ton i telefonnumret
Y1 = fft(y1);
Y2 = fft(y2);
Y3 = fft(y3);
Y4 = fft(y4);
Y5 = fft(y5);
Y6 = fft(y6);
Y7 = fft(y7);

%Skapa en frekvensaxel med korrekt delning (steg)
f1 = 0:(fs/length(Y1)):(fs/2);
f2 = 0:(fs/length(Y2)):(fs/2);
f3 = 0:(fs/length(Y3)):(fs/2);
f4 = 0:(fs/length(Y4)):(fs/2);
f5 = 0:(fs/length(Y5)):(fs/2);
f6 = 0:(fs/length(Y6)):(fs/2);
f7 = 0:(fs/length(Y7)):(fs/2);

%Antal frekvenssteg för varje ton
M = 350;

%Plotta tonerna/signalerna
figure;
plot(f1(1:M),abs(Y1(1:M)));
figure;
plot(f2(1:M),abs(Y2(1:M)));
figure;
plot(f3(1:M),abs(Y3(1:M)));
figure;
plot(f4(1:M),abs(Y4(1:M)));
figure;
plot(f5(1:M),abs(Y5(1:M)));
figure;
plot(f6(1:M),abs(Y6(1:M)));
figure;
plot(f7(1:M),abs(Y7(1:M)));