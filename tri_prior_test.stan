data {
    int<lower=0> N; //number of data
    vector[N] income; //covariates
    vector[N] household;
    vector[N] mean_age;
}

generated quantities {
    real alpha_1 = normal_rng(0.017, 0.001);  //slope 1
    real alpha_2 = normal_rng(0.82, 0.01);  //slope 2
    real alpha_3 = normal_rng(1280, 1);  //slope 3
    real beta = normal_rng(67500, 2000);  //intercept
    real<lower=0> sigma = abs(normal_rng(100,50)); //scatter

    vector[N] y_sim; //simulated data from posterior
    
    for(i in 1:N)
	    y_sim[i] = normal_rng(-alpha_1 * income[i] + alpha_2 * household[i] - alpha_3 * mean_age[i] + beta , sigma);
}