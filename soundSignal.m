
numBands = 18;
dt = 0.001;
t = 0:dt:1;
fclean = sin(2*pi*50*t)+2*sin(2*pi*120*t);
f = fclean + 2.4*randn(size(t));


%for i = 1:+1:10
 %   disp(fclean(i));
  %  disp(" ");    
%end

figure;

n = length(t);
fhat = fft(f, n);
PSD = fhat.*conj(fhat)/n;
freq = 1/(dt*n)*(0:n);
L = 1:1:floor(n/2);
%%disp(fhat)

%plot(freq(L), PSD(L));

PSDClean = 0:0:length(PSD);
fhatClean = 0:0:length(fhat);
for i = 1:+1:length(PSD)
    if PSD(i) >= 100
        PSDClean(i) = PSD(i);
        fhatClean(i) = fhat(i);
    
    else
        PSDClean(i) = 0;   
        fhatClean(i) = 0;
    end
        
end

ff = ifft(fhatClean);

plot(freq(L), PSDClean(L));

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









