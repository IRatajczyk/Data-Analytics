generated quantities {
   int<lower=1> N = 50;
   real<lower=0, upper=1> p= beta_rng(2, 8); 
   int<lower=0, upper=N> y;
   y = binomial_rng(N, p);
}

