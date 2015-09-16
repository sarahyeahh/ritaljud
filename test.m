f='1000Hz.wav';              
[x,sr]=wavread(f) ;    
Ts=1/sr;                         
N=2^15;
x=x(1:N)';                   
time=Ts*(0:length(x)-1);       
figure(1)
magx=abs(fft(x));               
ssf=(0:N/2-1)/(Ts*N);             
plot(ssf,magx(1:N/2))

