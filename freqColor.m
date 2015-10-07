%% l�s in en frekvens och plotta en cirkel med f�rgen f�r den frekvensen
close all, clear all


[y,fs] = audioread( '2000Hz.wav');
plot(y);

soundsc(y, fs); %spelar upp ljudet
L = length(y); %l�ngden av vektorn y

[maxValue,indexMax] = max(abs(fft(y-mean(y)))); %fft
freq = indexMax * fs / L;

%Rita cirklar med olika radier beroende p� amplitud. 
radius= maxValue/100;

if freq>=500 && freq<1000
    color = '.k'; 
    
elseif freq>=1000 && freq<1500
    color = '.r'; 

elseif freq>=1500 && freq<2000
    color = '.g'; 

elseif freq>=2000 && freq<2500
    color = '.b';

else
    color = '.m'; %random f�rg f�r att se om det funkar (magenta). 
    end
    
figure;
%Plotta en fylld cirkel
plot(1, 1, color, 'MarkerSize', radius) %(1,1) avg�r koordinaten. 

