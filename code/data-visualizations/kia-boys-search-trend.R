library(altair)
library(dplyr)
library(readr)

# Load data
kia_boys <- read_csv("data/clean/google-trends.csv") |>
    janitor::clean_names()

# Plot search trend over time



import altair as alt
from vega_datasets import data

# Draw the line
line = chart.mark_line().encode(x="date:T", y="price:Q")

# Use the `argmax` aggregate to limit the dataset to the final value
label = chart.encode(
    x=alt.X("max(date):T"),
    y=alt.Y("price:Q", aggregate=alt.ArgmaxDef(argmax="date")),
    text="symbol",
)

# Create a text label
text = label.mark_text(align="left", dx=4)

# Create a circle annotation
circle = label.mark_circle()

# Draw the chart with all the layers combined
line + circle + text