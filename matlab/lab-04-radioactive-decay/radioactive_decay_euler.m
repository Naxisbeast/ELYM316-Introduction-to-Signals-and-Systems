%% Radioactive decay using Euler's method
% Simulates first-order exponential decay and estimates the half-life and
% time constant from the numerical data.

clear;
close all;
clc;

N0 = 1000;       % Initial number of nuclei
tau = 1;         % Theoretical time constant (s)
Delta = 0.02;    % Euler time step (s)
t = 0:Delta:5 * tau;

N = zeros(size(t));
N(1) = N0;

for k = 2:length(t)
    decayRate = -N(k - 1) / tau;
    N(k) = N(k - 1) + Delta * decayRate;
end

exactN = N0 * exp(-t / tau);
theoreticalHalfLife = tau * log(2);
theoreticalTimeConstant = tau;

% Estimate threshold crossing times with linear interpolation.
halfLifeIndex = find(N <= N0 / 2, 1, 'first');
experimentalHalfLife = t(halfLifeIndex - 1) + ...
    (N0 / 2 - N(halfLifeIndex - 1)) * ...
    (t(halfLifeIndex) - t(halfLifeIndex - 1)) / ...
    (N(halfLifeIndex) - N(halfLifeIndex - 1));

timeConstantIndex = find(N <= N0 / exp(1), 1, 'first');
experimentalTimeConstant = t(timeConstantIndex - 1) + ...
    (N0 / exp(1) - N(timeConstantIndex - 1)) * ...
    (t(timeConstantIndex) - t(timeConstantIndex - 1)) / ...
    (N(timeConstantIndex) - N(timeConstantIndex - 1));

halfLifeError = abs(experimentalHalfLife - theoreticalHalfLife) / ...
    theoreticalHalfLife * 100;
timeConstantError = abs(experimentalTimeConstant - ...
    theoreticalTimeConstant) / theoreticalTimeConstant * 100;

figure('Color', 'w');
plot(t, N, 'bo-', 'MarkerSize', 3, 'LineWidth', 1.0, ...
    'DisplayName', 'Euler approximation');
hold on;
plot(t, exactN, 'r--', 'LineWidth', 1.8, ...
    'DisplayName', 'Theoretical decay');
yline(N0 / 2, 'k:', 'Half of N_0');
yline(N0 / exp(1), 'm:', 'N_0/e');
grid on;
xlabel('Time (s)');
ylabel('Number of nuclei, N(t)');
title('Radioactive Decay: Euler and Theoretical Solutions');
legend('Location', 'northeast');

fprintf('Theoretical half-life: %.6f s\n', theoreticalHalfLife);
fprintf('Experimental half-life: %.6f s\n', experimentalHalfLife);
fprintf('Half-life percentage difference: %.4f%%\n', halfLifeError);
fprintf('Theoretical time constant: %.6f s\n', theoreticalTimeConstant);
fprintf('Experimental time constant: %.6f s\n', experimentalTimeConstant);
fprintf('Time-constant percentage difference: %.4f%%\n', timeConstantError);

