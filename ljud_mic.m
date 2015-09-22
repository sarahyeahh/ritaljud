

recObj = audiorecorder(44100, 16, 2);

%record your voice for 5 seconds 
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');

%play back the recording
play(recObj);

y = getaudiodata(recObj);

plot(y);