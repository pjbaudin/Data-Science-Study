library(shiny)

shinyUI(fluidPage(
        titlePanel("Stock Vizualization and Forecast"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Select a stock to examine. 
                                 Information will be collected from Yahoo finance."),
                        
                        textInput("symb", "Symbol", "SPY"),
                        
                        dateRangeInput("dates", 
                                       "Date range",
                                       start = "2013-01-01", 
                                       end = as.character(Sys.Date())),
                        
                        br(),
                        br(),
                        

                        checkboxInput("adjust", 
                                      "Adjust prices for inflation", value = FALSE),
                        
                        sliderInput("range",
                                    label = "Input the forecast range",
                                    min = 10,
                                    max = 200,
                                    value = 50),
                        
                        sliderInput("conf",
                                    label = "Input the forecast range",
                                    min = 90,
                                    max = 99,
                                    step = 1,
                                    value = 95)
                        ),
                
                mainPanel(plotOutput("plot"))
        )
))