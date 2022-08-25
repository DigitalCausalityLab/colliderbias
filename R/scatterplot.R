# Generate scatter plots
plot_population <- star_is_born %>%
  ggplot(aes(x = talent, y = beauty)) +
  geom_point(size = 0.5, shape=23) +
  xlim(-4, 4) + ylim(-4, 4) +
  theme_minimal()

plot_population_regressionline <- star_is_born %>%
  ggplot(aes(x = talent, y = beauty)) +
  geom_point(size = 0.5, shape=23) +
  stat_smooth(formula = y ~ x, method = "lm", col = "red") +
  xlim(-4, 4) + ylim(-4, 4) +
  theme_minimal()

plot_moviestar <- star_is_born_moviestar %>%
  ggplot(aes(x = talent, y = beauty)) +
  geom_point(size = 0.5, shape=23, alpha = 1) +
   geom_point(size = 0.5, shape=23, alpha = 0.1, data = star_is_born[star_is_born$star == 0,]) +
  xlim(-4, 4) + ylim(-4, 4) +
  theme_minimal()

plot_moviestar_regressionline <- star_is_born_moviestar %>%
  ggplot(aes(x = talent, y = beauty)) +
  geom_point(size = 0.5, shape=23, alpha = 1) +
  stat_smooth(formula = y ~ x, method = "lm", col = "red") +
  geom_point(size = 0.5, shape=23, alpha = 0.1, data = star_is_born[star_is_born$star == 0,]) +
  xlim(-4, 4) + ylim(-4, 4) +
  theme_minimal() +
  theme(legend.position = "none")
