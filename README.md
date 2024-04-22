# Visualizing Car Thefts
**DSAN 5200**
**Authors:** [Marion Bauman](https://github.com/mfgeary), [Matt Carswell](https://github.com/mattycars), [Patricia Schenfeld](https://github.com/pschenfeld), [Thomas Sigall](https://github.com/tsigall)

This is a repo for our final data visualization project for DSAN 5200.

## Project Status

- [x] Data cleaning
- [x] EDA
- [x] Story outline
- [] Draft of story (in progress)
- [] Edit story
- [] Final story completed

## Data Sources

* `Crime_Incidents_in_*` is comprehensive crime data in DC sourced from Open Data DC, found [here](https://opendata.dc.gov/datasets). Our data includes crime incidents from 2019-2023.
* `Motherboard VICE News Kia Hyundai Theft Data - Data` contains the number of car thefts in major cities across the US and the proportion of those that were Hyundais or Kias. The data was collated by Aaron Gordon at VICE News and is found [here](https://docs.google.com/spreadsheets/u/1/d/1-6614t_Ata5k7oESrm-HAdF1uOe8aPGRaQECl44GYeE/edit?pli=1#gid=0).
* `Arrests by Year *` is adult arrest data in DC, sourced from the Metro Police Department, found [here](https://mpdc.dc.gov/node/1379551).
* `Biannual_Report_*` is data on juvenile arrests in DC, sourced from the Metro Police Department, found [here](https://mpdc.dc.gov/node/208852).
* `google-trends.csv` is data on the Google search trends of terms related to the Kia/Hyundai theft trends online, found [here](https://trends.google.com/trends/).

## Clean Data

All cleaned data is stored as both `.csv` for easy portability and `.parquet` for efficient storage, column type preservation, and fast reading. The cleaned data is stored in the `data/clean/` folder.

* `adult_arrests_dc` is the cleaned adult arrest data. This is the combined version of `Arrests by Year *` files from Metro PD.
* `crime_dc` is the cleaned crime data from Open Data DC. This is the combined version of `Crime_Incidents_in_*` files, filtered to only include motor vehicle thefts.
    * This can be joined with `adult_arrests_dc` using `ccn` to get detailed data on the arrests associated with each crime.
* `juvenile_arrests_dc` is the cleaned juvenile arrest data. This is the combined version of `Biannual_Report_*`, sourced from Metro PD. This data is much less detailed than the adult arrest data due to child privacy laws.
* `kia_hyundai_thefts` is the cleaned data on car thefts in major US cities, sourced from VICE News at `Motherboard VICE News Kia Hyundai Theft Data - Data`.
* `google-trends.csv` is data on the Google search trends of terms related to the Kia/Hyundai theft trends online. This is the original - no cleaning was required.

## Repo Organization

The repo is organized as follows:

* `data/` contains our data as well as the documentation for the data. It contains two subfolders:
    * `raw/`, which contains the raw data, and
    * `clean/`, which contains the cleaned data.
* `code/` contains all of our code for the project. It is further organized into subfolders based on the type of code/phase of the project. Current subfolders are:
    * `data-cleaning/`, which contains code for cleaning the data
    * `data-story/`, which contains the Quarto file for our final story output
    * `data-visualizations/`, which contains code to generate visualizations for the final report. Note that the final versions are coded directly into `data-story.qmd`. These files are for ideating.
    * `eda/` houses our exploratory data analysis which was used to understand the data in order to guide our story creation.
    * `helpful-resources/` includes an example of how to implement scrolly-telling into a Quarto document. While this has not been implemented into our final data story, we will use this techniques to make our story more visually appealing.