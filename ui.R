
# Data Processing for Iris dataset

library(shiny)
library(ggplot2)
library(dplyr)
irisData <- iris

# Define UI for application that creates a histogram

shinyUI(fluidPage(
  selectInput(inputId = "dimToPlot", label="Plot Dimension:",choices = c("Length","Width")),
  plotOutput(outputId = "distPlot")
))
