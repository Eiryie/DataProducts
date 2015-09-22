# ui.R
library(shiny)

shinyUI(fluidPage(
  titlePanel("NOAA Storm Events by Year"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Change the fields below to view other major storm events and year ranges. The results will update dynamically."),
      
      selectInput("event", 
                  label = "Choose a Storm Event to Display",
                  choices = list("BLIZZARD","DROUGHT","FLOOD", "FOG","THUNDERSTORM","TORNADO"), selected = "BLIZZARD"),
                        
      sliderInput("year", 
                  label = "Select the Year(s) to Display", sep="",
                  min = 1950, max = 2011, value = c(1950, 2011))
      
     
    ),
    
    mainPanel(
      h3("App Description"),
      p("The National Oceanic and Atmospheric Administration (NOAA) maintains a Storm Events Database that tracks extreme or unusual weather events.
        This app uses a subset of the Storm Database including cleaned data from 1950 to 2011. Use the fields to the left to explore each storm event type across multiple ranges of years.  The total number of events recorded within your search parameters will also display below."),  

      em("Please note that NOAA's data collection processes
        have changed over time and some older records may be incomplete.  For more information on the NOAA Storm Events Database, go to", a("https://www.ncdc.noaa.gov/stormevents/"),"."),
      h3("Result Parameters"),
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3"),
      plotOutput("Chart")
      
      )
  )
))