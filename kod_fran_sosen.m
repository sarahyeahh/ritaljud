%% n�gonting

close all
%7a
load 'piano1.mat';
%fs = 10000; %varning 5 nollor �r too much!!
soundsc(y1, fs);        %y1 = ljudet, fs = samplingsfrekvens

%8a) Ta reda p� om synthesizern �r st�md. Ettstrukta C ska vara ~ 523 Hz.
% G�r en frekvensanalys.
N = length(y1);  %antal sampel
X = fft(y1);     %utf�r frekvensanalys, Fouriertransformera via FFT

%Skapa en frekvensaxel med korrekt delning (steg)
%Frekvensaxelns steg blir "samplingsfrekvensen/antal sampel".
% Kan sluta vid halva samplingsfrekvensen, dvs f_sampl/2.
f = 0:(fs/N):(fs/2);

M = size (f,2);       %antal frekvenssteg
figure(9)
plot(f,abs(X(1:M))/2501);       %Rita ut resultatet

%8b 
%den �r i princip st�md eftersom f�rsta stolpen �r p� ca 523 hz +-1.1024 Hz
felmarginalen = fs/N %1.1024 HZ


%% phonenumber
close all, clear all
[y,fs] = audioread( '500Hz.wav');

soundsc(y, fs);        %y1 = ljudet, fs = samplingsfrekvens
N = length(y);

%figure (1);
plot (y); 

%Dela upp signalen i intervall f�r varje ton
y1 = y(1:1100);

%Fouriertransformera signalen f�r varje ton i telefonnumret
Y1 = fft(y1);

%Skapa en frekvensaxel med korrekt delning (steg)
f1 = 0:(fs/length(Y1)):(fs/2);

%Antal frekvenssteg f�r varje ton
M = 350;

%Plotta tonerna/signalerna
figure;
plot(f1(1:M),abs(Y1(1:M)));
