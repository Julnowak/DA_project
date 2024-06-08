// data {
//   int<lower=0>  N; // number of years analyzed
//   vector[N] income; // income by years
// }


// generated quantities {
//   real alpha = normal_rng(0.782, 0.02); // normal prior for alpha
//   real beta = normal_rng(154440, 1000); // normal prior for beta
//   real y_sim[N]; // vector to store simulated values

//   for (n in 1:N) {
//     y_sim[n] = poisson_rng(-alpha*income[n] + beta);
//   }
// }

data {
  int<lower=0> N;            // number of data points
  vector[N] income;               // independent variable
}

generated quantities {
  real alpha = normal_rng(0, 0.0001);                // intercept
  real beta = normal_rng(0, 0.0001);                 // slope

  real y_sim[N]; // vector to store simulated values

  for (n in 1:N) {
    y_sim[n] = poisson_log_rng(alpha*income[n] + beta);
  }
}