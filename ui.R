library(shiny)
shinyUI(pageWithSidebar(

        headerPanel("Shiny Application: Interactive forecasting model"),

        sidebarPanel(
                h3("Please select from the following Factors: "),
                radioButtons("cyl","Factor 1: Cylinders:", c("4" = 4, "6" = 6, "8" = 8), selected = "4"),
                numericInput("hp", "Factor 2: Horsepower:", 140, min = 50, max = 330, step = 10),
                numericInput("wt", "Factor 3: Weight:", 3200, min = 1500, max = 5500, step = 100),

                br(),

                helpText("This applet uses ordinary least squares (OLS) to fit a regression line to the data with the selected trend. The three diagnostic plots on the lower half of the page are provided to vizualize the sensivity of the three factors on miles pr. gallon."),
                br(),
                helpText(a(href="https://github.com/hgjerning/DevDataProd/ui.R", target="_blank", "View UI code")),
                helpText(a(href="https://github.com/hgjerning/DevDataProd/server.R", target="_blank", "View server code")),
                br()),



        mainPanel(
                h4("Prediction:"),
                verbatimTextOutput("inputValues"),
                h4("Resulting in a prediction of:"),
                verbatimTextOutput("prediction"),
                plotOutput("plots"))

        ))
