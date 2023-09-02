% Parameters
bit_rate = 1e6;  % Bit rate in bits per second
duration = 1;    % Duration of the signal in seconds
voltage_level = 1;

% Generate Bipolar NRZ signal
t = 0:1/bit_rate:duration-1/bit_rate;
data = randi([0, 1], 1, length(t));
data(data == 0) = -1;  % Convert 0s to -1s
signal = voltage_level * data;

% Calculate PSD
fs = bit_rate * 10;  % Sampling frequency (oversampling)
psd = abs(fft(signal, fs)).^2 / (length(t) * fs);

% Plot PSD
frequencies = linspace(0, fs, length(psd));
plot(frequencies, 10*log10(psd));
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');
title('Power Spectral Density of Bipolar NRZ');
