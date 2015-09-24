clear all;
close all;

f='1000Hz.wav';              
[x,sr]=audioread(f) ;    
Ts=1/sr;                         
N=2^15;
x=x(1:N)';                   
time=Ts*(0:length(x)-1);       
figure(1)
magx=abs(fft(x));               
ssf=(0:N/2-1)/(Ts*N);             
plot(ssf,magx(1:N/2))


%% Inte det här vi vill ha... Tvärtom!

im = imread('spectrum_chart.jpg');
n = 1;
image(im)
[x,y] = ginput(n);
x = floor(x);
y = floor(y);
colour = im(y,x,:);
[r,c,t] = size(im);
R = colour(1,1,1);
G = colour(1,1,2);
B = colour(1,1,3);
RGB = [R G B];
Red = im(:,:,1);
Green = im(:,:,2);
Blue = im(:,:,3);
%[i1 j1] = find(Red == colour(:,:,1));
%[i2 j2] = find(Green == colour(:,:,2));
%[i3 j3] = find(Blue == colour(:,:,3));
[i j] = find( sqrt((double(Red) - R).^2 + (double(Green) - G).^2 + (double(Blue) - B).^2) <= COLORTOLERANCE );

%%

im = imread('spectrum_chart.jpg');
h = image(im);

set(impixelinfo,'Position',[5 1 300 20]);
