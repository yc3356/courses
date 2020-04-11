data {
  int N_teams;
  int N_games;
  vector[N_teams] prior_score;
  int team_1[N_games];
  int team_2[N_games];
  vector[N_games] score_1;
  vector[N_games] score_2;
  real df;
}
transformed data {
   vector[N_games] dif;
   vector[N_games] sqrt_dif;
   dif = score_1 - score_2;
   for (i in 1:N_games){
     sqrt_dif[i] = 2 *(step(dif[i]) - 0.5)*sqrt(fabs(dif[i]));
   }
}
parameters {
   vector[N_teams] alpha;
   real b;
   real<lower=0> sigma_a;
   real<lower=0> sigma_y;
}
transformed parameters {
   vector[N_teams] a;
   a = b*prior_score + sigma_a*alpha;
}
model {
   alpha ~ normal(0, 1);
   sqrt_dif ~ student_t(df, a[team_1] - a[team_2], sigma_y);
}
generated quantities {
  vector[N_games] y_rep;
  vector[N_games] y_rep_original_scale;
  for (i in 1:N_games){
      y_rep[i] = student_t_rng(df,a[team_1][i] - a[team_2][i],sigma_y);
      y_rep_original_scale[i] = y_rep[i] * fabs(y_rep[i]);
  }
}
