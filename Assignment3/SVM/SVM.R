install.packages('e1071', dependencies = TRUE, repos="http://cran.us.r-project.org")
library('e1071')
args<-commandArgs(TRUE)
pimadataset<-read.csv(file=args[1],header = TRUE, sep = ",")
pimadataset_frame<-as.data.frame(pimadataset)

#DEFAULT KERNEL 

total=0
for(i in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	#construction of model
	svmDefaultModel <- svm(as.factor(Diabet) ~ ., data = pimadatasetTraining1_frame)
	predictedClass<-predict(svmDefaultModel, pimadatasetTesting1_frame, type='class')
	table(predictedClass, pimadatasetTesting1_frame$Diabet)
	accuracy<- (sum(predictedClass==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}

overallAccuracy<-total/10.0
print(paste("Overall accuracy using Default kernel", overallAccuracy))

# LINEAR KERNEL **********************************************************************************************************************************************

total=0
for(i in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	#construction of model
	svmDefaultModel <- svm(as.factor(Diabet) ~ ., data = pimadatasetTraining1_frame, kernel='linear')
	predictedClass<-predict(svmDefaultModel, pimadatasetTesting1_frame, type='class')
	table(predictedClass, pimadatasetTesting1_frame$Diabet)
	accuracy<- (sum(predictedClass==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}

overallAccuracy<-total/10.0
print(paste("Overall accuracy using Linear kernel", overallAccuracy))

# POLYNOMIAL KERNEL ****************************************************************************************************************************************

total=0
for(i in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	#construction of model
	svmDefaultModel <- svm(as.factor(Diabet) ~ ., data = pimadatasetTraining1_frame, kernel='polynomial')
	predictedClass<-predict(svmDefaultModel, pimadatasetTesting1_frame, type='class')
	table(predictedClass, pimadatasetTesting1_frame$Diabet)
	accuracy<- (sum(predictedClass==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}

overallAccuracy<-total/10.0
print(paste("Overall accuracy using Polynomial kernel", overallAccuracy))

# RADIAL KERNEL *******************************************************************************************************************************************

total=0
for(i in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	#construction of model
	svmDefaultModel <- svm(as.factor(Diabet) ~ ., data = pimadatasetTraining1_frame, kernel='radial')
	predictedClass<-predict(svmDefaultModel, pimadatasetTesting1_frame, type='class')
	table(predictedClass, pimadatasetTesting1_frame$Diabet)
	accuracy<- (sum(predictedClass==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}

overallAccuracy<-total/10.0
print(paste("Overall accuracy using Radial kernel", overallAccuracy))

# SIGMOID KERNEL *******************************************************************************************************************************************

total=0
for(i in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	#construction of model
	svmDefaultModel <- svm(as.factor(Diabet) ~ ., data = pimadatasetTraining1_frame, kernel='sigmoid')
	predictedClass<-predict(svmDefaultModel, pimadatasetTesting1_frame, type='class')
	table(predictedClass, pimadatasetTesting1_frame$Diabet)
	accuracy<- (sum(predictedClass==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}

overallAccuracy<-total/10.0
print(paste("Overall accuracy using Sigmoid kernel", overallAccuracy))

#***********************************************************************************************************************************************************