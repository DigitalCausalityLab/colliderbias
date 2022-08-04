shinyServer(function(input, output) {

  output$star_scatter_plot <- renderPlot({

    if (!input$moviestar) {
      data_plot <- star_is_born
    } else {
      data_plot <- star_is_born %>%
        filter(star == 1)
    }

    plot <- data_plot %>%
      ggplot(aes(x = talent, y = beauty)) +
      geom_point(size = 0.5, shape=23) +
      xlim(-4, 4) + ylim(-4, 4) +
      theme_minimal()

    if (input$regression_line) {
      plot <- plot +
        stat_smooth(method = "lm", col = "red")
    }
    plot
  })

  output$moviestar_dag <- renderPlot({
    if (!input$moviestar) {
      dag <- collider_triangle(x = "Talent", y = "Beauty", m = "Movie Star") %>%
        ggdag_dseparated(
          text = FALSE,
          use_labels = "label",
          node_size = 16,
          text_size = 3.88,
          label_size = text_size,
          text_col = "#ffffff",
          edge_type = "link_arc",
          stylized = FALSE,
          collider_lines = TRUE
        )
    } else {
      ## Control for Movie star
      dag <- collider_triangle(x = "Talent", y = "Beauty", m = "Movie Star") %>%
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
          controlling_for = "m"
        )
    }
    # ggdag(collider_dag) + theme_dag()
    dag + theme_dag(panel.background = element_rect(fill = "#ffffff", colour = "#ffffff"))
  })

  output$regression_tbl <- render_gt({
    if (!input$moviestar) {
      data_plot <- star_is_born
    } else {
      data_plot <- star_is_born %>%
        filter(star == 1)
    }
    reg_moviestar <- lm(beauty ~ -1 + talent, data_plot)
    as_gt(tbl_regression(reg_moviestar))

  })
})
