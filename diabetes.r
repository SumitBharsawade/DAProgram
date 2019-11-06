diab<-read.csv(file.choose(),,stringsAsFactors = TRUE)
View(diab)
summary(diab)
table(diab$Outcome)

library(e1071)
library(caret)
s<-sample(1:nrow(diab),0.7*nrow(diab))
train=diab[s,]
test=diab[-s,]
test1=test[,1:8]

print(nrow(train))
print(nrow(test))

model=naiveBayes(Outcome~.,data = train)
result=predict(model,test1)
model
result
confusionMatrix(result,test$Outcome)
