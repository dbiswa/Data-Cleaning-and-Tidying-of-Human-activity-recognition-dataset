# Getting and Tidying Data

The goal of this project is to collect and clean a data set for later analysis. The data set was collected from accelerometer and gyroscope of Samsung Galaxy S smartphone during experiments on human activity recognition (For reference, see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Details on how the experimental data was acquired followed by the pre-processing steps are provided in codebook.md. The sections below provide detailed instructions on how this goal of getting and cleaning data can be achieved. 
## Getting started
### Prerequisites
First, download the data from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unzip the folder, named as "**UCI HAR Dataset**". This folder contains several .txt files (activity_labels.txt, features_info.txt, features.txt, README.txt) and two sub-folders, **test** and **train**. The **train** and **test** folders contain training and test data sets, respectively. The README.txt file includes all necessary information about the experiment performed and the data provided.
### Essential files
For this specific project, we need the following files:
1. activity_labels.txt, features_info.txt, features.txt and README.txt from the main folder, **UCI HAR Dataset**. 
2. subject_train.txt, X_train.txt and y_train.txt from **train** sub-folder.  
3. subject_test.txt, X_test.txt and y_test.txt from **test** sub-folder.

(Note that the .txt files present in the **Inertial Signals** folder within **train** and **test** sub-folders are not required for this specific data cleaning project)

### Explaining the file system
The original data set was partitioned to create TRAIN and TEST data sets. 
1. X_train.txt and X_test.txt are the training and test set, respectively, each of which consists of 561 variables. 
2. features_info.txt file shows information about the variables used on the feature vector.
3. features.txt file list of all the 561 features. 
4. In the subject_train.txt and subject_test.txt files, each row identifies the subject who performed the activity for each    window sample, for the train and test set, respectively. Its range is from 1 to 30.  
5. activity_labels.txt file links the class labels with their activity name. There are six acitivities.
6. In the y_train.txt and y_test.txt files, each row identifies with the class labels (ranges from 1 to 6). 

### Working directory
To get started, follow the steps below. 
1. Create a new directory **tidydata**.
2. Copy all the .txt files mentioned above to this new working directory, **tidydata**.
3. Open Rstudio, set the working directory to **tidydata**.

## Tidy Data
This section will explain the required steps performed to obtain a tidy data set. The *run_analysis.R* script provides all the required steps (step-1 through step-5) that help accomplish the goal.
### Analysis script 
#### Step-1: Merge the training and the test sets to create one data set
First read the .txt files and load the data into R using read.table() function.
1. Read data from features.txt to extract the names of the variables for both TRAIN and TEST data sets. The resulting data frame, **fea** has two columns where the second column lists the names of all the 561 variables for both train and test data. The 2nd column can then be used as a character vector to insert the names of the variables while reading X_train.txt and X_test.txt files.
2. Use read.table() to load TRAIN data set (from X_train.txt file), and use the 2nd column (V2) of **fea** data frame to name the variables of this data frame, **TX1** (use col.names=fea$V2 option). **TX1** has 7352 rows and 561 columns. It should be noted that, by default, read.table() function replaces the special characters such as *_*, *-*, *()*, and empty spaces in the variable names with dots(**.**). To avoid this, use check.names = FALSE option. The default option was used here to replace all special characters with dots(.), which can be removed later to generate clean variable names.
3. Use read.table() to load subject (from subject_train.txt file) and activity labels (from y_train.txt file) of TRAIN data. While reading the files, col.names=c("subject") and col.names=c("activity") options were included to appropriately name these vectors (**trnsub** and **trny** respectively). Both **trnsub** and **trny** have 7352 rows each.
4. Similarly, repeat # 2 and # 3 for TEST data set: load the TEST data set (from X_test.txt file) and use col.names=fea$V2 option to name the variables of this data frame, **TX2**; load subject (from subject_test.txt file) and activity labels (from y_test.txt file) of TEST data, and appropriately name these vectors (**testsub** and **testy** respectively).**TX2** has 2947 rows and 561 columns. Both **testsub** and **testy** have 2947 rows each.
5. Column bind **trnsub** and **trny**  with **TX1**. Similarly, column bind **testsub** and **testy** with **TX2** to create the complete TRAIN and TEST data frames, **train** and **test**. **train** and **test** data frames now contain 563 columns each. While **train** has 7352 rows, **test** has 2947 rows.
6. Row binding function can thus bse used to merge **train** and **test** data frames to create a single data frame, **merged_data**, which contains 10299 rows and 563 columns.
This completes the Step-1 where the goal was to merge the TRAIN and TEST data sets, generating a single data frame, **merged_data**,  which is resent in a wide form.
#### Step-2: Extract only the measurements on the mean and standard deviation for each measurement.
The select function from dplyr package can be used to select only those variables that present mean and standard deviation values for each measurement. Additionally, the 'subject' and 'activity' variables from the **merged_data** data frame must be retained in this new subset. To accomplish this goal, following steps are followed:
1. Create a character vector **vars** (vars <- c("subject", "activity")), which can used to select specific variables from the 'subject' and 'activity' variables from the **merged_data** data frame.
2. load library dplyr.
3. Select the subject and activity variables, and those variables measuring mean and standard deviation for each measurement in **merged_data** data frame, and create a subset, **subset_m** data frame (subset_m <- select(merged_data, one_of(vars), contains("mean"), contains("std")).
This concluded the Step-2 where a data frame, **subset_m**, was created that contains only the measurements on the mean and standard deviation for each measurement. As a result, **subset_m** data frame has 10299 rows and 88 variables.
#### Step-3: Use descriptive activity names to name the activities in the data set.
1. The activity labels are provided in the activity_labels.txt file. First, create a vector (**act**) containing the activity names and assign appropriate labels (1,2,3,4,5,6) to these names (following activity_labels.txt file).
(**act** <- c("walking"=1, "walkingupstairs"=2, "walkingdownstairs"=3, "sitting"=4, "standing"=5, "laying"=6))
2. By using the names() and match() functions, the activity labels in the activity column of **subset_m** data frame can be replaced by the respective activity names (subset_m$activity <- names(act)[match(subset_m$activity, act)]).
This concludes the step-3, where the goal was to replace the activity labels (1,2,3,4,5,6) with the activity names provided in the activity_labels.txt file.
#### Step-4: Add appropriate labels for the variable names
This step requires cleaning of the variable names of the **subset_m** data frame, which has 88 variables. This includes three steps to generate clean variable names: 1. using tolower() function, change all letters to lowercase; 2. by using gsub(), remove the dots(.) from the variable names; 3. to create more explicit variable names, replace the variable names starting with "t" and "f" with "time" and "freq", respectively, to denote time and frequency domain variables.
      The magrittr package provides pipe-like operator (%>%), similar to "dplyr" package, to pipe a value forward into and expression/function call (for reference see:https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html). This package can be used to combine several operations into one. 
1. Install and load the magrittr package. 
2. Create a small function to rename the variables (rename_all <- function(df, fun){ setNames(df, fun(names(df)))}). 
3. Use %>% operator from magrittr package to perform several "renaming of variables" operations at once to generate a new data frame (**laveled**) with cleaner variable names (**laveled** <- **subset_m** %>% rename_all(. %>% tolower %>% gsub("\\.", "", .) %>% gsub("^t", "time", .) %>% gsub("^f", "freq", .))). 
4. To create the final tidy data set, rows are ordered by the 1st fixed variable (subject), breaking ties with the 2nd fixed variable (activity) in the **laveled** data frame, following the tidy data principles (for reference see: Tidy Data by Hadley Wickham, J. Statistical Software)(**tidy_data** <- arrange(laveled, subject, activity)).
  This concludes the step-4, where the goal was to generate cleaner variable names. The resulted data frame, **tidy_data** has 10299 rows and 88 columns.
#### Step-5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
To create another data set, where average of each variable for each activity and each subject is calculated, the variables subject and activity can be grouped, by using group_by() from dplyr package. on this grouped data, summarise_all() from dplyr can then be used to generate mean value of variable for each activity and each subject in the **tidy_data** data frame. %>% operator can be used to combine all operations (**tidy_data_2** <- tidy_data %>% group_by(subject, activity) %>% summarise_all(mean)). The data frame **tidy_data_2** has 180 rows and 88 columns.
Finally, this tidy data frame **tidy_data_2** can be saved. To save in .txt file, use write.table() function. (write.table(tidy_data_2,"tidy_data.txt",row.names=FALSE)). 

## Conclusion
This resulting tidy data set,tidy_data.txt, can now be used for further analysis.
