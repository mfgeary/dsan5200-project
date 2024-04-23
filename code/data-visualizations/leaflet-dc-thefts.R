library(leaflet)
library(tidyverse)

dc_thefts <- read_csv("data/clean/crime_dc.csv")

dc_thefts_grouped <- dc_thefts |>
    summarise(
        .by = c(latitude, longitude, block),
        n = n()
    )

# Create a leaflet map
dc_thefts_grouped |>
    mutate(m = n/2) |>
    leaflet() |>
    addTiles() |>
    addCircleMarkers(
        lng = ~longitude,
        lat = ~latitude,
        radius = ~m,
        color = "red",
        stroke = FALSE,
        fillOpacity = 0.5,
        popup = ~paste0(n, " car thefts at ", block)
    ) |>
    # start with a zoomed in view of DC
    setView(lng = -77.0369, lat = 38.9072, zoom = 12)

