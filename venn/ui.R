#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", label = h5("File input1")),
      fileInput("file2", label = h5("File input2")),
      radioButtons("radio", label = h5("Options"),
                   choices = list("Venn Diagram" = 1, "Choice 2" = 2,
                                  "Choice 3" = 3),selected = 1),
      sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30)
      #submitButton("Update View", icon("refresh"))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Venn", plotOutput("venn")), 
        tabPanel("Table1", dataTableOutput('table1')), 
        tabPanel("Table2", tableOutput('table2')),
        tabPanel("Summary", verbatimTextOutput("text1")), 
        tabPanel("Table", tableOutput("table"))
      )
    )
  )
))
