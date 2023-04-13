data {
    int<lower=0> N;
    real<lower=0> heights[N];
    real weight[N];
}

parameters {
   real alpha;
   real<lower=0> sigma;
   real beta;
}

transformed parameters {
   real mu[N];
    for (i in 1:N){
        mu[i] = beta*weight[i] + alpha;
    }
}

model{
   alpha ~ normal(158, 10);
   sigma ~ inv_gamma(15,1);
   beta ~ lognormal(0,1);

   for (i in 1:N) {
      heights[i] ~ normal(mu[i], sigma);
    }
}

generated quantities {
   real h[N];
    for (i in 1:N) {
        h[i] = normal_rng(mu[i], sigma);
    }
}