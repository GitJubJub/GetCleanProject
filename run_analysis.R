## WRITTEN BY AJB 3/2015 for the GETTING AND CLEANING DATA COURSERA COURSE

## ASSUMES tidyr, dplyr, and reshape2 PACKAGES WERE INSTALLED. OPENS PACKAGES FOR R.
library(tidyr)
library(dplyr)
library(reshape2)

## READ IN FILES. I've kept the names identical to those in the database for reference.

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

## ADD COLUMN LABELS to X_test and X_train.
## AND REMOVE EXTRANEOUS VARIABLES.  
  colums<- features[,2]
  names(X_test)<- colums
  names(X_train)<- colums

  aTest<- X_test[,grepl("-mean()|-std()",colnames(X_test))]
  aTrain<- X_train[,grepl("-mean()|-std()",colnames(X_train))]
  
## ADD TEST/TRAIN LABLES TO DATA AND
## ADD SUBJECT and ACTIVITY LABELS
  bTest<- mutate(aTest, Run = "Test")
  bTrain<- mutate(aTrain, Run = "Train")
  
  cTest<- cbind(subject_test, y_test, bTest)
  cTrain<- cbind(subject_train, y_train, bTrain)

## COMBINE TEST and TRAIN DATASETS
## AND MERGE IN ACTIVITY NAMES, ARRANGE MERGED COLUMNS
  combined<- rbind(cTest, cTrain)

  merged<-merge(combined, activity_labels) 
  selected<-select(merged, Subject, Activity, Run, -ActNo, 3:81) 
  TiD<-arrange(selected,Subject, Run, Activity)
  write.table(TiD, "TiD.txt", row.names = FALSE)


##  MELT DATA AND SEPERATE VARIABLE NAMES
  melted<- melt(TiD,id = c("Run", "Subject","Activity"))
  ## SEPARATE 
  separated<- separate(melted, variable, c("Variable", "Statistic", "Axis"))

## GROUP_BY, DCast, ARRANGE AND OUTPUT  
  grouped<- group_by(separated, Run, Subject, Activity, Variable, Axis, Statistic)
  summarized<- summarize(grouped, mean(value))
  casted<- dcast(summarized, Run + Subject + Activity ~ Variable + Axis + Statistic)  
  TiDMean<- arrange(casted, Subject, Run, Activity)
  write.table(TiDMean, "TiDMean.txt", row.names = FALSE)
