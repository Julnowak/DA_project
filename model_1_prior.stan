data {
  int N; // number of years analyzed
  vector[N] income; // income by years
}


generated quantities {
  real theta = normal_rng(0.85, 0.20);
  real alpha = normal_rng(158000, 15000);
  // real alpha = normal_rng(100000, 15000);
  int y_sim[N];
  for (n in 1:N) {
    y_sim[n] = poisson_rng(alpha - theta*income[n], 10);
  }
}