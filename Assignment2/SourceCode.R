library(rpart) 
 
args<-commandArgs(TRUE)
dataset1<-read.csv(file=args[1],header = TRUE, sep = ",")
dataset1_traindata<-as.data.frame(dataset1)
#Create a decision tree model
asn2tree<-rpart(Class ~ XB+XC+XD+XE+XF
								+XG+XH+XI+XJ+XK+XL
								+XM+XN+XO+XP+XQ+XR
								+XS+XT+XU,data=dataset1_traindata,method='class',
								parms = list(split = 'information'))
#Summary of the model
printcp(asn2tree)
#Plotting the model
par(mar=rep(0.1,4))
plot(asn2tree)
text(asn2tree)
#Pruning the model
asn2prunedtree<-prune(asn2tree,cp=0.010000)
par(mar=rep(0.1,4))
plot(asn2prunedtree)
text(asn2prunedtree)
#Predicting the test dataset using the constructed model
testset1file<-read.csv(file=args[3],header = TRUE, sep = ",")
table(predict(asn2prunedtree,testset1file,type='class'),testset1file$Class)



