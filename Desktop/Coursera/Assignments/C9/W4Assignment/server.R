library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
      
      lm1 <- lm(log10(Volume)~log10(Girth)+log10(Height),data = trees)

      lm1pred <- reactive({
            i <- data.frame(Girth = input$d,Height = input$h)
            i$VolYield <- 10^predict(lm1,i,interval = "confidence")
      })

      output$treePlot <- renderPlot({
            j <- data.frame(Girth = input$d,Height = input$h,Volume = lm1pred()[[1]])
            k <- ggplot(data=trees) + labs(x = "Tree Height (ft.)", y = "Timber Volume (cu ft)") 
            k <- k + geom_point(aes(Height, Volume, color = Girth)) 
            k + geom_point(data=j,aes(Height, Volume, color = Girth), size = 5, shape = 17)
      })

      output$yield <- renderText({round(lm1pred()[[1]],1)})
      output$lowYield <- renderText({round(lm1pred()[[2]],1)})
      output$highYield <- renderText({round(lm1pred()[[3]],1)})
  
})
