# Visualizing Car Thefts
**DSAN 5200**
**Authors:** [Marion Bauman](https://github.com/mfgeary), [Matt Carswell](https://github.com/mattycars), [Patricia Schenfeld](https://github.com/pschenfeld), [Thomas Sigall](https://github.com/tsigall)

This is a repo for our final data visualization project for DSAN 5200.

## Data Sources

* `Crime_Incidents_in_*` is comprehensive crime data in DC sourced from Open Data DC, found [here](https://opendata.dc.gov/datasets). Our data includes crime incidents from 2019-2023.
* `Motherboard VICE News Kia Hyundai Theft Data - Data` contains the number of car thefts in major cities across the US and the proportion of those that were Hyundais or Kias. The data was collated by Aaron Gordon at VICE News and is found [here](https://docs.google.com/spreadsheets/u/1/d/1-6614t_Ata5k7oESrm-HAdF1uOe8aPGRaQECl44GYeE/edit?pli=1#gid=0).
* `Arrests by Year *` is adult arrest data in DC, sourced from the Metro Police Department, found [here](https://mpdc.dc.gov/node/1379551).
* `Biannual_Report_*` is data on juvenile arrests in DC, sourced from the Metro Police Department, found [here](https://mpdc.dc.gov/node/208852).

## Repo Organization

The repo is organized as follows:

* `data/` contains our data as well as the documentation for the data. It contains two subfolders:
    * `raw/`, which contains the raw data, and
    * `clean/`, which contains the cleaned data.
* `code/` contains all of our code for the project. It is further organized into subfolders based on the type of code/phase of the project. Current subfolders are:
    * `data-cleaning/`, which contains code for cleaning the data