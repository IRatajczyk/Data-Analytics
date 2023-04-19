data {
    int<lower=0> N;
    vector [N] mlf;
    int y[N];
}

parameters {
   vector [N] alpha;
   real theta;
}

transformed parameters {
   vector [N] lambda = exp(mlf * theta + alpha);
}


model{
   alpha ~ normal(3, .2);
   theta ~ normal(50 ,1);

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