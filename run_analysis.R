# Merging of data sets train and test to one.
xtrain <-read.table("/train/X_train.txt", header = FALSE)
ytrain <-read.table("/train/y_train.txt", header = FALSE)
subjtrain <-read.table("/train/subject_train.txt", header = FALSE)
ytest <-read.table("/train/y_test.txt", header = FALSE)
xtest <-read.table("/test/X_test.txt", header = FALSE)
subjtest <-read.table("/test/subject_test.txt", header = FALSE)
xmerged<- rbind(xtrain,xtest)
ymerged<- rbind(ytrain,ytest)
subjmerged<- rbind(subjtrain,subjtest)

# Extracting Measurements
features <- read.table("features.txt", header = TRUE)

# Mean and Standard Deviation
MeanStd <- grep("std|mean\\(\\)",features$V2)
ExtractedX<- xmerged[,MeanStd]
names(ExtractedX) <-features[MeanStd,2]

# Activities
ActivityName <- read.table("activity_labels.txt",header = TRUE)
ymerged[,1] <- ActivityName[ymerged[,1],2]
names(ymerged) <- "Activity"

names(subjmerged) <- "Subject"

MyData <- cbind(ExtractedX,ymerged,subjmerged)

# Tidying the data

library(dplyr)
SumBy <- group_by(MyData, Activity, Subject)
summarize(SumBy, ave_val = mean(Subject))
MySum <- summarize(SumBy, n_distinct(Activity, ave_val = mean(Subject)))
write.table(MySum, "TidyData.txt")

                   
