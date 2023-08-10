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
