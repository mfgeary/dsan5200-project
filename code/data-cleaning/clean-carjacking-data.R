#' Clean VICE Carjacking Data
#' 
#' This script cleans the VICE carjacking data centered
#' on counts of Hyundai and Kia carjackings across the US.
#' The data is cleaned for future usage in data visualizations.
#' 
#' @author Marion Bauman

# Load necessary libraries
library(tidyverse)
library(arrow)

# Read in the data
carjack <- read_csv("data/raw/Motherboard VICE News Kia Hyundai Theft Data - Data.csv")