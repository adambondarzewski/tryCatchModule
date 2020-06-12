library(shiny)

counterButton <- function(id, label = "Counter") {
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), label = label),
    verbatimTextOutput(ns("out"))
  )
}

shinyUI(fluidPage(
  counterButton("counter1", "Counter #1")
)
)
