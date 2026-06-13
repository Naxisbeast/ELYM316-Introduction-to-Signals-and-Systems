# Motion Under Gravity - Lab Summary

## Aim

To represent vertical motion under constant gravitational acceleration as a MATLAB-generated signal and extract important physical quantities from the simulated data.

## Method Summary

The simulation uses the kinematic relationship

```text
h(t) = v0*t + 0.5*g*t^2
```

with an initial upward velocity, negative gravitational acceleration, and a fixed time step. MATLAB identifies the highest sampled point and estimates the ground crossing from adjacent samples.

## Learning Outcome

This exercise showed how a physical system can be translated into a sampled signal and analysed computationally. It also demonstrated that the sign convention for gravity directly affects whether the simulated trajectory is physically meaningful.

## Personal Evidence

- **Verified mark:** 87%
- **TODO:** Add the maximum height from the submitted report.
- **TODO:** Add the reported time to maximum height and time to ground impact.
- **TODO:** Add a short reflection comparing the sampled result with the analytical solution.

The full submitted report should be added as `report.pdf`. It contains the completed MATLAB code, plots, calculations, results, and discussion for this lab.

