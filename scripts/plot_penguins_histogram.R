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

# Define output plot filename
plot_file <- here::here("plots", 
                        glue::glue("penguins_histogram_{user_bins}_bins.png")
)

# Make histogram of penguin bill depth --------
hist_plot <- ggplot(penguins) +
  aes(x = bill_depth_mm) +
  geom_histogram(bins = user_bins) +
  labs(x = "Penguin bill depth (mm)")

# Export plot to file ---------------
ggsave(filename = plot_file, 
       plot = hist_plot)