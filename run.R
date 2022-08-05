
port <- Sys.getenv('PORT')

shiny::runApp(
  appDir = paste0(getwd()),
  host = '0.0.0.0',
  port = as.numeric(port)
)
