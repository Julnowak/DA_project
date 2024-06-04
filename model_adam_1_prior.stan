data {
    real alpha;
    real income;
}
generated quantities {
    real theta = fabs(normal_rng(0, 0.35));
    int y_sim = poisson_log_rng(alpha + theta * income);
}