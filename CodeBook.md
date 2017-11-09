
# Code Book
## Information on experimental design and data set
This code book contains a description of variables in the tidy data set, which was derived and modified from the original “Human Activity Recognition Using Smartphones” dataset. The features selected in the original data set come from raw data captured from accelerometer and gyroscope raw signals. These were obtained through experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. In the modified tidy data set, training and test sets were combined followed by filtering of measurements on the mean and standard deviation value of each measurement for each subject and activity.
               
  In the original experiment, the 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz using embedded accelerometer and gyroscope in the smartphone. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. From each window, a vector of features was obtained by calculating variables from the time domain. The features were normalized and bounded within [-1,1]. 

  The time domain signals were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). The magnitude of these three-dimensional signals was calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern, where '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions: tBodyAcc-XYZ, tGravityAcc-XYZ , tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,  fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag and fBodyGyroJerkMag.

  A detailed description of all 88 variables in the tidy data set (tidy_data.csv) are provided below.

## Variable description 

1.	subject

Identifier of the subject who carried out the experiment. Its range is from 1 to 30 (30 volunteers participated in this experiment).

2.	activity

The activity performed by the subject while wearing a smartphone (Samsung Galaxy S II) on the waist. Each subject performed six activities during this experiment: ‘laying’, ‘sitting’, ‘standing’, ‘walking’, ‘walkingdownstairs’, ‘walkingupstairs’.

3.	timebodyaccmeanx

Mean value of the time domain body acceleration signal obtained from the smartphone accelerometer X-axis in standard gravity units (g).

4.	timebodyaccmeany

Mean value of the time domain body acceleration signal obtained from the smartphone accelerometer Y-axis in standard gravity units (g).

5.	timebodyaccmeanz

Mean value of the time domain body acceleration signal obtained from the smartphone accelerometer Z-axis in standard gravity units (g).

6.	timegravityaccmeanx

Mean value of the time domain gravity acceleration signal obtained from the smartphone accelerometer X-axis in standard gravity units (g).

7.	timegravityaccmeany

Mean value of the time domain gravity acceleration signal obtained from the smartphone accelerometer Y-axis in standard gravity units (g).

8.	timegravityaccmeanz

Mean value of the time domain gravity acceleration signal obtained from the smartphone accelerometer Z-axis in standard gravity units (g).

9.	timebodyaccjerkmeanx

Mean value of the time domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer X-axis in standard gravity per second squared units (g/s2).

10.	 timebodyaccjerkmeany

Mean value of the time domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Y-axis in standard gravity per second squared units (g/s2).

11.	 timebodyaccjerkmeanz

Mean value of the time domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Z-axis in standard gravity per second squared units (g/s2).

12.	 timebodygyromeanx

Mean value of the time domain angular velocity obtained from the smartphone gyroscope X-axis in radians per second units (rad/s).

13.	 timebodygyromeany

Mean value of the time domain angular velocity obtained from the smartphone gyroscope Y-axis in radians per second units (rad/s).

14.	 timebodygyromeanz

Mean value of the time domain angular velocity obtained from the smartphone gyroscope Z-axis in radians per second units (rad/s).

15.	 timebodygyrojerkmeanx

Mean value of the time domain jerk signal corresponding to angular velocity (i.e., derivative of angular velocity with respect to time) obtained from the smartphone gyroscope X-axis in radians per second squared units (rad/s2).

16.	 timebodygyrojerkmeany

Mean value of the time domain jerk signal corresponding to angular velocity (i.e., derivative of angular velocity with respect to time) obtained from the smartphone gyroscope Y-axis in radians per second squared units (rad/s2).

17.	 timebodygyrojerkmeanz

Mean value of the time domain jerk signal corresponding to angular velocity (i.e., derivative of angular velocity with respect to time) obtained from the smartphone gyroscope Z-axis in radians per second squared units (rad/s2).

18.	 timebodyaccmagmean

Mean value of the magnitude of the three-dimensional body acceleration in the time domain obtained from smartphone accelerometer in standard gravity units (g).

19.	 timegravityaccmagmean

Mean value of the magnitude of the three-dimensional gravity acceleration in the time domain obtained from smartphone accelerometer in standard gravity units (g).

20.	 timebodyaccjerkmagmean

Mean value of the magnitude of jerk corresponding to the three-dimensional body acceleration in the time domain obtained from smartphone accelerometer in standard gravity per second squared units (g/s2). 

21.	 timebodygyromagmean

Mean value of the magnitude of the three-dimensional angular velocity in the time domain obtained from smartphone gyroscope in radians per second units (rad/s).

22.	 timebodygyrojerkmagmean

Mean value of the magnitude of jerk corresponding to the three-dimensional angular velocity in the time domain obtained from smartphone gyroscope in radians per second squared units (rad/s2). 

23.	 freqbodyaccmeanx

Mean value of the frequency domain body acceleration signal obtained from the smartphone accelerometer X-axis.

24.	 freqbodyaccmeany

