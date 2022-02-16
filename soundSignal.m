load handel.mat

filename = 'handel.wav';
audiowrite(filename,y,Fs);
Fs = 8000;
[y] = audioread('handel.wav');

%sound(y,Fs);
%audio_path = 'C:\Users\vyasp\PC\Downloads';
%[Audio, sampleRate] = audioread(fullfile(audio_path, 'Sound samples_127-bpm-hip-hop-beat-loop.wav'));
%specgram(Audio(:,1),1024, sampleRate);


numBands = 18;
dt = 0.001;
t = 0:dt:10;
fclean = y;
f = fclean;
%disp(fclean)




%for i = 1:+1:10
 %   disp(fclean(i));
  %  disp(" ");    
%end


figure;

n = length(t);
fhat = fft(f,n);
disp(fhat);

%{
PSD = fhat.*conj(fhat)/n;
freq = 1/(dt*n)*(0:n);
L = 1:1:floor(n/2);
plot(freq(L), PSD(L));


PSDClean = 0:0:length(PSD);

fhatClean = 0:0:length(fhat);
for i = 1:+1:length(PSD)
    if PSD(i) >= 0.01
        PSDClean(i) = PSD(i);
        fhatClean(i) = fhat(i);
    
    else
        PSDClean(i) = 0;   
        fhatClean(i) = 0;
    end
        
end

ff = ifft(fhatClean);

plot(freq(L), PSDClean(L));

sound(ff, Fs);

%Make frequency bands
band = 1:numBands;
disp(band);
Freqrange = floor(length(PSDClean)/numBands);

k = 1;
for i = 1:+1:numBands 
    band(i) = 0;
    for j = k:+1:Freqrange+k
        band(i) = band(i) + PSDClean(j); 
        disp(PSDClean(j))
    end
    k = k+Freqrange;   
end

disp(band)
%}










