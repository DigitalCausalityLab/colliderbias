shinyUI(
  dashboardPage(
    title = "Collider Bias: Movie Star Example",
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
        menuItem("Collider App", tabName = "collider", icon = icon("project-diagram")),
        menuItem("References", tabName = "references", icon = icon("book")),
        menuItem("Code", tabName = "code"))
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
                p("This app illustrates the Movie Star Example from Cunningham (2021, Section 3.6.1). A CNN blogpost reported that Megan Fox was voted the worst but at the same time the most attractive star in 2009. This result might lead to the more general question: Are more attractive actors less talented? "),
                h3("Are more Attractive Actors less Talented?"),
                p("We revisit this question and try to disentangle the causal mechanisms using a DAG and a simulated data example. Consider the two characteristics 'talent' and 'beauty'. We simulate a data set such that there is no causal relationship between these two variables, i.e., they are stochastically independent. However, if we condition on a collider, i.e., a variable that is causally affected by 'talent' and 'beauty', we find a significant negative correlation between these two characteristics. This is the so-called Collider Bias. In the movie star example, such a collider could be a variable that indicates whether a person is a star or not ('star'): More attractive persons and more talented persons probably have a higher chance to become a movie star. Once, we condition our analysis on a sample of movie stars only, one might be tempted to conclude that more attractive actors are less talented."),
                p("The scatter plot below shows the data points according to the chosen sample selection, i.e., show the entire population or movie stars only. Take a look at the DAG that illustrates whether the variables 'beauty' and 'talent' are d-connected or d-separated. The regression output shows whether this result would also be obtained in an empirical analysis based on the simulated data example."),
                h3("Sample Selection and Scatter Plot"),
                fluidRow(
                  box(
                    fluidRow(
                    box(
                      title = "Options", solidHeader = TRUE, status = boxcol_1,
                      checkboxInput("moviestar",
                                    "Show movie stars only",
                                    value = FALSE),
                      checkboxInput("regression_line",
                                    "Show regression line",
                                    value = TRUE),
                      width = 12),
                    box(
                      title = "Regression Output", solidHeader = TRUE, status = boxcol_1,
                      gt_output("regression_tbl"),
                      width = 12)),
                    width = 4
                    ),

                  box(
                    title = "Scatter Plot", solidHeader = TRUE, status = boxcol_2,
                    plotOutput("star_scatter_plot", height = 450),
                    width = 4
                  ),
                  box(
                    title = "DAG", solidHeader = TRUE, status = boxcol_2,
                    plotOutput("moviestar_dag", height = 450),
                    width = 4
                  )

                ),
        )
      )
    )
  )
)
