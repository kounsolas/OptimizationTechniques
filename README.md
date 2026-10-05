# Optimization Techniques

MATLAB code for the Optimization Techniques course at Aristotle University of Thessaloniki. A genetic algorithm approximates the function

$$f(u_1, u_2) = \sin(u_1 + u_2)\,\sin(u_2^2), \qquad u_1 \in [-1, 2],\ u_2 \in [-2, 1]$$

with a sum of 15 two-dimensional Gaussians.

## Method

- **Chromosome:** 75 genes, 5 per Gaussian: amplitude, the two centres $c_1, c_2$ and the two widths $\sigma_1, \sigma_2$.
- **Population:** 100 chromosomes, initialised randomly within bounds derived from the range of $f$.
- **Fitness:** $10 / (1 + \text{MSE})$, where the MSE is computed on a 25 × 25 grid over the domain.
- **Selection:** roulette-wheel selection of the best half of the population.
- **Crossover:** intermediate crossover, $\text{child} = \beta\,p_1 + (1-\beta)\,p_2$ with $\beta \in [-0.25, 1.25]$.
- **Mutation:** each generation, randomly picked chromosomes are re-randomised with probability 0.1.

## Files

| File | Purpose |
|---|---|
| `main.m` | Runs the genetic algorithm |
| `generateChromosome.m` | Creates a random chromosome |
| `calculateBoundaries.m` | Computes the gene bounds from the range of $f$ |
| `bestfitness.m`, `MSEcalculation.m` | Fitness of each chromosome |
| `selection.m` | Roulette-wheel selection |
| `intermediateCrossover.m` | Crossover operator |
| `mutation.m` | Mutation operator |
| `f.m`, `fittingFunction.m` | Target function and the Gaussian sum built from a chromosome |
| `test.m` | Plots the error curve and compares the best approximation with $f$ |
| `test5.mat`, `test6.mat` | Saved results after 15,000 and 10,000 generations |

`crossover.m`, `MSE.m` and `roulette_wheel_selection.m` are earlier versions kept for reference.

## Run

Open MATLAB in the repository folder and run `main` to train, or `test` to plot the saved results.

Requires the Symbolic Math Toolbox.
