data {
  int N; // number of years analyzed
  array[N] real income; // income by years
}


generated quantities {
  real alpha = normal_rng(0.782, 0.02);
  real beta = normal_rng(154440, 15000);

  // real alpha = normal_rng(100000, 15000);

  array[N] int y_sim;

  for (n in 1:N) {
    y_sim[n] = poisson_rng(alpha*income[n] + beta);
  }
}