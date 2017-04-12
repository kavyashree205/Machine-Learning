install.packages('class', dependencies = TRUE, repos="http://cran.us.r-project.org")
library('class')
args<-commandArgs(TRUE)
pimadataset<-read.csv(file=args[1],header = TRUE, sep = ",")
pimadataset_frame<-as.data.frame(pimadataset)

#k=3-----------------------------------------------------------------------------------------------------------------------------------------------------------
k=3
total=0
	
for(j in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	cl=as.factor(pimadatasetTraining1_frame$Diabet)
	#construction of model
	knnModel<-knn(pimadatasetTraining1_frame, pimadatasetTesting1_frame, cl, k, prob=TRUE)
		
	table(pimadatasetTesting1_frame$Diabet, knnModel)
	accuracy<- (sum(knnModel==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}
	
overallAccuracy<-total/10.0
print(paste("Overall accuracy when k = ",k, "is ",overallAccuracy))
	
#k=5----------------------------------------------------------------------------------------------------------------------------------------------------------
k=5
total=0
for(j in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	cl=as.factor(pimadatasetTraining1_frame$Diabet)
	#construction of model
	knnModel<-knn(pimadatasetTraining1_frame, pimadatasetTesting1_frame, cl, k, prob=TRUE)
		
	table(pimadatasetTesting1_frame$Diabet, knnModel)
	accuracy<- (sum(knnModel==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}
	
overallAccuracy<-total/10.0
print(paste("Overall accuracy when k = ",k, "is ",overallAccuracy))

#k=7----------------------------------------------------------------------------------------------------------------------------------------------------------	
k=7
total=0
for(j in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	cl=as.factor(pimadatasetTraining1_frame$Diabet)
	#construction of model
	knnModel<-knn(pimadatasetTraining1_frame, pimadatasetTesting1_frame, cl, k, prob=TRUE)
		
	table(pimadatasetTesting1_frame$Diabet, knnModel)
	accuracy<- (sum(knnModel==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}
	
overallAccuracy<-total/10.0
print(paste("Overall accuracy when k = ",k, "is ",overallAccuracy))

#k=9----------------------------------------------------------------------------------------------------------------------------------------------------------	
k=9
total=0	
for(j in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	cl=as.factor(pimadatasetTraining1_frame$Diabet)
	#construction of model
	knnModel<-knn(pimadatasetTraining1_frame, pimadatasetTesting1_frame, cl, k, prob=TRUE)
		
	table(pimadatasetTesting1_frame$Diabet, knnModel)
	accuracy<- (sum(knnModel==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}
	
overallAccuracy<-total/10.0
print(paste("Overall accuracy when k = ",k, "is ",overallAccuracy))

#k=11----------------------------------------------------------------------------------------------------------------------------------------------------------
k=11
total=0	

for(j in 1:10)
{
	#sampling data in 90:10 ratio
	pimaDatasetIndexes1=sample(1:nrow(pimadataset_frame), size=0.1*nrow(pimadataset_frame))
	pimadatasetTesting1=pimadataset_frame[pimaDatasetIndexes1,]
	pimadatasetTraining1=pimadataset_frame[-pimaDatasetIndexes1,]
	
	pimadatasetTraining1_frame<-as.data.frame(pimadatasetTraining1)
	pimadatasetTesting1_frame<-as.data.frame(pimadatasetTesting1)
	cl=as.factor(pimadatasetTraining1_frame$Diabet)
	#construction of model
	knnModel<-knn(pimadatasetTraining1_frame, pimadatasetTesting1_frame, cl, k, prob=TRUE)
		
	table(pimadatasetTesting1_frame$Diabet, knnModel)
	accuracy<- (sum(knnModel==pimadatasetTesting1_frame$Diabet)/length(pimadatasetTesting1_frame$Diabet))*100.0
	total=total+accuracy
}
	
overallAccuracy<-total/10.0
print(paste("Overall accuracy when k = ",k, "is ",overallAccuracy))

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
	

