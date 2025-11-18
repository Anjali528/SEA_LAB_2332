# SEA_LAB_2332
Data Visualization Using R
---
title: "Car Sales Data Analysis"
name: "Anjali Desai"
output: 
---

# Introduction

This report presents a complete analysis of the **Car Sales Dataset**, using various statistical graphics to understand:

- Price distribution  
- Brand-wise sales performance  
- Relationships between variables  
- Market share  
- Time-based sales trends

Visualizations used:
- Histogram  
- Bar Plot  
- Scatter Plot  
- Box Plot  
- Line Plot  
- Pie Chart  

The goal is to understand sales trends, pricing patterns, and brand performance.

---

# Dataset Description

The dataset `car_sales.csv` contains the following columns:

| Column Name   | Description | Data Type |
|---------------|-------------|-----------|
| **Date**      | Month/year of sales | `Date` |
| **Brand**     | Car manufacturing company | `Character` / `Factor` |
| **Model**     | Specific model name | `Character` |
| **Price**     | Price of the car (in currency) | `Numeric` |
| **Units_Sold**| Number of units sold | `Integer` |


# Load Required Libraries

```{r}
library(readr)
library(dplyr)
library(ggplot2)

## R Code File

 **File:** `car_sales_analysis`
This R script includes:
- Data loading  
- 5 different types of plots  
- Clean, commented code  

To run the file:
```r
# In RStudio or R Console:
source("car_sales_analysis")


library(tidyr)

