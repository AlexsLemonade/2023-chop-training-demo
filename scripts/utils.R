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
