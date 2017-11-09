#### This run analysis assumes that the following files activity_labels.txt, features.txt, subject_train.txt, X_train.txt and y_train.txt, subject_test.txt, X_test.txt and y_test.txt
#### have been copied to a local directory called tidydata, and the working directory in R has been set to this directory, tidydata. For detailed description, see ReadMe.md.

### Step-1: Merges the training and the test sets to create one data set.

## First read all data files using read.table() function: TRAIN, TEST, subject, and activity labels. 

# Read data from features.txt to extract the variable names for both TRAIN and TEST data sets.
fea <- read.table("features.txt", stringsAsFactors = FALSE)

# Read TRAIN data set and use the 2nd column (V2) of "fea" data frame to name the variables (using col.names option) of this data frame, TX1.

TX1 <- read.table(file = "X_train.txt", header = FALSE, fill = TRUE, col.names = fea$V2,  stringsAsFactors = FALSE)

## Note that, by default, read.table() function replaces the special characters such as "_", "-", "()", and empty spaces in the variable names with dots(.) (unless check.names = FALSE is used in read.table)
## For example, the variable name tBodyAcc-mean()-X becomes tBodyAcc.mean...X. The dots can be removed later to create clean variable names.

# Next, load the subject and activity labels of TRAIN data using read.table() and appropriately name the variables using col.names option from read.table.

trnsub <- read.table("subject_train.txt",col.names = c("subject"), stringsAsFactors = FALSE)
trny <- read.table("y_train.txt",col.names = c("activity"), stringsAsFactors = FALSE)

## Repeat the above steps for TEST data: 
# Read TEST data and use the 2nd column (V2) of "fea" data frame to name the variables (using col.names option) of this data frame, TX2.

TX2 <- read.table(file = "X_test.txt", header = FALSE, fill = TRUE, col.names = fea$V2, stringsAsFactors = FALSE)

# Next, load the subject and activity labels of TEST data using read.table() and appropriately name the variables using col.names option from read.table.

testsub <- read.table("subject_test.txt",col.names = c("subject"), stringsAsFactors = FALSE)
testy <- read.table("y_test.txt",col.names = c("activity"), stringsAsFactors = FALSE)

## Column bind the respective subject and activity vectors with TX1 and TX2 data frames to form complete "train" and "test" data frames.

train <- cbind(trnsub, trny, TX1)
test <- cbind(testsub, testy, TX2)

# Note that in "train" and "test" data frames, the first two variables are "subject", and "activity" , respectively.
# These two variables are followed by 561 variables from the TRAIN and TEST data sets.

## Row bind train and test data frames to create the final merged data frame, merged_data.
merged_data <- rbind(train, test)

# Note that this data frame, merged_data, is in a wide form.
###-------------------------------------------------------------------------------------------------------------------------

### Step-2: Extract only those columns (from merged_data data frame) that contain variables measuring mean and standard deviation for each measurement.

# Create a character vector, vars, which can used to select specific variables from the data frame, merged_data. 
vars <- c("subject", "activity")

# load library dplyr
library(dplyr)  

# Select the subject and activity variables, and those variables measuring mean and standard deviation for each measurement in merged_data, and create a subset data.
subset_m <- select(merged_data, one_of(vars), contains("mean"), contains("std")) 

###-------------------------------------------------------------------------------------------------------------------------

### Step-3: Use descriptive activity names to name the activities in the data set

# The activity labels are provided in the activity_labels.txt file. Create a vector containing the names of the activities and assign appropriate labels (1,2,3,4,5,6) to these names.

act <- c("walking"=1, "walkingupstairs"=2, "walkingdownstairs"=3, "sitting"=4, "standing"=5, "laying"=6)

# change activity labels (in the acitivity column of subset_m data frame) to activity names by using names() and match() functions.
subset_m$activity <- names(act)[match(subset_m$activity, act)]

###------------------------------------------------------------------------------------------------------------------------
### Step-4: Add appropriate labels for the variable names

## "magrittr" package provides pipe-like operator (%>%) similar to "dplyr" package to pipe a value forward into and expression/function call.
# load magrittr package
library(magrittr)

# Create a small function to rename the variables.
rename_all <- function(df, fun){ setNames(df, fun(names(df)))}
  
## Three changes can be performed to rename the variables in the "subset_m" data frame: 1. change letters to lowercase (using tolower() function); 2. remove the dots(.) (by using gsub); 
## 3. to make more explicit variable names, replace the variable names starting with "t" and "f" with "time" and "freq", respectively.

# Use %>% operator from magrittr package to perform several "renaming of variables" operations at once.
laveled <- subset_m %>% rename_all(. %>% tolower %>% gsub("\\.", "", .) %>% gsub("^t", "time", .) %>% gsub("^f", "freq", .))


# To create the final tidy data set, rows are ordered by the 1st fixed variable (subject), breaking ties with the 2nd fixed variable (activity) in the "labeled" data frame.
tidy_data <- arrange(laveled, subject, activity)

###-------------------------------------------------------------------------------------------------------------------------
### Step 5: From the data set in Step-4, create a 2nd independent tidy data set with the average of each variable for each activity and each subject.

# use %>% operator along with group_by and summarise_all to obtain the mean of each variable for each activity and each subject.
tidy_data_2 <- tidy_data %>% group_by(subject, activity) %>% summarise_all(mean)

# Note that this data frame, tidy_data_2, is in a wide form.

# Finally, save the data in a.txt file format
write.table(tidy_data_2,"tidy_data.txt", row.names=FALSE)
