# ETL Project Report
#### By Jonathan Piech (jonathanpiech) and Adam Roberts (admiral810)

The purpose of this project was to identify which states had a larger density of breweries compared to their population. The ETL process was leveraged in this project, starting with where we would access the data that we would use. After choosing the data sources, we determined the process to transform the initial datasets to what was required for our final analysis. Below is a more detailed step-by-step of our processk as well as the overall outcome.

## Extract

The brewery data was received as a csv from a user on Kaggle (https://www.kaggle.com/brkurzawa/us-breweries). The source of the data is from https://www.beermonthclub.com/, and it contains information about name, type of brewery, address, website and state of the breweries on the site. The census data was taken from the census website (https://www.census.gov/data/tables/time-series/demo/popest/2010s-state-total.html). It contains information on the population from 2010 as well as the population estimates for the years 2011 to 2018 for states and regions in the United States.

## Transform

The data was imported to a Jupyter notebook in order to use Python and a Pandas dataframe to transform the data. For the brewery data, the data was trimmed down to the brewery name, type, address, and state columns. The state column was cleaned so that there would be spaces in the state names instead of the dashes to make the column consistent with the census data. 

For the census data, the data was trimmed to only include necessary columns, using the most recent population estimate available in 2018. Since there were additional rows for regions and national numbers, the is_state column was used to delete rows that were not states and then was dropped. States were reformatted to lowercase and District of Columbia was renamed as washington dc so that they would be formatted the same as the brewery data.

For both datasets, the index was labeled as id, which would be our primary key in the SQL database.


## Load
 
Data was imported into a PostgreSQL database directly from the Jupyter notebook. There were two tables created, one for the breweries data and one for population by state.

## Result

To find the answer to the initial question, a view was created for a join on states between the two databases. Within this view a calculated column was created to show count of breweries per one million people by state. We found that Vermont, Oregon, Maine, Colorado and Montana had the most breweries per one million people.

This repository contains the data, Jupyter notebook, and SQL queries that were used to complete this project.