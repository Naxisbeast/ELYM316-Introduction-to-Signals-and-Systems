# Step and Impulse Response of LTI Systems - Lab Summary

## Aim

To investigate how an LTI system responds to standard test signals and to calculate the output produced by a delayed unit-step input.

## Method Summary

MATLAB's transfer-function tools are used for

```text
H(s) = (s + 5) / (s^2 + 2s + 5)
```

to obtain its step and impulse responses. A separate convolution example uses `x(t) = u(t - 3)` and `h(t) = exp(-3t)u(t)` to model the delayed output.

## Learning Outcome

The lab strengthened the connection between transfer functions, impulse responses, convolution, and observable time-domain behaviour. The delayed-input example also illustrated time invariance directly.

## Personal Evidence

- **Verified mark:** 95%
- **TODO:** Add key response characteristics discussed in the submitted report.
- **TODO:** Add the final transfer-function and delayed-output plots.
- **TODO:** Add a reflection on the relationship between the impulse and step responses.

The full submitted report should be added as `report.pdf`. It contains the completed MATLAB code, plots, calculations, results, and discussion for this lab.

