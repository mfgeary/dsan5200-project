#' Clean DC Juvenile Arrest Data from MPD
#' 
#' This script cleans arrest data for juveniles, sourced
#' from the Metropolitan Police Department (MPD) in Washington, DC.
#' The data will be used to understand who is stealing cars in DC. Juvenile
#' data is especially important because research data indicates that thefts
#' of cars are largely committed by teenagers. Data from 2019-2023 is cleaned
#' and joined into one table for use in visualization.
#' 
#' @author Marion Bauman

# Load necessary libraries
library(tidyverse)
library(readxl)
library(arrow)

# Find all the files
file_paths <- list.files('data/raw', pattern = 'Biannual_.', full.names = TRUE)

# Read in the data
juvenile_arrests <- file_paths |>

    map_dfr(
        ~read_excel(.x, skip = 9) |>
            mutate(across(everything(), as.character))
    )

# Clean column names
juvenile_arrests <- juvenile_arrests |>
    janitor::clean_names()

# Fix column types
juvenile_arrests <- juvenile_arrests |>
    mutate(
        arrest_date = ymd(arrest_date),
        home_psa = as.numeric(home_psa),
        crime_psa = as.numeric(crime_psa)
    )

# Save the cleaned data
juvenile_arrests |>
    write_parquet('data/clean/juvenile_arrests_dc.parquet') |>
    write_csv('data/clean/juvenile_arrests_dc.csv')