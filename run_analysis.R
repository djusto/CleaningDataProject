# run_analysis.R
#
# The Samsung data should be in the working directory. The files are
#  X_test.txt,  Y_test.txt,  subject_test.txt,
#  X_train.txt, Y_train.txt, subject_train.txt,
#  features.txt, activity_labels.txt  
#  
#-------------------------------------------------------------------
#1 Merges the training and the test sets to create one data set.
#-------------------------------------------------------------------
Xtest  <- read.table('X_test.txt')    # data set
Xtrain <- read.table('X_train.txt')   # data set
X      <- rbind( Xtest,Xtrain)

#-------------------------------------------------------------------
#2 Extracts only the measurements on the mean and
#  standard deviation for each measurement. 
#-------------------------------------------------------------------

features <- read.table("features.txt",sep=" ")

has_mean <- grep("mean\\(\\)",features[,2])  # () needs escape twice
has_std  <- grep("std\\(\\)",features[,2])

X        <- X[,cbind(has_mean,has_std)]      # extracts

colnames(X)<- features[cbind(has_mean,has_std),2]

#-------------------------------------------------------------------
#3 Uses descriptive activity names to name the activities in the data set
#-------------------------------------------------------------------

subject1  <- read.table('subject_test.txt')      
subject2  <- read.table('subject_train.txt')  
subject   <- rbind( subject1, subject2 )
subject   <- as.numeric( subject$V1 )           # only a vector 

Ytest    <- read.table('Y_test.txt')       # activities in test
Ytrain   <- read.table('Y_train.txt')     #  and trains
Y        <- rbind( Ytest, Ytrain )
labels   <- read.table("activity_labels.txt")   # descriptive names
 
activity <- as.character( labels$V2[ Y$V1 ] )   # label names

#-------------------------------------------------------------------
#4 Appropriately labels the data set with descriptive variable names. 
#-------------------------------------------------------------------
df <- cbind(subject,activity,X) 
head( df )

#-------------------------------------------------------------------
#5 From the data set in step 4, creates a second,
#  independent tidy data set with the average of each variable
#  for each activity and each subject.
#-------------------------------------------------------------------

dfMelt <- melt( df, id=c("subject","activity") )

dc <- dcast( dfMelt, subject + activity ~ ... ,mean)

write.table( dc,file="tidydata.txt", row.name=FALSE )


# Example verifying that it is working:
# ii <-df[,1]==2 & df[,2]=="STANDING"  # collects indices for subject 2 STANDING
# mean( df[ii,3]  )                    # computes means
# mean( df[ii,4]  )
# mean( df[ii,5]  )
# dc[9,1:5]                            # matches the answer from dcast 
