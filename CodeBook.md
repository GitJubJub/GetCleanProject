## Codebook for the GetCleanProject: An Assignment for the Getting and Cleaning Data Coursera Course

This assignment expected students to download tables from the "Human Activity Recognition Using Smartphones Data Set".  The database contained a collection of data from experiments by Anguita et al (2013).  Data files from the database may be retrieved from at the url address:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.

The movements of thirty subjects performing six different activities were tracked with a Samsung Galaxy Smartphones.  Five hundred sixty different variables were monitored for each subject.  Subjects were placed into either a training or testing run of the experiment.  Our assignment specifically requested acquiring only the measured descriptive statistics (means and standard deviations) from the variables collected and creating two tidy datasets, one with raw data, and another summarizing the average of each variable for each activity and each subject.

The tidy dataset has the following variable names (equivalently column names, provided in the tidy dataset in this order):

### Column and Variable Name	
1	Run - Independent variable indicating either the test or training run of the experiment
2	Activity - Independent variable indicating one of six activities tested (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, or Laying)
3	Subject - Independent variables identifying test subjects by number (numbered 1 through 30)
4	tBodyAcc-mean()-X (Columns 13 through 69 are dependent test variables indicating the tri-axial [x,y,z] vector or body statistic [mean, standard deviation]) 
5	tBodyAcc-mean()-Y
6	tBodyAcc-mean()-Z
7	tBodyAcc-std()-X
8	tBodyAcc-std()-Y
9	tBodyAcc-std()-Z
10	tGravityAcc-mean()-X
11	tGravityAcc-mean()-Y
12	tGravityAcc-mean()-Z
13	tGravityAcc-std()-X
14	tGravityAcc-std()-Y
15	tGravityAcc-std()-Z
16	tBodyAccJerk-mean()-X
17	tBodyAccJerk-mean()-Y
18	tBodyAccJerk-mean()-Z
19	tBodyAccJerk-std()-X
20	tBodyAccJerk-std()-Y
21	tBodyAccJerk-std()-Z
22	tBodyGyro-mean()-X
23	tBodyGyro-mean()-Y
24	tBodyGyro-mean()-Z
25	tBodyGyro-std()-X
26	tBodyGyro-std()-Y
27	tBodyGyro-std()-Z
28	tBodyGyroJerk-mean()-X
29	tBodyGyroJerk-mean()-Y
30	tBodyGyroJerk-mean()-Z
31	tBodyGyroJerk-std()-X
32	tBodyGyroJerk-std()-Y
33	tBodyGyroJerk-std()-Z
34	tBodyAccMag-mean()
35	tBodyAccMag-std()
36	tGravityAccMag-mean()
37	tGravityAccMag-std()
38	tBodyAccJerkMag-mean()
39	tBodyAccJerkMag-std()
40	tBodyGyroMag-mean()
41	tBodyGyroMag-std()
42	tBodyGyroJerkMag-mean()
43	tBodyGyroJerkMag-std()
44	fBodyAcc-mean()-X
45	fBodyAcc-mean()-Y
46	fBodyAcc-mean()-Z
47	fBodyAcc-std()-X
48	fBodyAcc-std()-Y
49	fBodyAcc-std()-Z
50	fBodyAccJerk-mean()-X
51	fBodyAccJerk-mean()-Y
52	fBodyAccJerk-mean()-Z
53	fBodyAccJerk-std()-X
54	fBodyAccJerk-std()-Y
55	fBodyAccJerk-std()-Z
56	fBodyGyro-mean()-X
57	fBodyGyro-mean()-Y
58	fBodyGyro-mean()-Z
59	fBodyGyro-std()-X
60	fBodyGyro-std()-Y
61	fBodyGyro-std()-Z
62	fBodyAccMag-mean()
63	fBodyAccMag-std()
64	fBodyBodyAccJerkMag-mean()
65	fBodyBodyAccJerkMag-std()
66	fBodyBodyGyroMag-mean()
67	fBodyBodyGyroMag-std()
68	fBodyBodyGyroJerkMag-mean()
69	fBodyBodyGyroJerkMag-std()

