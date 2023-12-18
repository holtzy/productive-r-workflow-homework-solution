library(tidyverse)

# Source functions
source(file="R/functions.R")

# Read the clean dataset
data <- readRDS(file = "input/clean_data.rds")

# Summary
summary(data)

# Calculating mean bill length for different species and islands using dplyr
data %>%
  filter(species == "Adelie") %>%
  group_by(island) %>%
  summarize(mean_bill_length = round(mean(bill_length_mm, na.rm = TRUE), 2))

# Use the function in functions.R
create_scatterplot(data, "Adelie", "Torgersen")
