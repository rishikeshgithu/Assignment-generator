% Parameters
bit_rate = 1e6;  % Bit rate in bits per second
duration = 1;    % Duration of the signal in seconds
voltage_level = 1;

% Generate Manchester-encoded signal
t = 0:1/(2*bit_rate):duration-1/(2*bit_rate);  % Twice the oversampling
data = randi([0, 1], 1, length(t));
encoded_data = 2 * data - 1;  % Convert 0s to -1s and 1s to 1s
signal = voltage_level * kron(encoded_data, [1, -1]);

% Calculate PSD
fs = 2 * bit_rate * 10;  % Twice the sampling frequency (oversampling)
psd = abs(fft(signal, fs)).^2 / (length(t) * fs);

% Plot PSD
frequencies = linspace(0, fs, length(psd));
plot(frequencies, 10*log10(psd));
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');
title('Power Spectral Density of Manchester Encoding');
