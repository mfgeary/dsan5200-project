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

# Store the city names
city_names <- names(carjack) |> unique()
city_names <- city_names |>
    discard(~str_detect(., "\\.\\.\\."))

# Reread data with new headers
carjack <- read_csv("data/raw/Motherboard VICE News Kia Hyundai Theft Data - Data.csv", skip = 1)

dates <- carjack |>
    select(1) |>
    pull()

carjack <- carjack |>
    select(-1)

# Change the data from wide to long by concatonating
# the data for each city

# Set up new tibble to store long data
carjack_long <- tibble(
    count_kia_hyundai = numeric(),
    count_all = numeric(),
    percent_kia_hyundai = character(),
    city = character(),
    date = character()
)

# Iterate through data for each city, get counts, and 
# concatenate to long format
for (city in city_names) {
    city_data <- carjack |>
        select(1:3)
    names(city_data) <- c("count_kia_hyundai", "count_all", "percent_kia_hyundai")
    city_data <- city_data |>
        mutate(
            city = city,
            date = dates
        )
    carjack <- carjack |>
        select(-1:-3)
    carjack_long <- bind_rows(carjack_long, city_data)
}

# Reorder the columns
carjack <- carjack_long |>
    select(date, city, count_kia_hyundai, count_all, percent_kia_hyundai)

# Clean the date column
carjack <- carjack |>
    mutate(date = lubridate::my(date)) |>
    mutate(month = lubridate::month(date, label = TRUE)) |>
    mutate(year = lubridate::year(date))

# Convert percent column to numeric
carjack <- carjack |>
    mutate(percent_kia_hyundai = str_remove(percent_kia_hyundai, "%")) |>
    mutate(percent_kia_hyundai = as.numeric(percent_kia_hyundai)) |>
    suppressWarnings()
# Note that you'll get a warning here saying NAs were introduced by
# coercion -- this is intentional. All NAs "introduced" are just strings
# that were already NA.

# Save cleaned data as parquet (to maintain data types) and csv
carjack |>
    write_parquet("data/clean/kia-hyundia-thefts.parquet") |>
    write_csv("data/clean/kia-hyundia-thefts.csv")