data {
    int<lower=0> N;
    real weight[N];
}

generated quantities {
   real<lower=0> alpha = normal_rng(150, 10);
   real<lower=0> sigma = inv_gamma_rng(15,1);
   real<lower=0> beta = lognormal_rng(0, 1);
   real height[N];
   for (i in 1:N){
    height[i] = normal_rng(weight[i]*beta+alpha, sigma);
   }
}