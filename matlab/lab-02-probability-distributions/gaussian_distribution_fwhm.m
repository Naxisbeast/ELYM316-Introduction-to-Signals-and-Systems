%% Gaussian distribution and full width at half maximum
% Compares the theoretical Gaussian FWHM with a numerical estimate obtained
% from densely sampled distribution data.

clear;
close all;
clc;

mu = 0;
sigma = 1;
x = -5 * sigma:0.001 * sigma:5 * sigma;

gaussian = (1 / (sigma * sqrt(2 * pi))) .* ...
    exp(-0.5 .* ((x - mu) ./ sigma).^2);

theoreticalFWHM = 2 * sigma * sqrt(2 * log(2));
halfMaximum = max(gaussian) / 2;

% Locate the samples nearest the left and right half-maximum crossings.
aboveHalfMaximum = find(gaussian >= halfMaximum);
leftIndex = aboveHalfMaximum(1);
rightIndex = aboveHalfMaximum(end);
estimatedFWHM = x(rightIndex) - x(leftIndex);
percentageDifference = abs(estimatedFWHM - theoreticalFWHM) / ...
    theoreticalFWHM * 100;

figure('Color', 'w');
plot(x, gaussian, 'b', 'LineWidth', 1.8);
hold on;
yline(halfMaximum, 'k--', 'Half maximum');
xline(x(leftIndex), 'r--', 'Left crossing');
xline(x(rightIndex), 'r--', 'Right crossing');
grid on;
xlabel('x');
ylabel('Probability density');
title('Gaussian Distribution and FWHM');
legend('Gaussian distribution', 'Half maximum', ...
    'Left crossing', 'Right crossing', 'Location', 'best');

fprintf('Mean (mu): %.4f\n', mu);
fprintf('Standard deviation (sigma): %.4f\n', sigma);
fprintf('Theoretical FWHM: %.6f\n', theoreticalFWHM);
fprintf('Estimated FWHM: %.6f\n', estimatedFWHM);
fprintf('Percentage difference: %.4f%%\n', percentageDifference);

