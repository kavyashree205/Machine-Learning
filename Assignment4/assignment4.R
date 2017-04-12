args <- commandArgs(TRUE)
dataURL<-as.character(args[1])
header<-as.logical(args[2])
#print(header)
d<-read.csv(dataURL,header = header)
# create 10 samples
set.seed(123)
install.packages('e1071', dependencies = TRUE, repos="http://cran.us.r-project.org")
install.packages('ada',dependencies = TRUE, repos="http://cran.us.r-project.org")
install.packages('adabag',dependencies = TRUE, repos="http://cran.us.r-project.org")
install.packages('class', dependencies = TRUE, repos="http://cran.us.r-project.org")
install.packages("neuralnet",dependencies=TRUE, repos="http://cran.us.r-project.org")
install.packages('randomForest', dependencies = TRUE, repos="http://cran.us.r-project.org")
install.packages('rpart', dependencies = TRUE, repos="http://cran.us.r-project.org")
library('e1071')
library('ada')
library('adabag')
library('class')
library('neuralnet')
library('randomForest')
library('rpart')
options(warn=-1)
AvgAccuracyDecisionTree=0
AvgAccuracySVM=0
AvgAccuracyNaiveBayes=0
AvgAccuracykNN=0
AvgAccuracyLogisticRegression=0
AvgAccuracyNeuralNetwork=0
AvgAccuracyBagging=0
AvgAccuracyRandomForest=0
AvgAccuracyBoosting=0


decisionTreeClassification<-function(Class,trainingData,testData){
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  cl<-training_data[,as.integer(args[3])]
  decisionTreeModel<-rpart(as.factor(cl) ~ .,data=training_data,method='class',parms = list(split = 'information'),na.action=na.omit)
  cp = decisionTreeModel$cptable[which.min(decisionTreeModel$cptable[,"xerror"]),"CP"]
  prunedTree<-prune(decisionTreeModel,cp)
  predictedClass<-predict(prunedTree,test_data,type='class')
  print(table(predictedClass,test_data[,as.integer(args[3])]))
  accuracy<- (sum(predictedClass==test_data[,as.integer(args[3])])/length(test_data[,as.integer(args[3])]))*100.0
  print(paste("Decision Tree Classification Accuracy - ", accuracy))
  return(accuracy)
}

svmClassification<-function(Class,trainingData,testData){
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  cl<-training_data[,as.integer(args[3])]
  svmModel <- svm(as.factor(cl) ~ ., data = training_data, kernel='linear', na.action=na.omit)
  predictedClass<-predict(svmModel, test_data, type='class')
  print(table(predictedClass, test_data[,as.integer(args[3])]))
  accuracy<- (sum(predictedClass==test_data[,as.integer(args[3])])/length(test_data[,as.integer(args[3])]))*100.0
  print(paste("SVM Classification Accuracy - ", accuracy))
  return(accuracy)
}

naiveBayesClassification<-function(Class,trainingData,testData){
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  cl<-training_data[,as.integer(args[3])]
  
  naiveBayesModel<-naiveBayes(as.factor(cl)~.,data=training_data, na.action=na.omit)
  
  nbpredictedClass<-predict(naiveBayesModel, test_data, type='class')
  
  print(table(nbpredictedClass,test_data[,as.integer(args[3])]))
  accuracy<- (sum(nbpredictedClass==test_data[,as.integer(args[3])])/length(test_data[,as.integer(args[3])]))*100.0
  print(paste("Naive Bayes Classification Accuracy - ", accuracy))
  return(accuracy)
}

kNNClassification<-function(Class,trainingData,testData){
  k=7
  trainingData<-sapply(trainingData,as.numeric)
  testData<-sapply(testData,as.numeric)
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  
  cl<-training_data[,as.integer(args[3])]
  
  knnModel<-knn(training_data, test_data, cl, k, prob=FALSE)
  print(table(test_data[,as.integer(args[3])], knnModel))
  accuracy<- (sum(knnModel==test_data[,as.integer(args[3])])/length(test_data[,as.integer(args[3])]))*100.0
  print(paste("kNN Classification Accuracy - ", accuracy))
  return(accuracy)
}

logisticRegression<-function(Class,trainingData,testData){
  testData$V35 <- NULL
  trainingData$V35<- NULL
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  cl=training_data[,as.integer(args[3])]
  names(cl)<-'cl'
  training_subset1<-training_data[c(-(as.integer(args[3])))]
  n<-names(training_subset1)
  f <- as.formula(paste("cl ~", paste(n[!n %in% "cl"], collapse = " + ")))
  
   
  logisticRegModel <- glm(f, data = training_data, family = "binomial", na.action=na.omit)
  predictedModel<-predict(logisticRegModel, newdata=test_data, type="response",,se.fit=FALSE)
  
    threshold=0.5
	prediction<-sapply(predictedModel, FUN=function(x) if (x>threshold) 2 else 1)
  
  
  accuracy <- (sum(test_data[,as.integer(args[3])]==prediction)/length(test_data[,as.integer(args[3])]))*100.0
  print(paste("Logistic Regression Accuracy - ", accuracy))
  return(accuracy)
}

