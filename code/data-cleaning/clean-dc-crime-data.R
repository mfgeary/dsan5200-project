#' Clean Open Data DC Crime Data
#'
#' This script is designed to clean Open Data DC crime
#' data for future use in data visualization. This cleans
#' crime data from 2019-2023 and generates one combine dataset.
#' New data is stored in `data/clean`.
#'
#' @author Marion Bauman

# Load necessary libraries
library(tidyverse)
library(arrow)

# Read in the data
crime_2019 <- read_csv("data/raw/Crime_Incidents_in_2019.csv")
crime_2020 <- read_csv("data/raw/Crime_Incidents_in_2020.csv")
crime_2021 <- read_csv("data/raw/Crime_Incidents_in_2021.csv")
crime_2022 <- read_csv("data/raw/Crime_Incidents_in_2022.csv")
crime_2023 <- read_csv("data/raw/Crime_Incidents_in_2023.csv")

# Combine data from all years
crime_dc <- bind_rows(
        crime_2019,
        crime_2020,
        crime_2021,
        crime_2022,
        crime_2023
    ) |>
    # remove unneccary ID columns - objectid is the true ID
    select(-OCTO_RECORD_ID, -CCN) |>
    rename("id" = OBJECTID)

# Clean column names
crime_dc <- crime_dc |>
    janitor::clean_names() |>
    rename(
        "report_date" = report_dat,
    )

# Fix column types
crime_dc <- crime_dc |>
    mutate(
        report_date = lubridate::ymd_hms(report_date),
        start_date = lubridate::ymd_hms(start_date),
        end_date = lubridate::ymd_hms(end_date),
        offense_duration = end_date - start_date,
        offense_duration_minutes = as.numeric(offense_duration, units = "mins")
    ) |>
    select(-offense_duration)

# Filter for car thefts only
crime_dc <- crime_dc |>
    distinct() |>
    filter(
        offense == "MOTOR VEHICLE THEFT"
    )

# Save the cleaned data
crime_dc |>
    write_parquet("data/clean/crime_dc.parquet") |>
    write_csv("data/clean/crime_dc.csv")