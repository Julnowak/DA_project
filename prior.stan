data {
    int<lower=0> N; //number of data
    vector[N] income; //covariates
}

generated quantities {
    real alpha = normal_rng(1.26, 0.04);//intercept
    real beta = normal_rng(94800, 2000); //slope
    real<lower=0> sigma = abs(normal_rng(1000,500)); //scatter

    vector[N] y_sim; //simulated data from posterior
    
    for(i in 1:N)
	    y_sim[i] = normal_rng(alpha * income[i] + beta , sigma);
}