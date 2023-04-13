generated quantities {
   real<lower=0> mu = normal_rng(158, 10);
   real<lower=0> sigma = inv_gamma_rng(15,1);
   real<lower=0> height = normal_rng(mu, sigma);
}
