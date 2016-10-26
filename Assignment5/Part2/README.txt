Assignment 5 - PART II (CODE IS WRITTEN IN PYTHON)
----------------------

Execution of code from command line:
-------------------------------------
File name - tweets-k-means.py
COMMAND : python tweets-k-means.py <numberOfClusters> <initialSeedsFile> <TweetsDataFile> <outputFile>

Example :
---------
     G:\Assignment5\Part2> python tweets-k-means.py 25 "http://www.utdallas.edu/~axn112530/cs6375/assignment5/InitialSeeds.txt" "http://www.utdallas.edu/~axn112530/cs6375/assignment5/Tweets.json" "tweets-k-means-output.txt"
	
	(Part2 is the directory where tweets-k-means.py is saved; 
	Output is stored in the file tweets-k-means-output.txt in the current directory;
	Number of clusters is always set to 25)


RESULT: (for k=25)
--------------------------------------------------
		Number of Clusters		Validation SSE
--------------------------------------------------
			25					30.4183938584

------------------------------------------------------------------------------------------------------------------------------------------------------------------



