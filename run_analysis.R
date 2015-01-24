library(dplyr)

## reading datasets to variables
filepath <- "UCI HAR Dataset/test/X_test.txt"
testds <- tbl_df(read.table(filepath))  

filepath <- "UCI HAR Dataset/train/X_train.txt"
trainds <- tbl_df(read.table(filepath))

data <- rbind(testds, trainds) ## merging test and train datasets 

##reading column names
filepath <- "UCI HAR Dataset/features.txt"
colname <- read.table(filepath)
colname<-as.character(colname[,2])##delete numbers 1,2,3...
colname <- make.names(colname, unique = TRUE) ## Making syntactically valid names (select() was confused by hyphens)

##making vector with activity numbers
filepath <- "UCI HAR Dataset/test/y_test.txt"
labelstest <- scan(filepath)
filepath <- "UCI HAR Dataset/train/y_train.txt"
labelstrain <- scan(filepath)
labels <- c(labelstest, labelstrain)

##making vector of subjects for final tidy data
filepath <- "UCI HAR Dataset/test/subject_test.txt"
subjtest <- scan(filepath)
filepath <- "UCI HAR Dataset/train/subject_train.txt"
subjtrain <- scan(filepath)
subjects <- c(subjtest, subjtrain)

##replacing numbers by activity names
labels <- replace(labels, labels=="1", "WALKING")
labels <- replace(labels, labels=="2", "WALKING_UPSTAIRS")
labels <- replace(labels, labels=="3", "WALKING_DOWNSTAIRS")
labels <- replace(labels, labels=="4", "SITTING")
labels <- replace(labels, labels=="5", "STANDING")
labels <- replace(labels, labels=="6", "LAYING")

##making vector containing numbers of columns containing 
##"mad()" (Median absolute deviation) or "std()" (Standard deviation)
vec <- 1:561##561 is total number of columns
vec <- vec[grepl("mad()", colname) | grepl("std()", colname)]##grepl returns logical vector

##Extracting only the measurements on the mean and standard deviation for each measurement. 
data <- select(data, vec)

data <- cbind(labels, data) ##adding activity numbers to dataset
names(data)[1] <- "Activity"
data <- cbind(subjects, data)
names(data)[1] <- "Subjects"

##Creatung of final tidy dataset
finaldata <- summarise_each(group_by(data, Activity, Subjects), "mean")
write.table(finaldata, file="finaldata.txt", row.name=FALSE )