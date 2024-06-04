data {
  int N;//number of years analyzed
  vector[N] income; //number of miles flown each year
}


generated quantities {
  real theta=fabs(normal_rng(0.0002, 0.00001));
  real alpha = normal_rng(2,0.1);
  int y_sim[N];
  for (n in 1:N) {
    y_sim[n] = poisson_log_rng(alpha + theta*income[n]);
  }
}