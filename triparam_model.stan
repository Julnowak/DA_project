data {
    int<lower=0> N; //number of data
    vector[N] income; //covariates
    vector[N] household;
}

generated quantities {
    real alpha = normal_rng(0.8, 0.1);;//intercept
    real beta = normal_rng(108000, 2000);; //slope
    real<lower=0> sigma = fabs(normal_rng(0,1)); //scatter

    vector[N] y_sim; //simulated data from posterior
    
    for(i in 1:N)
	    y_sim[i] = normal_rng(alpha * income[i] + beta , sigma);
}