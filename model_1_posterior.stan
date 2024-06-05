
data {
  int N; // number of years analyzed
  vector[N] income; // income
  int y[N]; // number of married
}
parameters {
  real theta;
  real alpha;
}

model {
  theta ~ normal(0.85, 0.20);
  alpha ~ normal(158000, 15000);
  for (n in 1:N) {
    y[n] ~ poisson(alpha - income[n]*theta);
  }
}

generated quantities {
  int y_sim[N];
  for (n in 1:N) {
    y_sim[n] = poisson_rng(alpha - income[n]*theta);
  }
}
