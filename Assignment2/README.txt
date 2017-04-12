NOTE : Since the code is being executed from command prompt, it needs to be run twice for the two datasets dataset1 and dataset2. Hence, a common code has been 
included in Sourcecode.R (earlier had included the same code for both datasets in the file SourceFile.txt)
Please do not consider it as a change in the code.

README - ASSIGNMENT2
---------------------
Package used - R package rpart.
Other parameters used -
Example : asn2tree<-rpart(Class ~ XB+XC+XD+XE+XF+XG+XH+XI+XJ+XK+XL+XM+XN+XO+XP+XQ+XR+XS+XT+XU,data=dataset1_traindata,method='class',
		parms = list(split = 'information'))
1. method = "class"                      (classification tree)
2. parms = list(split = "information")   (use entropy;split the decision tree based on information gain)

Example : > asn2prunedtree<-prune(asn2tree,cp=0.010000)

1. cp=value                              (pruning the tree based on Complexity Parameter with least error)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

COMPILING THE SOURCE CODE FROM COMMAND LINE :
-----------------------------------------------

Generic run command - Rscript SourceCode.R <training-data-file-name> <validation-data-file-name> <test-data-file-name>

Examples -

	For Dataset 1:
	Rscript SourceCode.R "D:/dataset1/training_set.csv" "D:/dataset1/validation_set.csv" "D:/dataset1/testing_set.csv"
	
	For Dataset 2:
	Rscript SourceCode.R "D:/dataset2/training_set.csv" "D:/dataset2/validation_set.csv" "D:/dataset2/testing_set.csv"
	

NOTE :	THE ACCURACY VALUES ARE COMPUTED AND SHOWN IN THE FILE "Output-Summary.txt"
		DETAILED SUMMARY OF THE MODEL IS SHOWN IN "Output-Summary.txt"

-------------------------------------------------------------------------------------------------------------------------------------------------------------------