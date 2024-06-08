
data {
  int N; // number of years analyzed
  array[N] real income; // income
  array[N] int y; // number of married
}
parameters {
  real<lower=0> beta;
  real<lower=0> alpha;
}

model {
  alpha ~ normal(0.782, 0.02);
  beta ~ normal(154440, 15000);
  
  for (n in 1:N) {
    y[n] ~ poisson(alpha*income[n] + beta);
  }
}

generated quantities {
  array[N] int y_sim;
  for (n in 1:N) {
    y_sim[n] = poisson_rng(alpha*income[n] + beta);
  }
}
