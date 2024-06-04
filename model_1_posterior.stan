
data {
  int N;//number of years analyzed
  vector[N] income; //number of miles flown each year
  int y[N];//number of fatal accidents
}
parameters {
  real theta;
  real alpha;
}

model {
  theta ~ normal(0.0002, 0.00001);
  alpha ~ normal(2,0.1);
  for (n in 1:N) {
    y[n] ~ poisson_log(alpha + income[n]*theta);
  }
}

generated quantities {
  int y_sim[N];
  for (n in 1:N) {
    y_sim[n] = poisson_log_rng(alpha + income[n]*theta);
  }
}
