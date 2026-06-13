%% Recover sinusoidal components with the FFT
% Generates three known components, adds deterministic random noise, and
% uses a correctly scaled one-sided spectrum to recover their amplitudes.

clear;
close all;
clc;

rng(316);                 % Reproducible noise for portfolio plots
samplingFrequency = 200;  % Samples per second (Hz)
duration = 5;             % Signal duration (s)
t = 0:1/samplingFrequency:duration - 1/samplingFrequency;

signal1 = 3 * sin(2 * pi * 1 * t);
signal5 = 2 * sin(2 * pi * 5 * t);
signal10 = 1 * sin(2 * pi * 10 * t);
combinedSignal = signal1 + signal5 + signal10;

noiseStandardDeviation = 1.5;
noisySignal = combinedSignal + noiseStandardDeviation * randn(size(t));

sampleCount = length(noisySignal);
twoSidedSpectrum = abs(fft(noisySignal) / sampleCount);
oneSidedSpectrum = twoSidedSpectrum(1:floor(sampleCount / 2) + 1);
oneSidedSpectrum(2:end-1) = 2 * oneSidedSpectrum(2:end-1);
frequency = samplingFrequency * (0:floor(sampleCount / 2)) / sampleCount;

targetFrequencies = [1, 5, 10];
recoveredAmplitudes = zeros(size(targetFrequencies));
targetIndices = zeros(size(targetFrequencies));

for k = 1:length(targetFrequencies)
    [~, targetIndices(k)] = min(abs(frequency - targetFrequencies(k)));
    recoveredAmplitudes(k) = oneSidedSpectrum(targetIndices(k));
end

figure('Color', 'w');
subplot(2, 2, 1);
plot(t, signal1, 'LineWidth', 1.1);
hold on;
plot(t, signal5, 'LineWidth', 1.1);
plot(t, signal10, 'LineWidth', 1.1);
grid on;
xlim([0, 2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Components');
legend('1 Hz, A = 3', '5 Hz, A = 2', '10 Hz, A = 1');

subplot(2, 2, 2);
plot(t, combinedSignal, 'b');
grid on;
xlim([0, 2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Clean Combined Signal');

subplot(2, 2, 3);
plot(t, noisySignal, 'Color', [0.35, 0.35, 0.35]);
grid on;
xlim([0, 2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Combined Signal');

subplot(2, 2, 4);
plot(frequency, oneSidedSpectrum, 'b', 'LineWidth', 1.2);
hold on;
plot(frequency(targetIndices), recoveredAmplitudes, 'ro', ...
    'MarkerFaceColor', 'r');
grid on;
xlim([0, 20]);
xlabel('Frequency (Hz)');
ylabel('Recovered amplitude');
title('One-Sided FFT Spectrum');
legend('Spectrum', 'Recovered peaks', 'Location', 'best');

fprintf('Recovered frequency components:\n');
for k = 1:length(targetFrequencies)
    fprintf('  %.0f Hz: estimated amplitude %.4f\n', ...
        targetFrequencies(k), recoveredAmplitudes(k));
end

