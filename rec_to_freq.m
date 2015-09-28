%% läs in en frekvens och plotta en cirkel med färgen för den frekvensen
close all, clear all


%Spela in ett ljud, spela upp och plotta

recObj = audiorecorder(44100, 16, 1);

%record your voice for 5 seconds 
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');

%play back the recording
play(recObj);

y = getaudiodata(recObj);

%plotta ljudet
plot(y);

%[y,fs] = audioread( '1000Hz.wav');
fs = 44100;

%soundsc(y, fs); %spelar upp ljudet
L = length(y); %längden av vektorn y

[maxValue,indexMax] = max(abs(fft(y-mean(y)))); %fft
freq = indexMax * fs / L;

%Rita cirklar med olika radier beroende på amplitud. 
radius= maxValue*10;

if freq>=500 && freq<1000
    color = '.k'; 
    
elseif freq>=1000 && freq<1500
    color = '.r'; 

elseif freq>=1500 && freq<2000
    color = '.g'; 

elseif freq>=2000 && freq<2500
    color = '.b';

else
    color = '.m'; %random färg för att se om det funkar (magenta). 
    end
    
figure;
%Plotta en fylld cirkel
plot(1, 1, color, 'MarkerSize', radius) %(1,1) avgör koordinaten. 

