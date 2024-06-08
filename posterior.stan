data {
  int<lower=0> N; // number of years analyzed
  vector[N] income; // income by years
  int y[N]; // observed data
}

parameters {
  real<lower=0> alpha; // coefficient for income
  real beta; // intercept
}

model {
  // Priors
  alpha ~ normal(0.782, 0.02);
  beta ~ normal(154440, 1000);
  
  // Likelihood
  for (n in 1:N) {
    y[n] ~ poisson(-alpha * income[n] + beta);
  }
}

generated quantities {
  int<lower> y_sim[N];
  for (n in 1:N) {
    y_sim[n] = poisson_rng(-alpha * income[n] + beta);
  }
}