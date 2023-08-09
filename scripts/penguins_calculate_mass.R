library(palmerpenguins)

# Define path to output file
output_tsv <- file.path("results", "penguins_mass.tsv")

# Create data frame of mean mass for each species
penguin_mass <- penguins |>
  dplyr::group_by(species) |>
  # ignore NAs when calculating mean
  dplyr::summarize(mean_mass = mean(body_mass_g, na.rm=TRUE))

# Export to TSV
readr::write_tsv(penguin_mass, output_tsv)
