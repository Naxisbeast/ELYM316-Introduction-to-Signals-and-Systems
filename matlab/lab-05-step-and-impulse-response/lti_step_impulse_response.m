%% Step and impulse response of LTI systems
% The first example uses a transfer function. The second demonstrates the
% response to a delayed unit step by convolving it with exp(-3t)u(t).

clear;
close all;
clc;

%% Transfer-function example
% H(s) = (s + 5) / (s^2 + 2s + 5)
numerator = [1, 5];
denominator = [1, 2, 5];
H = tf(numerator, denominator);

t = 0:0.01:10;
[stepOutput, stepTime] = step(H, t);
[impulseOutput, impulseTime] = impulse(H, t);

figure('Color', 'w');
subplot(2, 1, 1);
plot(stepTime, squeeze(stepOutput), 'b', 'LineWidth', 1.6);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Step Response of H(s) = (s + 5)/(s^2 + 2s + 5)');

subplot(2, 1, 2);
plot(impulseTime, squeeze(impulseOutput), 'r', 'LineWidth', 1.6);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Impulse Response of H(s) = (s + 5)/(s^2 + 2s + 5)');

%% Delayed unit-step convolution example
dt = 0.01;
tConvolution = 0:dt:10;
x = double(tConvolution >= 3);                  % x(t) = u(t - 3)
h = exp(-3 * tConvolution);                     % h(t) = exp(-3t)u(t)

% Multiplication by dt approximates the continuous-time convolution
% integral. Truncate the result to the original time interval.
numericalOutput = conv(x, h) * dt;
numericalOutput = numericalOutput(1:length(tConvolution));

% Analytical result: y(t) = (1/3)(1 - exp(-3(t - 3)))u(t - 3)
analyticalOutput = (1 / 3) * ...
    (1 - exp(-3 * (tConvolution - 3))) .* double(tConvolution >= 3);

figure('Color', 'w');
subplot(3, 1, 1);
plot(tConvolution, x, 'b', 'LineWidth', 1.6);
grid on;
xlabel('Time (s)');
ylabel('x(t)');
title('Delayed Unit-Step Input: x(t) = u(t - 3)');

subplot(3, 1, 2);
plot(tConvolution, h, 'r', 'LineWidth', 1.6);
grid on;
xlabel('Time (s)');
ylabel('h(t)');
title('Impulse Response: h(t) = e^{-3t}u(t)');

subplot(3, 1, 3);
plot(tConvolution, numericalOutput, 'k', 'LineWidth', 1.6);
hold on;
plot(tConvolution, analyticalOutput, 'g--', 'LineWidth', 1.4);
grid on;
xlabel('Time (s)');
ylabel('y(t)');
title('Output for the Delayed Unit-Step Input');
legend('Numerical convolution', 'Analytical output', 'Location', 'best');

