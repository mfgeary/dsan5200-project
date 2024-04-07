#' Clean DC Adult Arrest Data from MPD
#' 
#' This script cleans arrest data for adults, sourced
#' from the Metropolitan Police Department (MPD) in Washington, DC.
#' The goal is to understand who is stealing cars in DC, so adult arrest
#' data is cleaned for use in visualization. This can be joined with carjacking
#' data using the `ccn`, or Criminal Complaint Number, to match the crime with
#' the (alleged) perpetrator.
#' 
#' @author Marion Bauman

# Load necessary libraries
library(tidyverse)
library(readxl)
library(arrow)

# Read in the data
## Note - all warnings produced here is just converting "NA" and "Unk" 
## strings to NA values. This is desirable behavior.
arrests_2019 <- read_csv('data/raw/Arrests by Year 2019.csv')
arrests_2020 <- read_csv('data/raw/Arrests by Year 2020.csv')
arrests_2021 <- read_excel('data/raw/Arrests by Year 2021.xlsx') |> suppressWarnings()
arrests_2022 <- read_excel('data/raw/Arrests by Year 2022.xlsx') |> suppressWarnings()
arrests_2023 <- read_csv('data/raw/Arrests by Year 2023.csv')

# Map Arrest Date to character
arrests_2019 <- arrests_2019 |>
    mutate(across(everything(), as.character))
arrests_2020 <- arrests_2020 |>
    mutate(across(everything(), as.character))
arrests_2021 <- arrests_2021 |>
    mutate(across(everything(), as.character))
arrests_2022 <- arrests_2022 |>
    mutate(across(everything(), as.character))
arrests_2023 <- arrests_2023 |>
    mutate(across(everything(), as.character))

# Combine data from all years
arrests_dc <- bind_rows(
        arrests_2019,
        arrests_2020,
        arrests_2021,
        arrests_2022,
        arrests_2023
    ) |>
    distinct()

# Clean column names
arrests_dc <- arrests_dc |>
    janitor::clean_names()

# Fix column types
arrests_dc <- arrests_dc |>
    mutate(
        arrest_year = as.numeric(arrest_year),
        arrest_hour = as.numeric(arrest_hour),
        age = as.numeric(age),
        defendant_psa = as.numeric(defendant_psa),
        defendant_district = as.numeric(defendant_district),
        arrest_location_psa = as.numeric(arrest_location_psa),
        arrest_location_district = as.numeric(arrest_location_district),
        arrest_block_geox = as.numeric(arrest_block_geox),
        arrest_block_geoy = as.numeric(arrest_block_geoy),
        arrest_latitude = as.numeric(arrest_latitude),
        arrest_longitude = as.numeric(arrest_longitude),
        offense_location_psa = as.numeric(offense_location_psa),
        offense_location_district = as.numeric(offense_location_district),
        offense_block_geox = as.numeric(offense_block_geox),
        offense_block_geoy = as.numeric(offense_block_geoy),
        offense_latitude = as.numeric(offense_latitude),
        offense_longitude = as.numeric(offense_longitude)
    ) |>
    mutate(
        date = case_when(
            arrest_year < 2021 ~ mdy(arrest_date),
            TRUE ~ ymd(arrest_date)
        )
    ) |>
    suppressWarnings()

# Fix ages over 100
## Assumes that a leading one has been added erroneously
arrests_dc <- arrests_dc |>
    mutate(
        age = case_when(
            age > 100 ~ age - 100,
            TRUE ~ age
        )
    )

# Save adult arrest data
arrests_dc |>
    write_parquet("data/clean/adult_arrests_dc.parquet") |>
    write_csv("data/clean/adult_arrests_dc.csv")
