README :
========

For the Pima dataset, the Naive Bayesian classification works best with an overall accuracy of 76.57%
In addition, the Linear and Radial kernels of the SVM classifier also work well with an average accuracy of 77.20% and 76.35% respectively.


COMPILING THE SOURCE CODE FROM COMMAND LINE :
-----------------------------------------------

1. Exploratory data analysis

Generic run command - Rscript ExploratoryDataAnalysis.R <file-name> 

Example -

	For pima dataset:
	Rscript ExploratoryDataAnalysis.R "pima.csv"
	(the file pima.csv has been included in the folder ExploratoryDataAnalysis and hence execution can be done by navigating into this folder and entering 
	the above command in the command prompt along with the file name)

NOTE :	Histogram and barplots are in the folders HISTOGRAM and BARPLOT respectively
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. Naive Bayes Classification

Generic run command - Rscript naiveBayes.R <file-name> 

Example -

	For pima dataset:
	Rscript naiveBayes.R "pima.csv"
	(the file pima.csv has been included in the folder NaiveBayes and hence execution can be done by navigating into this folder and entering 
	the above command in the command prompt along with the file name)
	
NOTE : In the earlier submission, code was written separately for all 10 iterations along with calculated accuracy values. Here, that part of the code is written 
in a for loop that contains code to display the accuracy as well.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
3. SVM 

Generic run command - Rscript SVM.R <file-name> 

Example -

	For pima dataset:
	Rscript SVM.R "pima.csv"
	(the file pima.csv has been included in the folder SVM and hence execution can be done by navigating into this folder and entering 
	the above command in the command prompt along with the file name)
	
NOTE : In the earlier submission, code was written separately for all 10 iterations along with calculated accuracy values. Here, that part of the code is written 
in a for loop that contains code to display the accuracy as well.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
4. kNN 

Generic run command - Rscript kNN.R <file-name> 

Example -

	For pima dataset:
	Rscript kNN.R "pima.csv"
	(the file pima.csv has been included in the folder kNN and hence execution can be done by navigating into this folder and entering 
	the above command in the command prompt along with the file name)
	
NOTE : In the earlier submission, code was written separately for all 10 iterations along with calculated accuracy values. Here, that part of the code is written 
in a for loop that contains code to display the accuracy as well.