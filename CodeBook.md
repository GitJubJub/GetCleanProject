## Codebook for the GetCleanProject: An Assignment for the Getting and Cleaning Data Coursera Course


This assignment expected students to download tables from the "Human Activity Recognition Using Smartphones Data Set".  The database contained a collection of data from experiments by Anguita et al (2013).  Data files from the database may be retrieved from the url address:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.


The movements of thirty subjects performing six different activities were tracked with a Samsung Galaxy Smartphone.  Five hundred sixty different variables were monitored for each subject.  Subjects were placed into either a training or testing run of the experiment.  Our assignment specifically involved removing the measured statistics (means and standard deviations) from the variables collected and creating two tidy datasets: one with raw data, and another averaging each variable for each activity and each subject.

The first tidy dataset has the following variable names (given as columns in the order below):

### Column and Variable Name	
1	Subject - Independent variables identifying test subjects by number (numbered 1 through 30)

2	Activity - Independent variable indicating one of six activities tested (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, or Laying)

3	Run - Independent variable indicating either the test or training run of the experiment

4	tBodyAcc-mean()-X

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

50	fBodyAcc-meanFreq()-X

51	fBodyAcc-meanFreq()-Y

52	fBodyAcc-meanFreq()-Z

53	fBodyAccJerk-mean()-X

54	fBodyAccJerk-mean()-Y

55	fBodyAccJerk-mean()-Z

56	fBodyAccJerk-std()-X

57	fBodyAccJerk-std()-Y

58	fBodyAccJerk-std()-Z

59	fBodyAccJerk-meanFreq()-X

60	fBodyAccJerk-meanFreq()-Y

61	fBodyAccJerk-meanFreq()-Z

62	fBodyGyro-mean()-X

63	fBodyGyro-mean()-Y

64	fBodyGyro-mean()-Z

65	fBodyGyro-std()-X

66	fBodyGyro-std()-Y

67	fBodyGyro-std()-Z

68	fBodyGyro-meanFreq()-X

69	fBodyGyro-meanFreq()-Y

70	fBodyGyro-meanFreq()-Z

71	fBodyAccMag-mean()

72	fBodyAccMag-std()

73	fBodyAccMag-meanFreq()

74	fBodyBodyAccJerkMag-mean()

75	fBodyBodyAccJerkMag-std()

76	fBodyBodyAccJerkMag-meanFreq()

77	fBodyBodyGyroMag-mean()

78	fBodyBodyGyroMag-std()

79	fBodyBodyGyroMag-meanFreq()

80	fBodyBodyGyroJerkMag-mean()

81	fBodyBodyGyroJerkMag-std()

82	fBodyBodyGyroJerkMag-meanFreq()


