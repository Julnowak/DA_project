data {
    int<lower=0> N; //number of data
    vector[N] income; //covariates
    vector[N] household;
}

generated quantities {
    real alpha_1 = normal_rng(0.007, 0.001);  //slope 1
    real alpha_2 = normal_rng(0.75, 0.05);  //slope 2
    real beta = normal_rng(47500, 2000);  //intercept
    real<lower=0> sigma = abs(normal_rng(0,1)); //scatter

    vector[N] y_sim; //simulated data from posterior
    
    for(i in 1:N)
	    y_sim[i] = normal_rng(-alpha_1 * income[i] + alpha_2 * household[i] + beta , sigma);
}