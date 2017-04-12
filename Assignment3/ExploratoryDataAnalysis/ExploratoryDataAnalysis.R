args<-commandArgs(TRUE)
pimadataset<-read.csv(file=args[1],header = TRUE, sep = ",")
#1. histogram and barplots
 hist(pimadataset$NPG)
 hist(pimadataset$PGL)
 hist(pimadataset$DIA)
 hist(pimadataset$TSF)
 hist(pimadataset$INS)
 hist(pimadataset$BMI)
 hist(pimadataset$DPF)
 hist(pimadataset$AGE)
 hist(pimadataset$Diabet)
 hist(pimadataset$X)
 barplot(pimadataset$NPG)
 barplot(pimadataset$PGL)
 barplot(pimadataset$DIA)
 barplot(pimadataset$TSF)
 barplot(pimadataset$INS)
 barplot(pimadataset$BMI)
 barplot(pimadataset$DPF)
 barplot(pimadataset$AGE)
 barplot(pimadataset$Diabet)
 
#2. Correlation between each of the attributes and the class variable
#(CONVERTING FACTOR VARIABLES TO NUMERIC)

#Variable NPG:

 factorNPG<-factor(pimadataset$NPG)
 asnumericNPG<-as.numeric(factorNPG)    
 corrNPG<-cor(asnumericNPG,y=pimadataset$Diabet)
 print(paste("Correlation between NPG and Class variable - ", corrNPG))
 
 #Variable PGL:

 factorPGL<-factor(pimadataset$PGL)
 asnumericPGL<-as.numeric(factorPGL)
 corrPGL<-cor(asnumericPGL,y=pimadataset$Diabet)
 print(paste("Correlation between PGL and Class variable - ", corrPGL))
 
 #Variable TSF:

 factorTSF<-factor(pimadataset$TSF)
 asnumericTSF<-as.numeric(factorTSF)
 corrTSF<-cor(asnumericTSF,y=pimadataset$Diabet)
 print(paste("Correlation between TSF and Class variable - ", corrTSF))


#Variable INS:

 factorINS<-factor(pimadataset$INS)
 asnumericINS<-as.numeric(factorINS)
 corrINS<-cor(asnumericINS,y=pimadataset$Diabet)
 print(paste("Correlation between INS and Class variable - ", corrINS))


#Variable BMI:

 factorBMI<-factor(pimadataset$BMI)
 asnumericBMI<-as.numeric(factorBMI)
 corrBMI<-cor(asnumericBMI,y=pimadataset$Diabet)
 print(paste("Correlation between BMI and Class variable - ", corrBMI))


#Variable DPF:

 factorDPF<-factor(pimadataset$DPF)
 asnumericDPF<-as.numeric(factorDPF)
 corrDPF<-cor(asnumericDPF,y=pimadataset$Diabet)
 print(paste("Correlation between DPF and Class variable - ", corrDPF))


#Variable AGE:

 factorAGE<-factor(pimadataset$AGE)
 asnumericAGE<-as.numeric(factorAGE)
 corrAGE<-cor(asnumericAGE,y=pimadataset$Diabet)
 print(paste("Correlation between AGE and Class variable - ", corrAGE))

 #3. Compute the correlation between all pairs of the 8 attributes
  pimadataset_matrix<-as.matrix(pimadataset)                       #saving all the data in a matrix

 value=-2                                                          #variable value will contain the highest correlation value;initialized to -2 at first

 column1=dim(pimadataset_matrix)[2]-2                              #column1 refers to the column NPG
 column2=dim(pimadataset_matrix)[2]-1                              #column2 refers to the column PGL


 for(i in 2:column1)
{
	var=i+1
    for(j in var:column2){
		
        x1<-cor(pimadataset_matrix[,i],y=pimadataset_matrix[,j])    #calculate correlation between variables A and B
		
        if(x1>value){
			value<-x1
			attr1<-pimadataset_matrix[1,i]                           #attribute A corresponding to the current highest correlation value
			attr2<-pimadataset_matrix[1,j]                           #attribute B corresponding to the current highest correlation value
		}
		
		x2<-cor(pimadataset_matrix[,j],y=pimadataset_matrix[,i])     #calculate correlation between variables B and A
		
        if(x2>value){
            value<-x2			
			attr1<-pimadataset_matrix[1,j]
			attr2<-pimadataset_matrix[1,i]
		}		
    }
}

 print(attr1)

 print(attr2)

 print(value)


