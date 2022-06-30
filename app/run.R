library(shiny)

port <- Sys.getenv('PORT')

shiny::runApp(
  appDir = paste(getwd(), "/app"),
  host = '0.0.0.0',
  port = as.numeric(port)
)
