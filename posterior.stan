data {
    int<lower=0> N; //number of data
    array[N] real income; //covariates
    array[N] real y; //variates
}

parameters {
    real alpha;//intercept
    real beta; //slope
    real<lower=0> sigma; //scatter
}

model {
    //priors
    alpha ~ normal(1.26, 0.04);
    beta ~ normal(94800, 2000);
    sigma ~ normal(1000,500);
    
    for(i in 1:N)
        y ~ normal(alpha * income[i]  + beta , sigma); //likelihood
}

generated quantities {
    array[N] real y_sim; //simulated data from posterior
    array[N] real log_lik;

    for(i in 1:N){
        y_sim[i] = normal_rng(alpha * income[i] + beta , sigma);
        log_lik[i] = normal_lpdf(y[i] | alpha * income[i] + beta , sigma);
    }
	    
}