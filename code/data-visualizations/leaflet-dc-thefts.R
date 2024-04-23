library(leaflet)
library(tidyverse)

dc_thefts <- read_csv("data/clean/crime_dc.csv")

dc_thefts_grouped <- dc_thefts |>
    summarise(
        .by = c(latitude, longitude, block),
        n = n()
    )

providers <- leaflet::providers
# Create a leaflet map
dc_thefts_grouped |>
    mutate(m = n/2) |>
    leaflet() |>
    # addTiles() |>
    addProviderTiles(providers$CartoDB.Positron) |>
    addCircleMarkers(
        lng = ~longitude,
        lat = ~latitude,
        radius = ~m,
        color = "#A8C4FF",
        stroke = FALSE,
        fillOpacity = 0.8,
        popup = ~paste0(n, " car thefts at ", block)
    ) |>
    setView(lng = -77.0369, lat = 38.9072, zoom = 12)
