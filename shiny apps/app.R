#setwd("~/R_projs/shiny_apps/moku_boundaries/")
#library(raster)
library(rgdal)
library(cartography)
library(sf)
library(shiny)
library(spdplyr)

source("plot_shp.R")




  ui <- fluidPage(
  titlePanel("Hawai'i Ecosystem Extent Change"),
  
  sidebarLayout(
    sidebarPanel(helpText("Ecosystem extent change by Moku from year 2000 - 2020"),
                 
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
                             selected = "Oahu"),
                 
                 selectInput("lc", 
                             label = "Choose a Land Cover",
                             choices = c("Developed", 
                                         "Cropland",
                                         "Grass/ Shrubland", 
                                         "Tree Cover"),
                             selected = "Developed"),
#,"Wetlands","Barren"                 
#sliderInput("range",label = "Years for Comparison",min = 2000, max = 2020, value = c(2000, 2010), step = 1, sep = "")
    ),
    
    mainPanel(
      plotOutput("map")
    )
  )
)
server <- function(input, output) {
  
  output$map <- renderPlot({
    
    
    isl <- switch(input$island,
                   "Hawaii" = list("Hawaii"),
                   "Oahu" = list("Oahu"),
                   "Kauai" = list("Kauai"),
                   "Niihau" = list("Niihau"),
                   "Kahoolawe" = list("Kahoolawe"),
                   "Lanai" = list("Lanai"),
                   "Molokai" = list("Molokai"),
                   "Maui" = list("Maui"))
    
    landc <- switch(input$lc,
                      "Developed" = list("dev"),
                      "Cropland" = list("crop"),
                      "Grass/ Shrubland" = list("grass"), 
                      "Tree Cover" = list("tree"),
                      "Wetlands" = list("wet"),
                      "Barren" = list("barr"))
    
    isl <- unlist(isl)
    
    landc <- unlist(landc)
    
    plot_sub(isl, landc)
                 
#args <-c(isl,landc)    
#do.call(plot_sub, args)
  })
  
}
shinyApp(ui, server)

# reactive({vector[,as.character(input$lc)]})