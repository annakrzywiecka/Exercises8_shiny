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
    #load data
    moje_dane <- read.csv("/home/ania/Documents/advancedToolkit/cw8/App_5/TPMs_table_100genes.csv")
    #prepare only the column with genes
    genechoices <- moje_dane$GeneID
    #combine with the selection in ui
    updateSelectInput(session, 'GENE',
                      choices = genechoices)
    
    
    
  })
    #preparing plotting
    output$expression <- renderPlot({
      #choosing only a row chosen
      filtered_gene_exp <- moje_dane %>%
        filter(GeneID == input$GENE)

      #longer format
      long_filtered_gene_exp <- filtered_gene_exp %>%
        tidyr::pivot_longer(
          cols=matches('Control|Treated'), names_to='SampleName', values_to='Expression'
        )
      
      # create a barplot plot using ggplot
      ggplot(long_filtered_gene_exp, aes(x=SampleName, y=Expression, fill=SampleName)) +
        geom_bar(stat = "identity") +
        theme_minimal()
    })
 
  }


