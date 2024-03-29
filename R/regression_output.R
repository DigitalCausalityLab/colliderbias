# Generate regression output
reg_population <- star_is_born %>%
  lm(formula = beauty ~ talent) %>%
  tbl_regression %>%
  as_gt()

reg_moviestar <- star_is_born %>%
  filter(star == 1) %>%
  lm(formula = beauty ~ talent) %>%
  tbl_regression %>%
  as_gt()
