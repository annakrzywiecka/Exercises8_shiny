#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
moje_dane <- read.csv("/home/ania/Documents/advancedToolkit/cw8/App_5/TPMs_table_100genes.csv")
genechoices = moje_dane$GeneID


fluidPage(
    titlePanel("GENE expression"),

    sidebarLayout(
      selectInput(
        'GENE',
        h4('Selected a gene you want to see expression for'),
        choices = genechoices
        
      ) ,

        mainPanel(
            plotOutput("expression")
        )
    )
)
