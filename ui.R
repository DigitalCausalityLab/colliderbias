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
        menuItem("Code", tabName = "code", icon = icon("github")),
        menuItem("References", tabName = "references", icon = icon("book")))
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
                p("This app illustrates the Collider Bias in the context of the Movie Star Example from Cunningham (2021, Section 3.6.1). A CNN blogpost reported that Megan Fox was voted the worst but at the same time the most attractive star in 2009. This suggests the question: Are more attractive actors generally less talented? "),
                h3("Are more Attractive Actors less Talented?"),
                p("We revisit this question and try to disentangle the causal mechanisms using a DAG and a simulated data example. Consider the two characteristics 'talent' and 'beauty'. We simulate a data set such that there is no causal relationship between these two variables, i.e., they are stochastically independent. However, if we condition on a collider, i.e., a variable that is causally affected by 'talent' and 'beauty', we find a significant negative correlation between these two characteristics. The reason for this is the so-called Collider Bias. In the movie star example, such a collider could be a variable that indicates whether a person is a star or not ('star'): More attractive persons and also more talented persons probably have a higher chance to become a movie star. Hence, if we base our analysis on this sample selection, we might draw conclusions that do not hold for the entire population, in general."),
                h3("Data Example: Scatter Plot, Causal Diagram, Regression Output"),
                p("The scatter plot below shows the data points according to the specified sample selection, i.e., consider the entire population or the subsample of movie stars only. The Directed Acyclical Graph (DAG) on the right illustrates the causal relationship in the movie star example. It tells us, whether we can expect to find a significant association in an empirical example. If we condition on the collider, the variables 'talent' and 'beauty' are 'd-connected': We will probably find a correlation of these variables in a data example. If they are 'd-separated', they will probably not be correlated. This is reflected by the regression output shown below. It shows the coefficient estimate and confidence interval from a linear regression of 'beauty' on 'talent' in the simulated data set."),

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
                        p("Output from a linear regression of the variable 'beauty' on 'talent' based on the simulated data set."),
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
        ),
        tabItem(tabName = "code",
                h2("Code"),
                p("The code is available at the GitHub repository",
                  tags$a("https://github.com/DigitalCausalityLab/colliderbias.", href="https://github.com/DigitalCausalityLab/colliderbias")
                ),
                p("In case you find a bug or have suggestion for improvements, please open an issue in",
                  tags$a("GitHub.", href = "https://github.com/DigitalCausalityLab/colliderbias/issues")
                )
        ),
        tabItem(tabName = "references",
                h2("References"),
                p("Cunningham, Scott. “Causal inference.” Causal Inference. Yale University Press, 2021, Section 3.6.1., available", tags$a("online.", href = "https://mixtape.scunning.com/")),
                p("Piazza, Jo. 2009. “Megan Fox Voted Worst - but Sexiest - Actress of 2009.”",
                  tags$a("https://marquee.blogs.cnn.com/2009/12/30/megan-fox-voted-worst-but-sexiest-actress-of-2009/",
                         href = "https://marquee.blogs.cnn.com/2009/12/30/megan-fox-voted-worst-but-sexiest-actress-of-2009/")
                )
        )
      )
    )
  )
)
