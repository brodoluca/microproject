function magnitude = goertzel_filter(signal, targetFrequency, samplingRate)
    N = length(signal); % Length of the signal
    k = round(N * targetFrequency / samplingRate); % Bin frequency
    w = 2 * pi * k / N; % Angular frequency
    cosine = cos(w);
    coefficient = 2 * cosine;

    s = zeros(N, 1); % First intermediate variable
    sprev = 0; % Previous s[n-1]
    sprev2 = 0; % Previous s[n-2]

    % Iterate through the signal
    for n = 1:N
        s(n) = signal(n) + coefficient * sprev - sprev2;
        sprev2 = sprev;
        sprev = s(n);
    end

    % Compute the magnitude
    sN = s(N);
    sNprev = s(N-1);
    magnitude = sqrt(sN^2 + sNprev^2 - sN * sNprev * coefficient);

    % Compute the FFT
    f = (0:N-1) * (samplingRate / N);
    fftSignal = abs(fft(signal));

    % Plot the signal, intermediate values, and FFT
    figure;
    subplot(3, 1, 1);
    plot(signal);
    xlabel('Sample');
    ylabel('Amplitude');
    title('Input Signal');

    subplot(3, 1, 2);
    plot(s);
    xlabel('Sample');
    ylabel('s[n]');
    title('Goertzel Algorithm - Intermediate Values');

    subplot(3, 1, 3);
    plot(f, fftSignal);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Frequency Spectrum (FFT)');
end