Mean value of the frequency domain body acceleration signal obtained from the smartphone accelerometer Y-axis.

25.	 freqbodyaccmeanz

Mean value of the frequency domain body acceleration signal obtained from the smartphone accelerometer Z-axis.

26.	 freqbodyaccmeanfreqx

Mean frequency of the frequency domain body acceleration signal obtained from the smartphone accelerometer X-axis. 

27.	 freqbodyaccmeanfreqy

Mean frequency of the frequency domain body acceleration signal obtained from the smartphone accelerometer Y-axis.

28.	 freqbodyaccmeanfreqz

Mean frequency of the frequency domain body acceleration signal obtained from the smartphone accelerometer Z-axis.

29.	 freqbodyaccjerkmeanx

Mean value of the frequency domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer X-axis.

30.	 freqbodyaccjerkmeany

Mean value of the frequency domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Y-axis.

31.	 freqbodyaccjerkmeanz

Mean value of the frequency domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Z-axis.

32.	 freqbodyaccjerkmeanfreqx

Mean frequency of the frequency domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer X-axis.

33.	 freqbodyaccjerkmeanfreqy

Mean frequency of the frequency domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Y-axis. 

34.	 freqbodyaccjerkmeanfreqz

Mean frequency of the frequency domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Z-axis. 

35.	 freqbodygyromeanx

Mean value of the frequency domain angular velocity obtained from the smartphone gyroscope X-axis.

36.	 freqbodygyromeany

Mean value of the frequency domain angular velocity obtained from the smartphone gyroscope Y-axis.

37.	 freqbodygyromeanz

Mean value of the frequency domain angular velocity obtained from the smartphone gyroscope Z-axis.

38.	 freqbodygyromeanfreqx 

Mean frequency of the frequency domain angular velocity signal obtained from the smartphone gyroscope Z-axis.

39.	 freqbodygyromeanfreqy 

Mean frequency of the frequency domain angular velocity signal obtained from the smartphone gyroscope Y-axis.

40.	freqbodygyromeanfreqz

Mean frequency of the frequency domain angular velocity signal obtained from the smartphone gyroscope Z-axis.

41.	 freqbodyaccmagmean

Mean value of the magnitude of the three-dimensional body acceleration in the frequency domain obtained from smartphone accelerometer.

42.	 freqbodyaccmagmeanfreq

Mean frequency of the magnitude of the three-dimensional body acceleration signal in the frequency domain obtained from smartphone accelerometer.

43.	freqbodybodyaccjerkmagmean

Mean value of the magnitude of jerk corresponding to the three-dimensional body acceleration in the frequency domain obtained from smartphone accelerometer.

44.	freqbodybodyaccjerkmagmeanfreq

Mean frequency of the magnitude of jerk corresponding to the three-dimensional body acceleration in the frequency domain obtained from smartphone accelerometer.

45.	freqbodybodygyromagmean

Mean value of the magnitude of the three-dimensional angular velocity in the frequency domain obtained from smartphone gyroscope.

46.	freqbodybodygyromagmeanfreq

Mean frequency of the magnitude of the three-dimensional angular velocity signal in the frequency domain obtained from smartphone gyroscope.

47.	freqbodybodygyrojerkmagmean

Mean value of the magnitude of jerk corresponding to the three-dimensional angular velocity in the frequency domain obtained from smartphone gyroscope.

48.	freqbodybodygyrojerkmagmeanfreq

Mean frequency of the magnitude of jerk corresponding to the three-dimensional angular velocity in the frequency domain obtained from smartphone gyroscope.

49.	angletbodyaccmeangravity

angle between two vectors, mean body acceleration and gravity acceleration.

50.	angletbodyaccjerkmeangravitymean

angle between two vectors, mean jerk corresponding to body acceleration and mean gravity acceleration.

51.	angletbodygyromeangravitymean

angle between two vectors, mean angular velocity and mean gravity acceleration.

52.	angletbodygyrojerkmeangravitymean

angle between two vectors, mean jerk corresponding to angular velocity and mean gravity acceleration.

53.	 anglexgravitymean

angle between two vectors, X-axis and mean gravity acceleration.

54.	 angleygravitymean

angle between two vectors, Y-axis and mean gravity acceleration.

55.	 anglezgravitymean

angle between two vectors, Z-axis and mean gravity acceleration.

56.	 timebodyaccstdx

Standard deviation of the time domain body acceleration signal obtained from the smartphone accelerometer X-axis in standard gravity units (g).

57.	 timebodyaccstdy

Standard deviation of the time domain body acceleration signal obtained from the smartphone accelerometer Y-axis in standard gravity units (g).

58.	 timebodyaccstdz

Standard deviation of the time domain body acceleration signal obtained from the smartphone accelerometer Z-axis in standard gravity units (g).

59.	 timegravityaccstdx

Standard deviation of the time domain gravity acceleration signal obtained from the smartphone accelerometer X-axis in standard gravity units (g).

60.	 timegravityaccstdy

