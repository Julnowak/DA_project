data {
    int<lower=0> N; //number of data
    vector[N] income; //covariates
    vector[N] y; //variates
}

parameters {
    real alpha;//intercept
    real beta; //slope
    real<lower=0> sigma; //scatter
}

model {
    //priors
    alpha ~ normal(0.8, 0.1);
    beta ~ normal(108000, 2000);
    sigma ~ normal(0,1);
    
    y ~ normal(alpha * income  + beta , sigma); //likelihood
}

generated quantities {
    vector[N] y_sim; //simulated data from posterior
    
    for(i in 1:N)
	    y_sim[i] = normal_rng(alpha * income[i] + beta , sigma);
}