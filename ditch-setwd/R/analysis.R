library(tidyverse)

# Read data using readr
data <- readr::read_csv("input/data.csv")

# Summary
summary(data)

# Calculating mean bill length for different species and islands using dplyr
data %>%
  filter(species == "Adelie") %>%
  group_by(island) %>%
  summarize(mean_bill_length = round(mean(bill_length_mm, na.rm = TRUE), 2))

# Plot using ggplot2
data %>%
  na.omit() %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)) +
  geom_point() +
  labs(x = "Bill Length (mm)", y = "Bill Depth (mm)", title = "Penguin Bill Dimensions") +
  scale_shape_manual(values = c("Adelie" = 16, "Chinstrap" = 17, "Gentoo" = 18))

print(
  round(mean(subset(
    na.omit(data), species == "Adelie" & island == "Torgersen"
  )$bill_length_mm), 2)
)
print(
  round(mean(subset(
    na.omit(data), species == "Adelie" & island == "Biscoe"
  )$bill_length_mm), 2)
)
print(
  round(mean(subset(
    na.omit(data), species == "Adelie" & island == "Dream"
  )$bill_length_mm), 2)
)
