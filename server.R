library(shiny)

chanceSuccess <- function(nD6,nSuccess,Type){
  chance <- 0

  if (Type == "4s") {
    for (n in nSuccess:nD6) {
      chance <- chance + (choose(nD6,n)*(3/6)^(n)*(3/6)^(nD6 - n))
    } 
  }
 if (Type == "5s") {
    for (n in nSuccess:nD6) {
      chance <- chance + (choose(nD6,n)*(2/6)^(n)*(4/6)^(nD6 - n))
    } 
  }
  if (Type == "6s") {
    for (n in nSuccess:nD6) {
      chance <- chance + (choose(nD6,n)*(1/6)^(n)*(5/6)^(nD6 - n))
    } 
  }
  return(chance)

}

shinyServer(
  function(input, output) {
    output$onD6 <- renderPrint({input$inD6})
    output$onSuccess <- renderPrint({input$inSuccess})
    output$oProb <- renderPrint({chanceSuccess(input$inD6,input$inSuccess,input$iType)})
  }
)