Standard deviation of the time domain gravity acceleration signal obtained from the smartphone accelerometer Y-axis in standard gravity units (g).

61.	 timegravityaccstdz

Standard deviation of the time domain gravity acceleration signal obtained from the smartphone accelerometer Z-axis in standard gravity units (g).

62.	 timebodyaccjerkstdx

Standard deviation of the time domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer X-axis in standard gravity per second squared units (g/s2).

63.	 timebodyaccjerkstdy

Standard deviation of the time domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Y-axis in standard gravity per second squared units (g/s2).

64.	 timebodyaccjerkstdz

Standard deviation of the time domain jerk signal corresponding to body acceleration (i.e., derivative of body acceleration with respect to time) obtained from the smartphone accelerometer Z-axis in standard gravity per second squared units (g/s2).

65.	 timebodygyrostdx

Standard deviation of the time domain angular velocity obtained from the smartphone gyroscope X-axis in radians per second units (rad/s).

66.	 timebodygyrostdy

Standard deviation of the time domain angular velocity obtained from the smartphone gyroscope Y-axis in radians per second units (rad/s).

67.	 timebodygyrostdz

Standard deviation of the time domain angular velocity obtained from the smartphone gyroscope Z-axis in radians per second units (rad/s).

68.	 timebodygyrojerkstdx

Standard deviation of the time domain jerk signal corresponding to angular velocity (i.e., derivative of angular velocity with respect to time) obtained from the smartphone gyroscope X-axis in radians per second squared units (rad/s2).

69.	 timebodygyrojerkstdy

Standard deviation of the time domain jerk signal corresponding to angular velocity (i.e., derivative of angular velocity with respect to time) obtained from the smartphone gyroscope Y-axis in radians per second squared units (rad/s2).

70.	 timebodygyrojerkstdz

Standard deviation of the time domain jerk signal corresponding to angular velocity (i.e., derivative of angular velocity with respect to time) obtained from the smartphone gyroscope Z-axis in radians per second squared units (rad/s2).

71.	 timebodyaccmagstd

Standard deviation of the magnitude of the three-dimensional body acceleration in the time domain obtained from smartphone accelerometer in standard gravity units (g).

72.	 timegravityaccmagstd

Standard deviation of the magnitude of the three-dimensional gravity acceleration in the time domain obtained from smartphone accelerometer in standard gravity units (g).

73.	 timebodyaccjerkmagstd

Standard deviation of the magnitude of jerk corresponding to the three-dimensional body acceleration in the time domain obtained from smartphone accelerometer in standard gravity per second squared units (g/s2). 

74.	 timebodygyromagstd

Standard deviation of the magnitude of jerk corresponding to the three-dimensional angular velocity in the time domain obtained from smartphone gyroscope in radians per second squared units (rad/s2). 

75.	 timebodygyrojerkmagstd

Standard deviation of the magnitude of jerk corresponding to the three-dimensional angular velocity in the time domain obtained from smartphone gyroscope in radians per second squared units (rad/s2).

76.	 freqbodyaccstdx

Standard deviation of the frequency domain body acceleration signal obtained from the smartphone accelerometer X-axis.

77.	 freqbodyaccstdy

Standard deviation of the frequency domain body acceleration signal obtained from the smartphone accelerometer Y-axis.

78.	 freqbodyaccstdz

Standard deviation of the frequency domain body acceleration signal obtained from the smartphone accelerometer Z-axis.

79.	 freqbodyaccjerkstdx

Standard deviation of the frequency domain jerk corresponding to body acceleration signal obtained from the smartphone accelerometer X-axis.

80.	 freqbodyaccjerkstdy

Standard deviation of the frequency domain jerk corresponding to body acceleration signal obtained from the smartphone accelerometer Y-axis.

81.	 freqbodyaccjerkstdz

Standard deviation of the frequency domain jerk corresponding to body acceleration signal obtained from the smartphone accelerometer Z-axis.

82.	 freqbodygyrostdx

Standard deviation of the frequency domain angular velocity signal obtained from the smartphone gyroscope X-axis.

83.	 freqbodygyrostdy

Standard deviation of the frequency domain angular velocity signal obtained from the smartphone gyroscope Y-axis.

84.	 freqbodygyrostdz

Standard deviation of the frequency domain angular velocity signal obtained from the smartphone gyroscope Z-axis.

85.	 freqbodyaccmagstd

Standard deviation of the magnitude of the three-dimensional body acceleration in the frequency domain obtained from smartphone accelerometer.

86.	 freqbodybodyaccjerkmagstd

Standard deviation of the magnitude of the jerk signal corresponding to the three-dimensional body acceleration in the frequency domain obtained from smartphone accelerometer.

87.	 freqbodybodygyromagstd

Standard deviation of the magnitude of the three-dimensional angular velocity in the frequency domain obtained from smartphone gyroscope.

88.	 freqbodybodygyrojerkmagstd

Standard deviation of the magnitude of the jerk signal corresponding to the three-dimensional angular velocity in the frequency domain obtained from smartphone gyroscope.



