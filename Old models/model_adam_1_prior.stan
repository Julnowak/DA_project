data {
    real alpha;
    real income;
}
generated quantities {
    real theta = fabs(normal_rng(0.00002, 0.05));
    int y_sim = poisson_log_rng(alpha + theta * income);
}