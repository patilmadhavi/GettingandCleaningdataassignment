setwd("C://Users//madhavi.patil//Documents//coursera//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset/")

#reading activity and features list
activity<-read.table("activity_labels.txt",sep = "",col.names =c("Activity","ActivityDesc"))
features<-read.table("features.txt")

#Changing variable names
features_names<-features[,2]
f_vector<- as.vector(features_names)
featurenames<-gsub("[\\(\\)]","",f_vector)
featurenames<-gsub("-",".",featurenames)
featurenames<-gsub(",",".",featurenames)
featurenames<-gsub("fbodybody","fbody",featurenames)
featurenames<-tolower(featurenames)

#reading training data
subject_train<-read.table("subject_train.txt",sep = "", col.names = "subject_code")
x_train<-read.table("X_train.txt" ,sep = "")
y_train<-read.table("y_train.txt",sep = "", col.names = "activity")
xtg<-cbind(y_train,subject_train,x_train)
names(xtg)<-c("Activity","Performer",featurenames)

#reading test data
subject_test<-read.table("subject_test.txt",sep = "", col.names = "subject_code")
x_test<-read.table("X_test.txt" ,sep = "")
y_test<-read.table("y_test.txt",sep = "", col.names = "activity")
xtr<-cbind(y_test,subject_test,x_test)
names(xtr)<-c("Activity","Performer",featurenames)

#combined test and training data
combineddata<-rbind(xtg,xtr)

#selecting only the mean and std columns
newdata<-combineddata[,grepl("Activity|Performer|[\\(.)]mean|std", colnames(combineddata))]


library(dplyr)
newdata<-as.data.frame(newdata)
#removed mean frequency column selected because of grepl of mean
newdata2<-select(newdata,-contains("meanfreq"))

#Join activity table to get the activity description
finaldata <-inner_join(newdata2,activity,by ="Activity")

#Group by and summary to the new file.
finaldata<-select(finaldata,-Activity)
by_activitysubject<-group_by(finaldata,ActivityDesc,Performer)
finaldataset<-summarise_each(by_activitysubject,funs(mean))
write.table(finaldataset,"summary.txt",row.names = FALSE)




