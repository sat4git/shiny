#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(VennDiagram)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$text1 <- renderText({ 
  paste("File1", input$file1$datapath)
  })
  output$table1 <- renderDataTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    inFile1 <- input$file1
    
    if (is.null(inFile1))
      return(NULL)
    #file1 <- (read.table("/Users/satishnair/RWorkspace/test1.txt", header = FALSE, sep = "\t"))
    file1 <- read.table(inFile1$datapath, header = FALSE, sep = "\t")
    
  })
  output$table2 <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    inFile2 <- input$file2
    
    if (is.null(inFile2))
      return(NULL)
    #file2 <- (read.table("/Users/satishnair/RWorkspace/test2.txt", header = FALSE, sep = "\t"))
    file2 <- (read.table(inFile2$datapath, header = FALSE, sep = "\t"))
    #len_file2.cont <- length(file2.cont)
  })
  output$text1 <- renderText({ 
    file1.contents <- as.character(file1$V1)
    file2.contents <- as.character(file2$V1)
    paste("FILE2", length(file2.contents) ,"File1", input$file1$datapath)
    
    inter <- intersect(file1.contents,file2.contents)
  })
  
  
  output$venn <- renderPlot({
    # Only plot the Venn diagram if the input values are legit (the input values
    # are all available and the intersection area isn't greater than either individual set). 
    draw.pairwise.venn(area1 = length(file1.contents),
                         area2 = length(file2.contents),
                         cross.area = length(inter),                     
                         category = c("Google Analytics","Adobe Analytics"),
                         fill = c("#F29B05","#A1D490"),
                         ext.text = TRUE,
                         ext.percent = c(0.1,0.1,0.1),
                         ext.length = 0.6,
                         label.col = rep("gray10",3),
                         lwd = 0,
                         cex = 2,
                         fontface = rep("bold",3),
                         fontfamily = rep("sans",3),
                         cat.cex = 1.5,
                         cat.fontface = rep("plain",2),
                         cat.fontfamily = rep("sans",2),
                         cat.pos = c(0, 0),
                         print.mode = c("percent","raw")
      )
  })
   
  })
  

