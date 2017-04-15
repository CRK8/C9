library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Approximate Timber from Black Cherry Trees"),

  sidebarLayout(
    sidebarPanel(
       sliderInput("d", "What is your tree diameter (in., @ 4.5 ft. above the ground):",
                   min = 8.3, max = 20.6, value = 13.2, step = .1),
       sliderInput("h", "What is your tree height (ft.):",
                   min = 63, max = 87, value = 76, step = 1),
       submitButton("Calculate")
    ),
    
    mainPanel(
       plotOutput("treePlot"),
       h5("Approximate timber yeild will be", strong(textOutput("yield", inline = T)),
          "cubic feet. The 95th percentile confidence will be between", strong(textOutput("lowYield", inline = T)),
          "and", strong(textOutput("highYield", inline = T)), "cubic feet.")
    )
  )
))
