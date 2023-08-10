# Load libraries and functions
library(tidyverse)
library(palmerpenguins)
source(
  here::here("scripts", "utils.R")
)

# define output files
output_model_fit <- here::here("results", "penguin_model_fit.tsv")
output_model_figure <- here::here("plots", "penguin_model_scatterplot.png")

# run model
penguin_model <- run_tidy_regression(
  penguins,
  "flipper_length_mm",
  "body_mass_g"
)

# export model
write_tsv(penguin_model, output_model_fit)

# Run and export plot of regression
plot_regression_scatterplot(
  penguins,
  flipper_length_mm,
  body_mass_g,
  output_model_figure
)



