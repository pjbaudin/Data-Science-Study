library(shiny)

shinyUI(fluidPage(
        titlePanel("My Shiny App"),
        sidebarLayout(
                sidebarPanel(
                        h2("Installation"),
                        p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
                        code('install.packages("shiny")'),
                        br(),
                        br(),
                        br(),
                        br(),
                        img(src = "bigorb.png", height = 72, width = 72),
                        "shiny is a product of ", 
                        span("RStudio", style = "color:blue")
                ),
                mainPanel(
                        h1("Introducing Shiny"),
                        p("Shiny is a new package from RStudio that makes it ", 
                          em("incredibly easy"), 
                          " to build interactive web applications with R."),
                        br(),
                        p("For an introduction and live examples, visit the ",
                          a("Shiny homepage.", 
                            href = "http://www.rstudio.com/shiny")),
                        br(),
                        h2("Features"),
                        p("* Build useful web applications with only a few lines of code—no JavaScript required."),
                        p("* Shiny applications are automatically “live” in the same way that ", 
                          strong("spreadsheets"),
                          " are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser."),
                        br()
                )
        ),
        fluidRow(
                
                column(3,
                       h3("Buttons"),
                       actionButton("action", label = "Action"),
                       br(),
                       br(), 
                       submitButton("Submit")),
                
                column(3,
                       h3("Single checkbox"),
                       checkboxInput("checkbox", label = "Choice A", value = TRUE)),
                
                column(3, 
                       checkboxGroupInput("checkGroup", 
                                          label = h3("Checkbox group"), 
                                          choices = list("Choice 1" = 1, 
                                                         "Choice 2" = 2, "Choice 3" = 3),
                                          selected = 1)),
                
                column(3, 
                       dateInput("date", 
                                 label = h3("Date input"), 
                                 value = "2014-01-01"))   
        ),
        
        fluidRow(
                
                column(3,
                       dateRangeInput("dates", label = h3("Date range"))),
                
                column(3,
                       fileInput("file", label = h3("File input"))),
                
                column(3, 
                       h3("Help text"),
                       helpText("Note: help text isn't a true widget,", 
                                "but it provides an easy way to add text to",
                                "accompany other widgets.")),
                
                column(3, 
                       numericInput("num", 
                                    label = h3("Numeric input"), 
                                    value = 1))   
        ),
        
        fluidRow(
                
                column(3,
                       radioButtons("radio", label = h3("Radio buttons"),
                                    choices = list("Choice 1" = 1, "Choice 2" = 2,
                                                   "Choice 3" = 3),selected = 1)),
                
                column(3,
                       selectInput("select", label = h3("Select box"), 
                                   choices = list("Choice 1" = 1, "Choice 2" = 2,
                                                  "Choice 3" = 3), selected = 1)),
                
                column(3, 
                       sliderInput("slider1", label = h3("Sliders"),
                                   min = 0, max = 100, value = 50),
                       sliderInput("slider2", "",
                                   min = 0, max = 100, value = c(25, 75))
                ),
                
                column(3, 
                       textInput("text", label = h3("Text input"), 
                                 value = "Enter text..."))   
        )
))