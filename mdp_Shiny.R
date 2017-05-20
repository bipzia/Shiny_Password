
library(shiny)
library(shinythemes)
library(scales)
library(lattice)
library(dplyr)
library(magrittr)
library(httr)
library(RJSONIO)
library(plyr)
library(dplyr)
library(data.table)
library(tidyr)
library(devtools)
library(shinyjs)
library(shinydashboard)

ui <- uiOutput("body")

server <- function(input, output){
  
  output$body <- renderUI(navbarPage(theme=shinytheme("flatly"), "Locked",
                                     tabPanel("Login", icon = icon("lock"),
                                              fluidRow(
                                                column(12, align="center", offset = 3 ,
                                                       box(title = "Login", textInput("userName", "Username"),
                                                           passwordInput("passwd", "Password"),
                                                           br(),
                                                           actionButton("Login", "Log in")
                                                       )
                                                )
                                              )
                                     ),
                                     tabPanel("Help", icon= icon("info"),
                                              div(class="panel panel-success", div(class="panel-heading", div(class="panel-title", p(strong("INFORMATIONS:")), align = "center")), 
                                                  p("Write your own text")))
  )
  )

  observeEvent(input$Login, {
    
    output$body <- renderUI({if(input$userName == "bipzia" && input$passwd == "test"){ navbarPage(theme=shinytheme("flatly"), "Unlocked")}else{
      showModal(modalDialog(
        title = "Oops !!!!! Something wrong ...",
        "Incorrect username or password",
        easyClose = TRUE
      ))
      box("ERROR SYSTEM - Please reload the app")}
    })
  })  

  
}

shinyApp(ui,server)




