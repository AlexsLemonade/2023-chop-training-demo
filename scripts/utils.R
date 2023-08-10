#' Perform simple linear regression and return tidied fit
#'
#' @param df The data frame that contains variables for modeling
#' @param x_var A string of the x (predictor) variable to model
#' @param y_var A string of the y (response) variable to model
#'
#' @return A data frame of the tidied model fit
#'
#' @examples
#' run_tidy_regression(iris, "Sepal.Length", "Sepal.Width")
run_tidy_regression <- function(df, x_var, y_var) {
  
  # build model formula from input strings
  model_formula <- as.formula(
    glue::glue("{y_var} ~ {x_var}")
  )
  
  # perform regression using formula
  model_fit <- lm(model_formula, data = df)
  
  # tidy the output
  tidy_model_fit <- broom::tidy(model_fit)
  
  # return tidy output
  return(tidy_model_fit)
}



#' Plot scatterplot associated with a regression model
#'
#' @param df Data frame containing variables to plot
#' @param x_var The predictor variable plainly written (not a string)
#' @param y_var The predictor variable plainly written (not a string)
#' @param filename Filename to export figure to
#'
#' @examples
#'  plot_regression_scatterplot(iris, Sepal.Length, Sepal.Width, "sepal_model.png")
#'
#' @return Returns plot object, while also exporting to file
plot_regression_scatterplot <- function(df,
                                        x_var,
                                        y_var,
                                        filename) {
  
  # Create basic scatterplot
  scatterplot <- ggplot(df) +
    aes(x = {{x_var}}, y = {{y_var}}) +
    geom_point() +
    # Add trendline
    geom_smooth(method = "lm")
  
  # Export to file at default size
  ggsave(filename, scatterplot)
  
  # Return plot object
  return(scatterplot)
}
