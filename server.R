#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)


function(input, output, session) {
  observe({
    moje_dane <- read.csv('TPMs_table_100genes.csv')
    genechoices <- moje_dane$GeneID
    
    updateSelectInput(session, 'GENE',
                      choices = genechoices)
    
    
    
  })
  
    output$expression <- renderPlot({
      
      filtered_gene_exp <- moje_dane %>%
        filter(GeneID == input$GENE)

      
      long_filtered_gene_exp <- filtered_gene_exp %>%
        tidyr::pivot_longer(
          cols=matches('Control|Treated'), names_to='SampleName', values_to='Expression'
        )
      
      # create a scatter plot using ggplot
      ggplot(long_filtered_gene_exp, aes(x=SampleName, y=Expression, fill=SampleName)) +
        geom_bar(stat = "identity") +
        theme_minimal()
    })
 
  }


