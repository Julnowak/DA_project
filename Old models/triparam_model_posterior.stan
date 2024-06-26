data {
    int<lower=0> N; //number of data
    array[N] real income; 
    array[N] real household;
    array[N] real y;
}

parameters {
    real alpha_1;//slope 1
    real alpha_2;//slope 1
    real beta; //intercept
    real<lower=0> sigma; //scatter
}

model {
    //priors
    alpha_1 ~ normal(0.007, 0.001);
    alpha_2 ~ normal(0.7, 0.05);
    beta ~ normal(47500, 2000);
    sigma ~ normal(1000,500);
    
    for(i in 1:N)
        y ~ normal(-alpha_1 * income[i] + alpha_2 * household[i] + beta , sigma); //likelihood
}

generated quantities {
    array[N] real y_sim; //simulated data from posterior
    array[N] real log_lik;

    for(i in 1:N){
        y_sim[i] = normal_rng(-alpha_1 * income[i] + alpha_2 * household[i] + beta , sigma);
        log_lik[i] = normal_lpdf(y[i] | -alpha_1 * income[i] + alpha_2 * household[i] + beta , sigma);
    }
	    
}