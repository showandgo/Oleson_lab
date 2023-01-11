#setwd("~/R_projs/shiny_apps/moku_boundaries/")
library(raster)
source("plot_shp.R")
library(shiny)


ui <- fluidPage(
  titlePanel("Map of Ecosystem Extent Change"),
  
  sidebarLayout(
    sidebarPanel(helpText("Find out the extent of ecosystem change in your Moku"),
                 
                 selectInput("island", 
                             label = "Choose an Island to display",
                             choices = c("Hawaii", 
                                         "Oahu",
                                         "Kauai", 
                                         "Niihau",
                                         "Kahoolawe",
                                         "Lanai",
                                         "Molokai",
                                         "Maui"),
                             selected = "Oahu"
                             ),
                 
                 sliderInput("range", 
                             label = "Years for Comparison",
                             min = 2000, max = 2020, value = c(2000, 2010), 
                             step = 1, sep = "")
    ),
    
    mainPanel(
      plotOutput("map")
    )
  )
)
server <- function(input, output) {
  output$map <- renderPlot({
    args <- switch(input$island,
                   "Hawaii" = list("Hawaii"),
                   "Oahu" = list("Oahu"),
                   "Kauai" = list("Kauai"),
                   "Niihau" = list("Niihau"),
                   "Kahoolawe" = list("Kahoolawe"),
                   "Lanai" = list("Lanai"),
                   "Molokai" = list("Molokai"),
                   "Maui" = list("Maui"))
    
    do.call(plot_sub, args)
  })
  
}
shinyApp(ui, server)
