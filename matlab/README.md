# MATLAB Portfolio Scripts

This directory contains reproducible MATLAB scripts supporting the five ELYM316 laboratory topics. Each script is self-contained, commented, and configured with the values specified for the portfolio.

| Lab | Script | Main output |
|---:|---|---|
| 1 | [`motion_under_gravity.m`](lab-01-motion-under-gravity/motion_under_gravity.m) | Height signal, maximum height, and impact-time estimate |
| 2 | [`gaussian_distribution_fwhm.m`](lab-02-probability-distributions/gaussian_distribution_fwhm.m) | Gaussian plot and theoretical/estimated FWHM comparison |
| 3 | [`fft_signal_recovery.m`](lab-03-fast-fourier-transforms/fft_signal_recovery.m) | Noisy composite signal and one-sided FFT spectrum |
| 4 | [`radioactive_decay_euler.m`](lab-04-radioactive-decay/radioactive_decay_euler.m) | Euler decay curve, half-life, and time-constant comparison |
| 5 | [`lti_step_impulse_response.m`](lab-05-step-and-impulse-response/lti_step_impulse_response.m) | Transfer-function responses and delayed-step convolution |

## Running the Scripts

Open MATLAB, set the current folder to the relevant lab directory, and run the script by name. Lab 5 uses `tf`, `step`, and `impulse`, which require the Control System Toolbox. The other scripts use core MATLAB functionality.

> **TODO:** Export selected anonymised figures and add them to the [MATLAB plot gallery](../results/matlab-plot-gallery.md).

