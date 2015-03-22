##README file for the GetCleanProject Repository.

The Git Hub GetCleanProject repository consists of five files created to satisfy the requirements for the Coursera course Getting and Cleaning Data.  The project expected students to obtain tables from the Human Activity Recognition Using Smartphones Data Set (Anguita et al, 2013), process the data in R (R Core Team, 2014), and output presentable and summarized data files that met the principles of “tidy data” as defined by Wickham (2014).  The first – this readme file – discusses the overall methodology that went into the project.  Another document - the codebook – describes the variables that were processed.  The third file is the actual R script that reads-in, processes, and creates the two datasets (it is also present in the readme).  The final two files are the output datasets, as text file.

### The Data Files

According to Wickham, tidy data sets are defined by three characteristics: 1.).  Every variable in a data set is in one column, 2.) Each observation is in one row, and 3.) each observation unit comprises a table (2014, p.4).  The original database had fourteen data files, a readme file, and information codebook.  Only eight were read into R, and used for processing the data.  The file names and the information therein is described as follows:

activity_labels.txt – lists the six activities that subjects performed during the experiments.

features.txt – lists each of the dependent variables that were tested.  This data set served as the column headers for the X_train and X_test datasets.

subject_test – the list of subjects (by number) that were added as a column to a merged x_test and y_test dataset.

subject_train – the list of subject (by number) that were added as a column to a merged x_train and y_train dataset.  

x_test – the statistics for each of the measured dependent variables in the “test” run of the experiment.

x_train – the statistics for each of the measured dependent variables in the “training” run of the experiment.

y_test – the activity (as a number) performed for each of the rows in x_test dataset.

y_train – the activity (as a number) performed for each of the rows in the x_train dataset.

Most of the opening lines of the R script are readin files.  However, the first three lines assume the user has installed the dplyr, tidyr, and reshape2 packages.  These lines open those those libraries.  A few additional lines provide column headers to the subject list:

The opening lines of code are:


ASSUMES tidyr, dplyr, and reshape2 PACKAGES WERE INSTALLED. OPENS PACKAGES FOR R.
library(tidyr)
library(dplyr)
library(reshape2)

READ IN FILES. I've kept the names identical to those in the database for reference.

  X_test<- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test<- read.table("./UCI HAR Dataset/test/y_test.txt")
  names(y_test)<- "ActNo"
  subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")
  names(subject_test)<- "Subject"
  
  X_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train<- read.table("./UCI HAR Dataset/train/y_train.txt")
  names(y_train)<- "ActNo"
  subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt")
  names(subject_train)<- "Subject"
  
  features<- read.table("./UCI HAR Dataset/features.txt")
  activity_labels<- read.table("./UCI HAR Dataset/activity_labels.txt")
  names(activity_labels)<- c("ActNo","Activity")  


### Processing the Data Files and Outputing Data Files

The majority of the code is focused on merging the datasets, naming column variables, extracting the lines that contain either mean (mean frequencies) or standard deviations, melting the data, grouping the data, summarizing the data, and finally outputting the tdata.  The coder regrets not simplifying the code with piping as allowed by the dplyr package.  Time constraints and novice programming experience were limitations.  

The code below shows the process (with description) of each of the steps taken to produce the output txt file.


ADD COLUMN LABELS to X_test and X_train.
AND REMOVE EXTRANEOUS VARIABLES.  
  colums<- features[,2]
  names(X_test)<- colums
  names(X_train)<- colums

  aTest<- X_test[,grepl("-mean()|-std()",colnames(X_test))]
  aTrain<- X_train[,grepl("-mean()|-std()",colnames(X_train))]
  
ADD TEST/TRAIN LABLES TO DATA AND
ADD SUBJECT and ACTIVITY LABELS
  bTest<- mutate(aTest, Run = "Test")
  bTrain<- mutate(aTrain, Run = "Train")
  
  cTest<- cbind(subject_test, y_test, bTest)
  cTrain<- cbind(subject_train, y_train, bTrain)

COMBINE TEST and TRAIN DATASETS
AND MERGE IN ACTIVITY NAMES, ARRANGE MERGED COLUMNS
  combined<- rbind(cTest, cTrain)

  merged<-merge(combined, activity_labels) 
  selected<-select(merged, Subject, Activity, Run, -ActNo, 3:81) 
  TiD<-arrange(selected,Subject, Run, Activity)
  write.table(TiD, "TiD.txt", row.names = FALSE)


 MELT DATA AND SEPERATE VARIABLE NAMES
  melted<- melt(TiD,id = c("Run", "Subject","Activity"))
SEPARATE 
  separated<- separate(melted, variable, c("Variable", "Statistic", "Axis"))

GROUP_BY, DCast, ARRANGE AND OUTPUT  
  grouped<- group_by(separated, Run, Subject, Activity, Variable, Axis, Statistic)
  summarized<- summarize(grouped, mean(value))
  casted<- dcast(summarized, Run + Subject + Activity ~ Variable + Axis + Statistic)  
  TiDMean<- arrange(casted, Subject, Run, Activity)
  write.table(TiDMean, "TiDMean.txt", row.names = FALSE)


The output files satisfy Wickham’s tiny data principles.  Each column has its own variable, each row has a single observation, and the table consists of an observational unit.  The raw tidy dataset was melted to group the variables appropriately for summarizing.  In casting (reforming) the tidy dataset, R merges the names with underscores (such as the tri-axial measurement and the associated statistic).  


#### References:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.  (2013, April 24 - 26).  A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium.  Files retrieved in March 2015 from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


R Development Core Team.  R Foundation of Statistical Computing.  (2014, October 31).  R Program Version 3.1.2  (Pumpkin Helmet).  Vienna, Austria.  http://www.R-project.org.

Wickham, H.  (2014, September).  Tidy Data.  Journal of Statistical Software.  59(10), 
http://www.jstatsoft.org/v59/i10 

