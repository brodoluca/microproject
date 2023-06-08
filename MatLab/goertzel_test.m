% Generate a test signal with a 1000 Hz tone
samplingRate = 8000; % Sampling rate in Hz
duration = 1; % Signal duration in seconds
t = 0:1/samplingRate:duration-1/samplingRate; % Time vector
f = 1000; % Frequency of the tone in Hz
frequencies = [1000, 2000, 3000, 4000, 5000];
%signal = sin(2*pi*frequencies*t); % Signal with a 1000 Hz tone
signal = sum(sin(2*pi*frequencies.'*t))
targetFrequency = 1; % Frequency of interest in Hz

magnitude = goertzel_filter(signal, targetFrequency, samplingRate);
disp(magnitude);
