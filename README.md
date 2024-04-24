# Visualizing Car Thefts
**DSAN 5200**
**Authors:** [Marion Bauman](https://github.com/mfgeary), [Matt Carswell](https://github.com/mattycars), [Patricia Schenfeld](https://github.com/pschenfeld), [Thomas Sigall](https://github.com/tsigall)

This is a repo for our final data visualization project for DSAN 5200.

## Project Status

- [x] Data cleaning
- [x] EDA
- [x] Story outline
- [ ] Draft of story (in progress)
- [ ] Edit story
- [ ] Final story completed

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

**Original README**

[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/2INZynyo)
# Project Repo

This is the team repository you will be use for your project. All your team's work will happen here. 

Links of interest:
* The project requirements are in the [`instructions.md`](instructions.md) document
* The repository structure is described in the repository structure section](#repository-structure) below
* You **will** make changes to this `README.md` file within your repository. These changes are described in the [instructions section](#instructions-for-modifying-this-readmemd-file) below.

## Repository structure

You will work within an **organized** repository and apply coding and development best practices. The repository has the following structure:

```.
├── README.md
├── code/
├── data/
├── img/
└── website/
```

* The `code/` directory is where you will develop all your code.  You may add additional sub-directories as needed to modularize your development.

* The `data/` directory should contain your data files and should have multiple sub-directories (i.e. raw, processed, analytical, etc.) as needed.

* The `img/` directory should contain any external images that you need for your site. However, all your viz's should be generated programmatically in your source code.

* The `website/` directory where the website will be deployed. It must be self-contained and accessible via an index.html within this sub-directory.  Any website asset (images, html, css, JavaScript source code) must be added to this directory. 

There is an empty placeholder file in each subdirectory called `placeholder-to-be-deleted.txt`. This file may be deleted **after** you save other files in those subdirectories. This file is needed to be able to keep the empty directory in the repo.

Other files we expect to see at the top level of this repo may include:
- `.gitignore`


## Instructions for modifying this `README.md` file

The README.md file in a repository usually contains additional information about your project. Currently this file contains information about the repository structure. However, for the wip and final submissions, you will make the following changes to this file:

* You can delete the current content of the `README.md` file
* Add a project title section
* Add your team section with your team number and team member names
* Add an executive summary section describing your project
* Provide a description of all your code files, datasets, etc.
