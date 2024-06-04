data {
    int <lower=0> N;
    vector[N] x;
    int <lower=0> y[N];
    real mu_alpha;
    real sig_alpha;
    real mu_theta;
    real sig_theta;
}

parameters {
    real alpha;
    real theta;
}

model {
    alpha ~ normal(mu_alpha, sig_alpha);
    theta ~ normal(mu_theta, sig_theta);

    for (i in 1:N) {
        y[i] ~ poisson(exp(alpha + theta * x[i]));
    }
}

generated quantities {
    int<lower=0> y_pred[N];

    for (n in 1:N){
        y_pred[n] = poisson_rng(exp(alpha + theta * x[n]));
    }
}
