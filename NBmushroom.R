
mushrooms <- read.csv(file.choose(), stringsAsFactors = TRUE)
str(mushrooms)
mushrooms$veil_type <- NULL
#removing veil type from the dataset as not useful
str(mushrooms)
table(mushrooms$class)
summary(mushrooms)
freq <- function(x){table(x)/length(x)*100}

freq(mushrooms$class)


set.seed(2)
s=sample(1:nrow(mushrooms),0.7*nrow(mushrooms))
mushrooms_train=mushrooms[s,]
mushrooms_test=mushrooms[-s,]
mush_test1<- mushrooms_test[, -1]


#set.seed(123)
#train_sample <- sample(8124,7000)
#str(train_sample)
#mushrooms_train <- mushrooms[train_sample, ]
#mushrooms_test  <- mushrooms[-train_sample, ]
#install.packages('RWeka')
#library(RWeka)
library(e1071)
library(caret)
model <- naiveBayes(class ~. , data = mushrooms_train)
tem=mushrooms_test$class
mushrooms_test$class=NULL
pred <- predict(model, mushrooms_test )
#confusionMatrix(pred,mushrooms_test$class)
confusionMatrix(pred,tem)
