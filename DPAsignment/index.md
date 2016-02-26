---
title       : Developing Data Products 
subtitle    : An Interactive Data Model
author      : H Gjerning, 2016
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Outline

The purpose of this exercise is to illustrate Interactive data analysis

 
 * We are going to explore fuel efficiency for cars
 
 * For this purpose I have chosen the very familiar dataset mtcars
 
 * We are using a simple interactive regression model with three variables:
 
                * Number of cylinders
                * Horsepower
                * Weight
                
 * to explain fuel consumption for a sample of cars

  


--- .class #id 

## Slide 3


```r
#   library(UsingR)
     predModel <- lm (mpg ~ cyl + hp + wt, data=mtcars)
     predModel
```

```
## 
## Call:
## lm(formula = mpg ~ cyl + hp + wt, data = mtcars)
## 
## Coefficients:
## (Intercept)          cyl           hp           wt  
##    38.75179     -0.94162     -0.01804     -3.16697
```




--- .class #id 

## Slide 4

Findings:

* Adjusting the three variables used in the analysis gives an idea of the sensitivity of the variables

* this exercise was more for illustrating interactive analysis rather than in dept analysis so

* have a go.............




--- .class #id 

## Slide 5

For further information:

Shiny App:


http://github.com/hgjerning/DevDataProd/index.R
https://hgjerning.shinyapps.io/DPAsignment/

Program: 

https://github.com/hgjerning/DevDataProd/ui.R
https://github.com/hgjerning/DevDataProd/server.R
