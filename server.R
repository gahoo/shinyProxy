library(shiny)
library(RCurl)
library(shinyAce)

xmlFunc<-list('xmlGetAttr'=xmlGetAttr, 'xmlValue'=xmlValue)

shinyServer(function(input, output, session) {
  
  urls<-reactive({
    unlist(strsplit(input$urls, split='\n'))
  })
  
  output$debug<-renderText({
    urls
  })
  
  output$downloadTable <- downloadHandler(
    filename = 'table.txt',
    content = function(file) {
      dt<-as.data.frame(xpath$data)
      fileEncode<-ifelse(input$sameEncodingOnSave, input$encoding, '')
      eol<-ifelse(input$isWindows, '\r\n', '\n')
      write.table(dt, file, sep='\t', eol=eol, quote=F, row.names=F, fileEncoding=fileEncode)
    }
  )
  
})
