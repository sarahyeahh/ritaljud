%%Ritaljud 

clc, clear

%dBFS Ändrar amplituden tror jag. 

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


%Rita cirklar med olika radier beroende på amplitud. 

%Ta reda på hur mkt ymax kommer att variera så vet man vad man måste
%gångra med.
radius= ymax*1000;

%Frekvens färg:

%500-1000 Svart '.k'
%1000-1500 Röd '.r'
%1500-2000 Grön '.g'
%2000-2500 Blå '.b'

%Ett försök till att få frekvensen att bli ett värde (funkar ej)
%frekvens=int32(freq);


%%

%Testar att sätta frekvensen till ett värde
frekvens= 1200;


%Och här nedan försökte jag få en viss färg på pricken beroende på
%frekvensen. 

if frekvens>=500 && frekvens<1000
    color = '.k' %Vet dock inte hur man får en string to string eller vad det blir...
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
    '.m' = color; %random färg för att se om det funkar (magenta). 
    
%%    
figure;
%Plotta en svart fylld cirkel
%(1, 1, color, 'MarkerSize', radius) %(1,1) avgör koordinaten. 

%Såhär skriver man för att få en röd cirkel:
plot(1, 1, '.r', 'MarkerSize', radius)



