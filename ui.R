library(shiny)
library(shinyAce)
library(DT)

shinyUI(fluidPage(
    mainPanel(
      aceEditor("urls", mode='html', value="", height="500px"),
      textOutput('debug'),
      downloadButton('downloadTable', 'Download')
  )
))

