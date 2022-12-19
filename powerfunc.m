function [pxx, f] = powerfunc(x, Fs)

[pxx,f] = pwelch(x,[],[],[], Fs);
figure; 
plot(f, 10*log10(pxx(:,1)))
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
end