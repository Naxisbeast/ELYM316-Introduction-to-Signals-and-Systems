# Radioactive Decay - Lab Summary

## Aim

To model radioactive decay using Euler's method and evaluate how closely a discrete numerical solution follows the theoretical exponential response.

## Method Summary

Starting with 1000 nuclei, the Euler update approximates the differential equation

```text
dN/dt = -N/tau
```

at fixed time increments. The times at which the numerical solution reaches `N0/2` and `N0/e` are used to estimate the half-life and time constant.

## Learning Outcome

The lab demonstrated how continuous-time differential equations can be approximated numerically. Comparing the Euler result with the exact exponential curve also made numerical error and step-size selection visible.

## Personal Evidence

- **Verified mark:** 100%
- **TODO:** Add the estimated half-life and time constant from the submitted report.
- **TODO:** Add the reported numerical errors.
- **TODO:** Add a reflection on how changing the Euler step size affects accuracy.

The full submitted report should be added as `report.pdf`. It contains the completed MATLAB code, plots, calculations, results, and discussion for this lab.

