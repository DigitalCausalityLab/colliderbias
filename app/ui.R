shinyUI(
  dashboardPage(
  # Layout option defined in "R/Packages_Colors.R"
  skin = dashboard_skin,
  # Layout option defined in "R/Packages_Colors.R"
  dbHeader,
  # Adjust Sidebar (left)
  dashboardSidebar(
    sidebarMenu(
      # Item in Sidebar
      # Watch out for `tabName`: Must be matched by definition
      # of the 'tabItem' below
      menuItem("Collider App", tabName = "collider",icon = icon("project-diagram"))
    )
  ),
  # Adjust Body of Dashboard
  dashboardBody(
    # Layout option defined in "R/Packages_Colors.R"
    tags$head(tags$style(HTML("


.box.box-solid.box-primary>.box-header {
  color:#fff;
  background:#000000
                    }

.box.box-solid.box-primary{
border-bottom-color:#000000;
border-left-color:#000000;
border-right-color:#000000;
border-top-color:#000000;
}

                                    "),
                         HTML("


.box.box-solid.box-success>.box-header {
  color:#000000;
  background:#ffda3e
                    }

.box.box-solid.box-success{
border-bottom-color:#ffda3e;
border-left-color:#ffda3e;
border-right-color:#ffda3e;
border-top-color:#ffda3e;
}

                                    ")
                         )),

    # Layout for math formula
    withMathJax(),
    # Layout option defined in "R/Packages_Colors.R"
    chooseSliderSkin(slider_skin,color = slider_color),
    # Boxes need to be put in a row (or column), overall width has to be 12
    tabItems(
      tabItem(tabName = "collider",
              h2("Collider Bias: Movie Star Example"),
              p("Example based on S. Cunningham (2021) 'Causal Inference: The Mixtape', Section 3.6.1. Click on the checkbox to see how scatter plot, regression output and DAG change when we condition on the collider 'movie star'."),
              fluidRow(
                box(
                  title = "Options", solidHeader = TRUE, status = boxcol_1,
                  checkboxInput("moviestar",
                                "Show movie stars only",
                                value = FALSE),
                  checkboxInput("regression_line",
                                "Show regression line",
                                value = TRUE),
                  width = 3
                ),

                box(
                  title = "Scatter Plot", solidHeader = TRUE, status = boxcol_2,
                  plotOutput("star_scatter_plot", height = 450),
                  width = 9
                )

              ),
              h2("Regression Output and Directed Acyclic Graph (DAG)"),
              p("Regression output corresponding to sample selection, i.e., do (not) only condition on movie stars."),
              fluidRow(
                box(
                  title = "Regression Output", solidHeader = TRUE, status = boxcol_1,
                  gt_output("regression_tbl"),
                  width = 3
                ),

                box(
                  title = "DAG", solidHeader = TRUE, status = boxcol_2,
                  plotOutput("moviestar_dag", height = 450),
                  width = 9
                )
              )
      )
    )
  )
)
)
