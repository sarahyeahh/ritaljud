%% l�s in en frekvens och plotta en cirkel med f�rgen f�r den frekvensen
close all, clear all


%Spela in ett ljud, spela upp och plotta
recObj = audiorecorder(44100, 16, 2);

%record your voice for 5 seconds 
disp('Start speaking.')
recordblocking(recObj, 2);
disp('End of Recording.');

%play back the recording
play(recObj);

y = getaudiodata(recObj); %Create an array that stores the recorded signal values.

%plotta ljudet
figure;
plot(y);

%[y,fs] = audioread( '1000Hz.wav');
fs = 44100;
%soundsc(y, fs); %spelar upp ljudet
L = length(y); %l�ngden av vektorn y


z = [];
x = [];
for i=1:L
    if ((y(i) < 0.1) && (y(i) > -0.1))
        z(end+1)=y(i);
    else
        x(end+1)=y(i);
    end
end
figure;
plot(x);
 
%vad h�nder h�r?!?!!!
[maxValue,indexMax] = max(abs(fft(x))); %fft
freq = indexMax * fs / length(x);

%Rita cirklar med olika radier beroende p� amplitud. 
radius= 100;

if freq>=100 && freq<500
    color = '.y'; 
elseif freq>=500 && freq<1000
    color = '.r';  
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

%BILDEN
myimage1 = imread('Fosseboll.jpg');
figure
imshow(myimage1);


myimage2 =double((myimage1)/255);%normera bilden
figure 
imshow(myimage2);   %tecknad bild

%visa bildens r�da kanal
RGB(:,:,1)= myimage1(:,:,1);
RGB(:,:,2) = 0*myimage1(:,:,2);
RGB(:,:,3) = 0*myimage1(:,:,3);
figure
imshow(RGB); %r�d bild

HSV= rgb2hsv(myimage1);
% "20% more" saturation:

if freq>=100 && freq<500
    HSV(:, :, 2) = HSV(:, :, 2) * 0; 
elseif freq>=500 && freq<1000
    HSV(:, :, 2) = HSV(:, :, 2) * 0.5;  
elseif freq>=1000 && freq<1500
    HSV(:, :, 2) = HSV(:, :, 2) * 1;
elseif freq>=1500 && freq<2000
   HSV(:, :, 2) = HSV(:, :, 2) * 1.5;
elseif freq>=2000 && freq<2500
    HSV(:, :, 2) = HSV(:, :, 2) * 2;
else
    HSV(:, :, 2) = HSV(:, :, 2) * 5; 
end
   
HSV(HSV > 1) = 1;  % Limit values
RGB2 = hsv2rgb(HSV);
figure
imshow(RGB2);
