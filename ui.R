#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Caos theory example"),
    h4('Instruction for slider usage '),
    p('- Leaving the top slider "Reproduction constant k" at the initial value, 
      (k = 2), try to change the second slider "Initial population ratio". 
      You will notice an effect on the plot regarding the initial point and 
      a small general impact on the plot'),
    p('- Now if you try to apply also big slider change with the last slider in the  
      bottom, you will not able to note any change even if the change is applied to the 
      same initial condition. This happen because the applied change is very small and
      below the visual perception'),
    p('- Now move the top slider k up to the maximum value 4. You will notice an
      irregular beviour on the plot for k > 3.6'),
    p('- Finally try to move again the bottom slider and now you will see significant 
      effects on population(%) (for time > 200), also for a minimal change of the 
      initial conditions'),
    p('see more details in the related presentation...'),
    # Sidebar with a slider input for reproduction constant k
    sidebarLayout(
        sidebarPanel(
            sliderInput("k",
                        "Reproduction constant k",
                        min = 0.5,
                        max = 4,
                        value = 2),
            sliderInput("init_h",
                        "Initial population ratio",
                        min = 0.01,
                        max = 1,
                        value = 0.01),
            sliderInput("init_s",
                        "Small initial population ratio change",
                        min = 0,
                        max = 0.0001,
                        value = 0.00002),
            p('This slider will lead to a significant effect only for k > 3.6')
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("PopPlot"),
            plotOutput("CaosHist")
            
        )
    )
))
