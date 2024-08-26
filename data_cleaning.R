# Key packages for the app

#  install.packages("shiny") # For the shiny app
#  install.packages("bslib") # For certain shiny app traits
#  install.packages("readr") # For loading csv
#  install.packages("shinythemes") # For shiny themes
#  install.packages("thematic") # For consistence between layout and plots
#  install.packages("reactable") # For table
#  install.packages("reactablefmtr") # For table
#  install.packages("here") # For file management
#  install.packages("shinylive") # For github optimisation
#  install.packages("htmltools") # For the DOI links
#  install.packages("magrittr") # For the pipe (avoided tidyverse in case it makes it more difficult for shinyserver)
#  install.packages("dplyr") # For the mutate functions 

# Loading the packages

library(shiny) 
library(bslib)
library(readr)
library(shinythemes)
library(thematic)
library(reactable)
library(reactablefmtr)
library(here)
library(shinylive)
library(htmltools)
library(magrittr)
library(dplyr)


# Uploading the table

Table8 <- 
  read_csv(here("Data",
                "Processed Data",
                "Table8.csv"))

# Now I create the colour code I want the classification variable to have:

Table8 <- Table8 %>%
  mutate(
    Classification_colours = case_when(Classification == "High" ~ "darkgreen",
                                       Classification == "Low" ~ "red",
                                       TRUE ~ "orange")
  )

# Creating a tooltip option that will be used in the headers.

with_tooltip <- function(value, tooltip) {
  tags$abbr(style = "text-decoration: underline; text-decoration-style: dotted; cursor: help",
            title = tooltip, value)
}


# I will need a different DOI table for Table 8:

DOITable8 <- data.frame(
  Study_ID = c("1", "6", "19", "21", "26", "27", "31", "12", "23", "29", "22",
               "1", "19", "21", "26", "19", "26", "27", "4", "1", "22", "27",
               "31", "12", "28", "29", "26", "27", "31", "12", "29", "22", "6", 
               "21", "27", "31", "4", "5", "12", "28", "29", "1", "6", "21", 
               "24", "27", "4", "5", "11", "28", "29"),
  DOI = c("https://doi.org/10.1007/s12310-022-09538-x.html",
          "Not available",
          "https://doi.org/10.1080/14635240.2018.1431952",
          "Not available",
          "https://doi.org/10.2196/12003",
          "http://dx.doi.org/10.1016/j.jsp.2017.07.005",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.1080/02796015.2012.12087377",
          "https://doi.org/10.3310/phr06100",
          "http://dx.doi.org/10.1037/edu0000360",
          "https://doi.org/10.1007/s12310-022-09538-x.html",
          "https://doi.org/10.1080/14635240.2018.1431952",
          "Not available",
          "https://doi.org/10.2196/12003",
          "https://doi.org/10.1080/14635240.2018.1431952",
          "https://doi.org/10.2196/12003",
          "http://dx.doi.org/10.1016/j.jsp.2017.07.005",
          "https://doi.org/10.1037//0022-006x.67.5.648",
          "https://doi.org/10.1007/s12310-022-09538-x.html",
          "http://dx.doi.org/10.1037/edu0000360",
          "http://dx.doi.org/10.1016/j.jsp.2017.07.005",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.3389/fpsyg.2022.973184",
          "https://doi.org/10.3310/phr06100",
          "https://doi.org/10.2196/12003",
          "http://dx.doi.org/10.1016/j.jsp.2017.07.005",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.3310/phr06100",
          "http://dx.doi.org/10.1037/edu0000360",
          "Not available",
          "Not available",
          "http://dx.doi.org/10.1016/j.jsp.2017.07.005",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "https://doi.org/10.1037//0022-006x.67.5.648",
          "http://dx.doi.org/10.1037/spq0000233",
          "https://doi.org/10.1007/s11121-017-0802-4",
          "https://doi.org/10.3389/fpsyg.2022.973184",
          "https://doi.org/10.3310/phr06100",
          "https://doi.org/10.1007/s12310-022-09538-x.html",
          "Not available",
          "Not available",
          "https://doi.org/10.1007/s10935-008-0153-9",
          "http://dx.doi.org/10.1016/j.jsp.2017.07.005",
          "https://doi.org/10.1037//0022-006x.67.5.648",
          "http://dx.doi.org/10.1037/spq0000233",
          "https://doi.org/10.1186/isrctn85087674",
          "https://doi.org/10.3389/fpsyg.2022.973184",
          "https://doi.org/10.3310/phr06100"))
