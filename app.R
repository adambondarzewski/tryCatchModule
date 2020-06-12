library(shiny)

counterButton <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), label = label),
    verbatimTextOutput(ns("out"))
  )
}

counter <- function(input, output, session) {
  count <- reactiveVal(0)
  observeEvent(input$button, {
    count(count() + 1)
    stop("Test observeEvent error")
  })
  output$out <- renderText({
    count()
  })
  count
}

ui <- fluidPage(
  counterButton("counter1", "Counter #1")
)

server <- function(input, output, session) {
  tryCatch({
    callModule(counter, "counter1")
  }, error = function(err) {message("Fail gracefully")})
}

shinyApp(ui, server)