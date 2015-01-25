#Code Book#

##Variables in run_analysis.R##
* filepath

	This character vector takes path to several files and get used in several reading functions.

* testds

	Data frame with testing dataset.

* trainds

	Data frame with training dataset.

* data

	The whole dataset after binding previous two.

* colname

	Data frame of column names taken in features.txt.

* labelstest

	Vector of activity labels from test.

* labelstrain

	Vector of activity labels from train.

* labels 

	The whole labels vector after binding previous two.

* subjtest

	Vector of testing subjects.

* subjtrain

	Vector of training subjects.

* subjects

	The whole subjects vector after binding previous two.

* vec

	This vector using for identifying what columns we need to keep. 

* finaldata 

	Resulting tidy dataset.

##Transformations##
1. First of all two datasets (test and train) are reading into R data frames, filepath is using here as well as in other read functions.
2. These datasets are bindeng by rows into data data frame.
3. Column names are read from "features.txt" into colname. This data frame consists of 2 columns (row number and column name). So I converted it to vector of column names. And then I have used make.names() function to this vector because names where badly formatted to be good column names. 
4. Two vectors of activity labels are read from text files and binding together to vector labels.
5. Two vectors of subjects are read from text files and binding together to vector subjects.
6. Numbers in vector labels are replaced by appropriate activity name.
7. Making vector of integers from 1 to 561 (number of columns), and then converting it into logical vector where FALSE corresponds for column I must to remove from dataset.
8. Reduction of columns in data.
9. Labels and Activity columns added to data.
10. Summirizing final dataset and writing it to text file.


