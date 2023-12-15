library(tidyverse)
library(readxl)

# Read data using readxl
data <- read_excel("input/data.xlsx", na = "NA")

# Summary
summary(data)

# Calculating mean bill length for different species and islands using dplyr
data %>%
  filter(species == "Adelie") %>%
  group_by(island) %>%
  summarize(mean_bill_length = round(mean(bill_length_mm, na.rm = TRUE), 2))

# plot function
create_scatterplot <- function(data, selected_species, selected_island) {
  # Filter the data for the specified species and island
  filtered_data <- data %>%
    na.omit() %>%
    filter(species == selected_species, island == selected_island)

  # Create the scatterplot
  plot <- ggplot(
    filtered_data,
    aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)
  ) +
    geom_point() +
    labs(
      x = "Bill Length (mm)", 
      y = "Bill Depth (mm)", 
      title = paste("Penguin Bill Dimensions -", selected_species, "-", selected_island))

  return(plot)
}

# Use the function
create_scatterplot(data, "Adelie", "Torgersen")
