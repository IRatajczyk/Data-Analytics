data {
    int<lower=0> N;
    vector [N] mlf;
}

generated quantities {
    real alpha = normal_rng(3, 0.2);
    real theta = normal_rng(-1e-5,1e-6);
    vector [N] lambda = exp(mlf * theta + alpha);
    int<lower=0> y[N];
    for (i in 1:N) {
        y[i] = poisson_rng(lambda[i]);
    }
}