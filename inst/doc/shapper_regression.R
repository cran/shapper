## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      message = FALSE,
                      warning = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  library("shapper")

## ---- eval = FALSE-------------------------------------------------------
#  shapper::install_shap()

## ----eval=FALSE----------------------------------------------------------
#  library("DALEX")
#  titanic_train <- titanic[,c("survived", "class", "gender", "age", "sibsp", "parch", "fare", "embarked")]
#  titanic_train$survived <- factor(titanic_train$survived)
#  titanic_train$gender <- factor(titanic_train$gender)
#  titanic_train$embarked <- factor(titanic_train$embarked)
#  titanic_train <- na.omit(titanic_train)
#  head(titanic_train)

## ----eval=FALSE----------------------------------------------------------
#  library("randomForest")
#  set.seed(123)
#  model_rf <- randomForest(survived ~ . , data = titanic_train)
#  model_rf

## ----eval=FALSE----------------------------------------------------------
#  new_passanger <- data.frame(
#              class = factor("1st", levels = c("1st", "2nd", "3rd", "deck crew", "engineering crew", "restaurant staff", "victualling crew")),
#              gender = factor("male", levels = c("female", "male")),
#              age = 8,
#              sibsp = 0,
#              parch = 0,
#              fare = 72,
#              embarked = factor("Cherbourg", levels = c("Belfast", "Cherbourg", "Queenstown", "Southampton"))
#  )

## ----eval=FALSE----------------------------------------------------------
#  library("DALEX")
#  exp_rf <- explain(model_rf, data = titanic_train[,-1], y = as.numeric(titanic_train[,1])-1)

## ----eval=FALSE----------------------------------------------------------
#  library("shapper")
#  ive_rf <- shap(exp_rf, new_observation = new_passanger)
#  ive_rf

## ----eval=FALSE----------------------------------------------------------
#  plot(ive_rf)

