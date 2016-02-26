
# set mirror
options(repos=structure(c(CRAN="http://cran.rstudio.com")))

if (!("shiny" %in% names(installed.packages()[,"Package"]))) {install.packages("shiny")}
suppressMessages(library(shiny, quietly = TRUE))

library(datasets)
mtcars
model1_y <- "Miles/Gallon"
model1_x1 <- "Cylinders"
model1_x2 <- "Horsepower"
model1_x3 <- "Weight"
data <- mtcars


# Setting up prediction model

modelFit <- lm(mpg ~ cyl + hp + wt, data=data)

mpg <- function(hp, cyl, wt) {
        modelFit$coefficients[1] + modelFit$coefficients[2] * cyl +
                modelFit$coefficients[3] * hp + modelFit$coefficients[4] * wt
}

shinyServer(
        function(input, output) {

                adjusted_weight <- reactive({input$wt/1000})
                predicted_mpg <- reactive({mpg(input$hp, as.numeric(input$cyl), adjusted_weight())})
                output$inputValues <- renderPrint({paste(input$cyl, model1_x1,
                                                         input$hp, model1_x2,
                                                         input$wt, model1_x3)})
                output$prediction <- renderPrint({paste(round(predicted_mpg(), 2), model1_y)})
                output$plots <- renderPlot({

                        par(mfrow = c(1, 3))

                        with(data, plot(cyl, mpg,
                                          xlab=model1_x1,
                                          ylab=model1_y,
                                          main=model1_x1))
                        points(as.numeric(input$cyl), predicted_mpg(), col="red", cex=5)

                        with(data, plot(hp, mpg,
                                          xlab=model1_x2,
                                          ylab=model1_y,
                                          main=model1_x2))
                        points(input$hp, predicted_mpg(), col="green", cex=5)

                        with(data, plot(wt, mpg,
                                          xlab=model1_x3,
                                          ylab=model1_y,
                                          main=model1_x3))
                        points(adjusted_weight(), predicted_mpg(), col="blue", cex=5)
                })
        }
)
