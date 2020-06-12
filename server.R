library(shiny)

counter <- function(input, output, session) {
  count <- reactiveVal(0)
  observeEvent(input$button, {
    count(count() + 1)
    # stop("Test observeEvent error")
  })
  output$out <- renderText({
    count()
  })
  count
}

shinyServer(function(input, output, session) {
  callModule(counter, "counter1")
}
)