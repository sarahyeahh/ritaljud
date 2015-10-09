%%Ritaljud 
close all
clc, clear

%dBFS Ändrar amplituden tror jag. 

[y,fs]=audioread('1000Hz.wav');

y = y(:,1);             % get the first channel
ymax = max(abs(y));     % find the maximum value
ya = y/ymax;            % scalling the signal

ydft = fft(y); %fft to transform the original signal into frequency domain
n = length (y); %length of the original signal
% y has even length
ydft = ydft(1:length(y)/2+1);
% create a frequency vector
freq = 0:fs/length(y):fs/2;
shiftfreq = fftshift(freq);

%plot original signal in time domain;
figure;
plot ((1:n)/fs, y);
title('1000Hz.wav in time domain');
xlabel ('second');
grid on;

% plot magnitude in frequency domain
figure; 
plot(freq,abs(ydft));
title('1000Hz.wav in frequency domain');
xlabel ('Hz');
ylabel('Magnitude');
grid on;

% plot phase in frequency domain
figure;
plot(freq,unwrap(angle(ydft)));
title ('1000Hz.wav in frequency domain');
xlabel ('Hz');
ylabel ('Phase');
grid on; 


%Rita cirklar med olika radier beroende på amplitud. 

%Ta reda på hur mkt ymax kommer att variera så vet man vad man måste
%gångra med.
radius= ymax*1000;


for freq = ((0:fs/length(y):fs/2)/(fs*0.001)+1)*4;   % La till detta: /(fs*0.001)+1)*4
if freq>=500 && freq<1000
    color = '.k'; %Vet dock inte hur man får en string to string eller vad det blir...

elseif freq>=1000 && freq<1500
    color = '.r'; 

elseif freq>=1500 && freq<2000
    color = '.g'; 

elseif freq>=2000 && freq<2500
    color = '.b';

else
    color = '.m'; %random färg för att se om det funkar (magenta). 
    end
end  
figure;
%Plotta en fylld cirkel
plot(1, 1, color, 'MarkerSize', radius) %(1,1) avgör koordinaten. 


%Frekvens färg:

%500-1000 Svart '.k'
%1000-1500 Röd '.r'
%1500-2000 Grön '.g'
%2000-2500 Blå '.b'

%%
clear, clc, close all; 
%Pick color from spectrum

%   Vi vill att:
% 1.Vi får en frekvens från det uppspelade ljudet. 
% 2.Beroende på frekvens väljer vi en pixel i x-led på 600 pixlar
%   För att göra detta måste vi normalisera så att frekvensens spektrum
%   anpassar sig med antalet pixlar. 
% 3.När pixeln är vald vill vi veta vilken färg pixeln har. 
% 4.Sedan vill vi applicera denna färg på cirkeln.

A=imread('spectrum_chart.jpg');
image(A)
[x,y]=ginput(1); %En funktion som väljer en pixel och ger koordinat. (vi vill ju göra tvärtom!)
                 %Siffran i parantesen betyderhur många värden man vill ha 

                 
% Några andra testfunktioner:               
%[RGB, c, r] = imread('spectrum_chart.jpg'); %RGB-bilden, c-columns, r-rows

%c = [12 12];
%r = [12 12];
%pixels = impixel(RGB);