neuralNetworkClassification<-function(Class,trainingData,testData){
  
  trainingData<-sapply(trainingData,as.numeric)
  testData<-sapply(testData,as.numeric)
  training_data<-as.data.frame(trainingData)
  
  test_data<-as.data.frame(testData)
  cl<-training_data[,as.integer(args[3])]
  names(cl)<-'cl'
  
  training_subset1<-training_data[c(-(as.integer(args[3])))]
  
  n<-names(training_subset1)
  
  f <- as.formula(paste("cl ~", paste(n[!n %in% "cl"], collapse = " + ")))
  
  neuralNetModel <- neuralnet(f , training_data, hidden = ncol(training_data)-1, lifesign = "minimal", threshold=0.1)
  temp_test <- subset(test_data, select = c(n))
  predictedModel <- compute(neuralNetModel, temp_test)
  
  results <- data.frame(actual = test_data[,as.integer(args[3])], prediction = predictedModel$net.result)
  
  results$prediction <- round(results$prediction)
  
  accuracy<-(sum(results$actual==results$prediction)/length(results$actual))*100.0
  print(paste("Neural Network Classification Accuracy - ", accuracy))
  return(accuracy)
}

baggingClassification<-function(Class,trainingData,testData){
  trainingData<-sapply(trainingData,as.numeric)
  testData<-sapply(testData,as.numeric)
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  cl=training_data[,as.integer(args[3])]
  
  names(cl)<-'cl'
  training_subset1<-training_data[c(-(as.integer(args[3])))]
  n<-names(training_subset1)
  f <- as.formula(paste("cl ~", paste(n[!n %in% "cl"], collapse = " + ")))
  
  baggingModel <- bagging(f, data=training_data,mfinal=10, control=rpart.control(maxdepth=1))
  predictedModel <- predict.bagging(baggingModel,newdata=test_data)
  
  print(table(test_data[,as.integer(args[3])], predictedModel))
  accuracy<-(sum(test_data[,as.integer(args[3])]==predictedModel)/length(test_data[,as.integer(args[3])]))*100.0
  
  print(paste("Bagging Accuracy - ", accuracy))  
  return(accuracy)
}

boostingClassification<-function(Class,trainingData,testData){
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  cl<-training_data[,as.integer(args[3])]
  
  names(cl)<-'cl'
  training_subset1<-training_data[c(-(as.integer(args[3])))]
  n<-names(training_subset1)  
  f <- as.formula(paste("cl ~", paste(n[!n %in% "cl"], collapse = " + ")))
  
  boostingModel <- ada(f, data = training_data, iter=20, nu=1, type="discrete", na.action=na.omit)
 
  predictedClass<-predict(boostingModel,newdata=test_data)
  print(table(test_data[,as.integer(args[3])], predictedClass))
  accuracy<-(sum(test_data[,as.integer(args[3])]==predictedClass)/length(predictedClass))*100.0
  print(paste("Boosting Accuracy - ", accuracy))
  
  return(accuracy)
}

randomForestClassification<-function(Class,trainingData,testData){
  
  training_data<-as.data.frame(trainingData)
  test_data<-as.data.frame(testData)
  cl<-training_data[,as.integer(args[3])]
  randomForestModel<-randomForest(as.factor(cl) ~ ., data=training_data, importance=TRUE,proximity=TRUE, na.action=na.omit)
  
  rfpredictedClass<-predict(randomForestModel, test_data, type='class')
  
  print(table(rfpredictedClass,test_data[,as.integer(args[3])]))
  accuracy<- (sum(rfpredictedClass==test_data[,as.integer(args[3])])/length(test_data[,as.integer(args[3])]))*100.0
  print(paste("Random Forest Accuracy - ", accuracy))
  return(accuracy)
}

for(i in 1:10) {
  cat("Running sample ",i,"\n")
  sampleInstances<-sample(1:nrow(d),size = 0.9*nrow(d))
  
  trainingData<-d[sampleInstances,]
  testData<-d[-sampleInstances,]
  # which one is the class attribute
  
  Class<-d[,as.integer(args[3])]
  
  
  # now create all the classifiers and output accuracy values:
  AvgAccuracyDecisionTree=AvgAccuracyDecisionTree+decisionTreeClassification(Class,trainingData,testData)
  AvgAccuracySVM=AvgAccuracySVM+svmClassification(Class,trainingData,testData)
  AvgAccuracyNaiveBayes=AvgAccuracyNaiveBayes+naiveBayesClassification(Class,trainingData,testData)
  
  AvgAccuracykNN=AvgAccuracykNN+kNNClassification(Class,trainingData,testData)
  AvgAccuracyLogisticRegression=AvgAccuracyLogisticRegression+logisticRegression(Class,trainingData,testData)
  AvgAccuracyNeuralNetwork=AvgAccuracyNeuralNetwork+neuralNetworkClassification(Class,trainingData,testData)
  AvgAccuracyBagging=AvgAccuracyBagging+baggingClassification(Class,trainingData,testData)
  AvgAccuracyRandomForest=AvgAccuracyRandomForest+randomForestClassification(Class,trainingData,testData)
  
  AvgAccuracyBoosting=AvgAccuracyBoosting+boostingClassification(Class,trainingData,testData)
  # example of how to output
  # method="kNN" 
  # accuracy=0.9
  # cat("Method = ", method,", accuracy= ", accuracy,"\n")
  
}
print(paste("Decision Tree average accuracy" ,AvgAccuracyDecisionTree/10))
print(paste("SVM average accuracy" ,AvgAccuracySVM/10))
print(paste("Naive Bayes average accuracy" ,AvgAccuracyNaiveBayes/10))
print(paste("kNN average accuracy" ,AvgAccuracykNN/10))
print(paste("Logistic Regression average accuracy" ,AvgAccuracyLogisticRegression/10))

print(paste("Neural Network average accuracy" ,AvgAccuracyNeuralNetwork/10))
print(paste("Bagging average accuracy" ,AvgAccuracyBagging/10))
print(paste("Random Forest average accuracy" ,AvgAccuracyRandomForest/10))
print(paste("Boosting average accuracy" ,AvgAccuracyBoosting/10))
