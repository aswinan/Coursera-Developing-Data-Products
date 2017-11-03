
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# load required libraries
library(shiny)
library(maps)
library(mapdata)
library(ggplot2)

# load Department mapping data
states <- map_data("france")

# make the first Department choice be NA
state_choices <- c("")

# append the Department choices
state_choices <- c(state_choices, unique(states$region))

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Department Identification"),
  
  # Sidebar with drop down selector to choose the Department
  # Also includes instructions to use the application
  sidebarLayout(
    sidebarPanel(
      "Select a Department to highlight:",
      selectInput("sel_dept", "",state_choices, selected = NULL, multiple=FALSE),
      h4("Detailed Instructions"),
      "This application allows you to choose a Department to highlight on a map of the various departments of France. 
      Use the selector above to choose a department to display."
    ),
    
    # Show the map plot
    mainPanel(
      h4("The Departments of France"),
      plotOutput("mapPlot")
    )
    )
))

