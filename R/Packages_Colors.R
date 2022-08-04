#Loading the required packages ####
library("shiny")
library("ggplot2")
library("shinyWidgets")
library("shinydashboard")
library("dplyr")
library("plotly")
library("data.table")
library("RColorBrewer")
library("knitr")
library("rmarkdown")
library("gtsummary")
library("gt")
library("ggdag")
library("dagitty")



#defining certain colors and methods ####
dashboard_skin <- "black"
loading_method <- "cube-grid"
loading_color <- "#2980B9"
slider_color <- "#E74C3C"
slider_skin <- "Modern"
PAGE_TITLE <- "Approximation"

linecol1 <- "black"
linecol2 <- "Forestgreen"
linecol3 <- "blue"
linecol4 <- "red"

boxcol_1 <- "primary"
boxcol_2 <- "success"

#logo ####
dbHeader <- dashboardHeader()
dbHeader$children[[2]]$children <-  tags$a(href='https://digitalcausalitylab.github.io',
                                           tags$img(src='DCLklein.png',width='90'))

# define the body ####
body_col <- '/* logo */
.skin-blue .main-header .logo {
background-color: #f4b943;
}
/* logo when hovered */
.skin-blue .main-header .logo:hover {
background-color: #f4b943;
}
/* navbar (rest of the header) */
.skin-blue .main-header .navbar {
background-color: #f4b943;
}
/* main sidebar */
.skin-blue .main-sidebar {
background-color: #f4b943;
}
/* active selected tab in the sidebarmenu */
.skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
background-color: #ff0000;
}
/* other links in the sidebarmenu */
.skin-blue .main-sidebar .sidebar .sidebar-menu a{
background-color: #00ff00;
color: #000000;
}
/* other links in the sidebarmenu when hovered */
.skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
background-color: #ff69b4;
}
/* toggle button when hovered  */
.skin-blue .main-header .navbar .sidebar-toggle:hover{
background-color: #ff69b4;
}
/* body */
.content-wrapper, .right-side {
background-color: #EAEDED;
}'

