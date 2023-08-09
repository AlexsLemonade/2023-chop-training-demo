# Load libraries ---------
library(ggplot2)
library(palmerpenguins)
library(optparse)

# Load input options -------
option_list <- list(
  make_option(
    opt_str = c("--bins"),
    type = "integer",
    default = 40,
    help = "number of bins to use in the histogram"
  )
)
opt <- parse_args(OptionParser(option_list = option_list))
user_bins <- opt$bins

# Make histogram of penguin bill depth --------
ggplot(penguins) +
  aes(x = bill_depth_mm) +
  geom_histogram(bins = user_bins) +
  labs(x = "Penguin bill depth (mm)")
