create_scatterplot <- function(data, selected_species, color) {
  # Filter the data for the specified species and island
  filtered_data <- data %>%
    na.omit() %>%
    filter(species == selected_species)
  
  # Create the scatterplot
  plot <- ggplot(
    filtered_data,
    aes(x = bill_length_mm, y = bill_depth_mm)
  ) +
    geom_point(color=color) +
    labs(
      x = "Bill Length (mm)",
      y = "Bill Depth (mm)",
      title = selected_species
    ) +
    theme(legend.position = "none")
  
  return(plot)
}