load handel.mat

filename = 'handel.wav';
audiowrite(filename,y,Fs);
[y] = audioread('handel.wav');

samples = 1024;

numBands = 18;

samples_comp = 0;
f = 1:1:1024;
for j = 1:1:73113-1024
    %Make a array of 1024 samples
    for i = 1:1:1024
        f(i) = y(i+j);    
    end
   
    fhat = fft(f, length(f));
     
    PSD = fhat.*conj(fhat)/length(f);

    band = 1:numBands;
    FreqRange = floor(length(PSD)/numBands);
    
    
    k = 1;
    for i = 1:+1:numBands 
        band(i) = 0;
        for m = k:1:FreqRange+k
            band(i) = band(i) + PSD(m); 
            
        end
        k = k+FreqRange;   
    end
    
    disp(band);
       
end

sound(y);
