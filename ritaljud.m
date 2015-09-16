%%Ritaljud 

clc, clear

%dBFS �ndrar amplituden tror jag. 

[y,fs]=audioread('2000Hz.wav');

y = y(:,1);             % get the first channel
ymax = max(abs(y));     % find the maximum value
ya = y/ymax;             % scalling the signal

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


%Rita cirklar med olika radier beroende p� amplitud. 

%Ta reda p� hur mkt ymax kommer att variera s� vet man vad man m�ste
%g�ngra med.
radius= ymax*1000;

%Frekvens f�rg:

%500-1000 Svart '.k'
%1000-1500 R�d '.r'
%1500-2000 Gr�n '.g'
%2000-2500 Bl� '.b'

%Ett f�rs�k till att f� frekvensen att bli ett v�rde (funkar ej)
%frekvens=int32(freq);


%%

%Testar att s�tta frekvensen till ett v�rde
frekvens= 1200;


%Och h�r nedan f�rs�kte jag f� en viss f�rg p� pricken beroende p�
%frekvensen. 

if frekvens>=500 && frekvens<1000
    color = '.k' %Vet dock inte hur man f�r en string to string eller vad det blir...
end

if frekvens>=1000 && frekvens<1500
    '.r' = color; 
end

if frekvens>=1500 && frekvens<2000
    '.g' = color; 
end

if frekvens>=2000 && frekvens<2000
    '.b' = color; 
end

else
    '.m' = color; %random f�rg f�r att se om det funkar (magenta). 
    
%%    
figure;
%Plotta en svart fylld cirkel
%(1, 1, color, 'MarkerSize', radius) %(1,1) avg�r koordinaten. 

%S�h�r skriver man f�r att f� en r�d cirkel:
plot(1, 1, '.r', 'MarkerSize', radius)



