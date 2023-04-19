data {
    int<lower=0> N;
    vector [N] mlf;
    int y[N];
}

parameters {
   real alpha;
   real theta;
}

transformed parameters {
   vector [N] lambda = exp(mlf * theta + alpha);
}


model{
   alpha ~ normal(10, .2);
   theta ~ normal(500 ,1);

    for (i in 1:N) {
        y[i] ~ poisson(lambda[i]);
    }
}

generated quantities {
    int<lower=0> r[N];
    for (i in 1:N) {
        r[i] = poisson_rng(lambda[i]);
    }
}