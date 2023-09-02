% Parameters
bit_rate = 1e6;  % Bit rate in bits per second
duration = 1;    % Duration of the signal in seconds
voltage_levels = [0, 1];  % Define voltage levels for 0 and 1
carrier_frequency = 10e6;  % Carrier frequency in Hz
modulation_index = 0.5;  % Modulation index for ASK

% Generate ASK-modulated signal
t = 0:1/bit_rate:duration-1/bit_rate;
data = randi([0, 1], 1, length(t));
signal = zeros(1, length(t));
for i = 1:length(t)
    signal(i) = voltage_levels(data(i) + 1) * cos(2 * pi * carrier_frequency * t(i));
end

% Calculate PSD
fs = bit_rate * 10;  % Sampling frequency (oversampling)
psd = abs(fft(signal, fs)).^2 / (length(t) * fs);

% Plot PSD
frequencies = linspace(0, fs, length(psd));
plot(frequencies, 10*log10(psd));
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');
title('Power Spectral Density of ASK Modulation');
