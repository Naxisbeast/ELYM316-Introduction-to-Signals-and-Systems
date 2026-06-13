%% Motion under gravity
% Models vertical displacement using a fixed time step and extracts the
% maximum height, its sample index, and the ground-impact time.

clear;
close all;
clc;

v0 = 30;          % Initial upward velocity (m/s)
g = -9.81;        % Gravitational acceleration (m/s^2)
dt = 0.02;        % Time step (s)
t = 0:dt:6.20;    % Simulation interval (s)

height = v0 .* t + 0.5 .* g .* t.^2;

[maximumHeight, maximumIndex] = max(height);
timeToMaximumHeight = t(maximumIndex);

% Find the first non-positive sample after launch and linearly interpolate
% between the surrounding samples for a more precise impact-time estimate.
groundIndex = find(height <= 0 & t > 0, 1, 'first');

if isempty(groundIndex)
    timeToGround = NaN;
    warning('The ball did not reach the ground during the simulation.');
else
    beforeGround = groundIndex - 1;
    timeToGround = t(beforeGround) + ...
        (0 - height(beforeGround)) * ...
        (t(groundIndex) - t(beforeGround)) / ...
        (height(groundIndex) - height(beforeGround));
end

figure('Color', 'w');
plot(t, height, 'b', 'LineWidth', 1.8);
hold on;
plot(timeToMaximumHeight, maximumHeight, 'ro', ...
    'MarkerFaceColor', 'r', 'DisplayName', 'Maximum height');
yline(0, 'k--', 'Ground level');
grid on;
xlabel('Time (s)');
ylabel('Height (m)');
title('Vertical Motion Under Gravity');
legend('Height', 'Maximum height', 'Ground level', 'Location', 'best');

fprintf('Maximum height: %.4f m\n', maximumHeight);
fprintf('Index at maximum height: %d\n', maximumIndex);
fprintf('Time to maximum height: %.4f s\n', timeToMaximumHeight);
fprintf('Estimated time to hit the ground: %.4f s\n', timeToGround);

% If gravity is incorrectly entered as positive, the parabola opens upward.
% The model then shows increasing height rather than a return to the ground,
% which is inconsistent with the chosen upward-positive sign convention.

