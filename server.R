
# Data Processing for Iris dataset

library(shiny)
library(ggplot2)
library(dplyr)
irisData <- iris

# Data Processing for Iris dataset

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  column <- reactive({paste0("Petal.",input$dimToPlot)})
  data <- eventReactive(input$dimToPlot, {
    irisData %>% 
      select(column()) %>%
      filter(get(column()) < 2)
  })
  
  # Histogram output
  output$distPlot <- renderPlot({
    ggplot(environment = environment(),
           data = data(), 
           aes_string(x = column())) +
      geom_histogram(color="white", fill="purple",bins = 10,boundary=0) 
  })
  
})
