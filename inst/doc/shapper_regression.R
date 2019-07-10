## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      message = FALSE,
                      warning = FALSE)

## ----eval = FALSE--------------------------------------------------------
#  library("shapper")

## ---- eval = FALSE-------------------------------------------------------
#  shapper::install_shap()

## ----eval = FALSE--------------------------------------------------------
#  library("titanic")
#  titanic <- titanic_train[,c("Survived", "Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked")]
#  titanic$Survived <- factor(titanic$Survived)
#  titanic$Sex <- factor(titanic$Sex)
#  titanic$Embarked <- factor(titanic$Embarked)
#  titanic <- na.omit(titanic)
#  head(titanic)

## ----eval = FALSE--------------------------------------------------------
#  library("randomForest")
#  set.seed(123)
#  model_rf <- randomForest(Survived ~ . , data = titanic)
#  model_rf

## ----eval = FALSE--------------------------------------------------------
#  new_passanger <- data.frame(
#              Pclass = 1,
#              Sex = factor("male", levels = c("female", "male")),
#              Age = 8,
#              SibSp = 0,
#              Parch = 0,
#              Fare = 72,
#              Embarked = factor("C", levels = c("","C","Q","S"))
#  )

## ----eval = FALSE--------------------------------------------------------
#  library("DALEX")
#  exp_rf <- explain(model_rf, data = titanic[,-1])

## ----eval = FALSE--------------------------------------------------------
#  library("shapper")
#  ive_rf <- shap(exp_rf, new_observation = new_passanger)
#  ive_rf

## ----eval = FALSE--------------------------------------------------------
#  plot(ive_rf)

