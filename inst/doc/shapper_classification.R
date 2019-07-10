## ----setup, include=FALSE, eval=FALSE------------------------------------
#  knitr::opts_chunk$set(echo = TRUE,
#                        message = FALSE,
#                        warning = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  shapper::install_shap()

## ----eval = FALSE, message=FALSE-----------------------------------------
#  library("DALEX")
#  Y_train <- HR$status
#  x_train <- HR[ , -6]
#  

## ----eval = FALSE, message=FALSE-----------------------------------------
#  library("randomForest")
#  set.seed(123)
#  model_rf <- randomForest(x = x_train, y = Y_train)
#  
#  library(rpart)
#  model_tree <- rpart(status~. , data = HR)

## ----eval = FALSE--------------------------------------------------------
#  library(shapper)
#  
#  p_function <- function(model, data) predict(model, newdata = data, type = "prob")
#  
#  ive_rf <- individual_variable_effect(model_rf, data = x_train, predict_function = p_function,
#              new_observation = x_train[1:2,], nsamples = 50)
#  
#  
#  ive_tree <- individual_variable_effect(model_tree, data = x_train, predict_function = p_function,
#              new_observation = x_train[1:2,], nsamples = 50)
#  

## ----eval = FALSE--------------------------------------------------------
#  ive_rf

## ----eval = FALSE--------------------------------------------------------
#  plot(ive_rf, bar_width = 4)

## ----eval = FALSE--------------------------------------------------------
#  plot(ive_rf, show_predcited = FALSE, bar_width = 4)

## ----eval = FALSE--------------------------------------------------------
#  plot(ive_rf, ive_tree, show_predcited = FALSE, bar_width = 4)

## ----eval = FALSE--------------------------------------------------------
#  ive_rf_filtered <- ive_rf[ive_rf$`_ylevel_` =="fired", ]
#  shapper:::plot.individual_variable_effect(ive_rf_filtered)

