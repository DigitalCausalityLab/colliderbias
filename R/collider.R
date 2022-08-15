# Generate DAGs
collider_unconditional <- collider_triangle(x = "Talent", y = "Beauty", m = "Movie Star") %>%
  ggdag_dseparated(
    text = FALSE,
    use_labels = "label",
    node_size = 16,
    text_size = 3.88,
    label_size = text_size,
    text_col = "#ffffff",
    edge_type = "link_arc",
    stylized = FALSE,
    collider_lines = TRUE) +
  theme_dag(panel.background = element_rect(fill = "#ffffff", colour = "#ffffff"))


collider_conditional <- collider_triangle(x = "Talent", y = "Beauty", m = "Movie Star") %>%
  ggdag_dseparated(
    text = FALSE,
    use_labels = "label",
    node_size = 16,
    text_size = 3.88,
    label_size = text_size,
    text_col = "#ffffff",
    edge_type = "link_arc",
    stylized = FALSE,
    collider_lines = TRUE,
    controlling_for = "m") +
  theme_dag(panel.background = element_rect(fill = "#ffffff", colour = "#ffffff"))
