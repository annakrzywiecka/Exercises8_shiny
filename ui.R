#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
moje_dane <- read.csv("TPMs_table_100genes.csv")
genechoices = moje_dane$GeneID

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("GENE expression"),

    # Sidebar with a slider input for number of bins
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
