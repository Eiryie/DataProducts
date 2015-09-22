# server.R

library(shiny)
APPSET<-read.csv("data/SmallSet.csv")


shinyServer(
  function(input, output) {
      
    output$text1 <- renderText({ 
      paste("You have selected", input$event)
    })
    
    output$text2 <- renderText({ 
      paste("You have chosen Years",
            input$year[1], "to", input$year[2])
    })
    
    output$text3 <- renderText({ 
      sample <- subset(APPSET, clnEVT == input$event & YEAR >=input$year[1] & YEAR<=input$year[2], select=c(clnEVT, YEAR,Count))
      rows<-nrow(sample)
      paste("Your search returned", rows, "results.")
    })
    
    output$Chart <- renderPlot({
        sample <- subset(APPSET, clnEVT == input$event & YEAR >=input$year[1] & YEAR<=input$year[2], select=c(clnEVT, YEAR,Count))
        aggdata <-aggregate(Count~YEAR, data=sample, sum)
        barplot(aggdata$Count, main="Events by Year", xlab="Year", ylab="Count", col="darkblue", names.arg=aggdata$YEAR, las=2)
         })
    
    
  }
)
