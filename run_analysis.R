features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("featno", "featname")
activlab <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activlab) <- c("activno", "activity")
Ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
names(Ytrain) <- c("activno")
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
subjtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subjtrain) <- c("subject")
names(Xtrain) <- features$featname

Ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
names(Ytest) <- c("activno")
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
subjtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subjtest) <- c("subject")
names(Xtest) <- features$featname

df1 <- cbind(subjtrain,Ytrain,Xtrain)
df2 <- cbind(subjtest,Ytest,Xtest)
df3 <- rbind(df1,df2)


xx <- grep("[Mm]ean|[Ss][Tt][Dd]", names(df3), value = TRUE)
zz <- c("subject", "activno",xx)

df3 <- df3[ , which(names(df3) %in% zz)]
kk <- gsub("-", ".", colnames(df3))
kk <- gsub("\\(", "", kk)
kk <- gsub("\\)", "", kk)
kk <- gsub("\\,", ".", kk)
names(df3) <- kk


df3 <- merge(df3,activlab, "activno", sort=FALSE)
df3$activno <- NULL


library(data.table)
df3 = data.table(df3)
dt <- df3[,lapply(.SD,mean),by=c("subject","activity")]

write.table(dt,"./FinalDataSet.txt",row.name=FALSE)
