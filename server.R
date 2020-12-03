#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    caos <- function(n = 100, k, init) {
        x <- rep(0,n)
        x[1] <- init
        for (i in 1:(n-1)) {
            x[i+1] <- k*x[i]*(1 - x[i])
            if (x[i+1] < 0) x[i+1] <- 0
            if (x[i+1] > 1) x[i+1] <- 1
        }
        x
    }
    t <- seq(0,by=20,length.out = 200)
    
    output$PopPlot <- renderPlot({

        # generate population trend on input$k, input$init_h+input$init_s from ui.R
        init <- input$init_h + input$init_s
        x    <- caos(200,input$k, init)*100

        # draw the plot of the population trend
        plot(t,x, type = "l",pch=10, ylim = c(0,100), main = "Percent population growth",
             ylab = "Population (%)",xlab = "time")

    })

    output$CaosHist <- renderPlot({
        init <- input$init_h + input$init_s
        x    <- caos(100,input$k, init)
        
        # draw the histogram of the population trend
        hist(x,breaks = 20, main = "Polulation ratio Histogram")
        
    })
    
})
