set.seed(42)

star_is_born <- tibble(
  beauty = rnorm(2500),
  talent = rnorm(2500),
  score = beauty + talent,
  c85 = quantile(score, .85),
  star = ifelse(score>=c85,1,0)
)

star_is_born_no_moviestar = star_is_born %>% filter(star == 0)

star_is_born_moviestar = star_is_born %>% filter(star == 1)
