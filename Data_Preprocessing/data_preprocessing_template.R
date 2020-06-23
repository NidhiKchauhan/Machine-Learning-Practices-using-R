# Data Preprocessing Template

# Importing the dataset
dataset1 = read.csv('Data.csv')

#HAndlig Missing values
dataset$Age=ifelse(is.na(dataset$Age),ave(dataset$Age, FUN=function(X)mean(X,na.rm = TRUE)), dataset$Age)
dataset$Salary=ifelse(is.na(dataset$Salary),ave(dataset$Salary, FUN=function(X)mean(X,na.rm = TRUE)), dataset$Salary)

#Encoding categorical data
dataset$Country=factor(dataset$Country,
                       levels = c('France', 'Spain', 'Germany'),
                       labels= c(1,2,3))
dataset$Purchased=factor(dataset$Purchased,
                         levels = c('Yes', 'No'),
                         labels= c(1,0))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset1$Purchased, SplitRatio = 0.8)
training_set = subset(dataset1, split == TRUE)
test_set = subset(dataset1, split == FALSE)

# Feature Scaling
training_set = scale(training_set)
test_set = scale(test_set)