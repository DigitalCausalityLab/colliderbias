shinyServer(function(input, output) {

  output$star_scatter_plot <- renderPlot({

    if (!input$moviestar) {
      if (input$regression_line) {
        plot <- plot_population_regressionline
      } else {
        plot  <- plot_population
      }
    } else {
      if (input$regression_line) {
        plot <- plot_moviestar_regressionline
      } else {
        plot <- plot_moviestar
      }
    }
    plot
  })

  output$moviestar_dag <- renderPlot({
    if (!input$moviestar) {
      dag <- collider_unconditional
    } else {
      ## Control for Movie star
      dag <- collider_conditional
    }
    # ggdag(collider_dag) + theme_dag()
    dag
  })

  output$regression_tbl <- render_gt({
    if (!input$moviestar) {
      reg_output <- reg_population
    } else {
      reg_output <- reg_moviestar
    }
    reg_output
  })

  # Code to keep app alive after timeout (Heroku timeout after ca. 55 seconds)
  # autoInvalidate <- reactiveTimer(10000)
  # observe({
  #   autoInvalidate()
  #   cat(".")
  # })

})
