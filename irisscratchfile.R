
#set filename to iris data set
filename<- file.choose()
#loading csv from local library
dataset<- read.csv(filename, header= FALSE)
#settingg column names into data set
colnames(dataset)<- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width", "Species")
#80% of the rows in the dataset to be used for training
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
#20% of the data for validation
validation <- dataset[-validation_index,]
#replacing the dataset variable for readability 
dataset <- dataset[validation_index,]

#looking at the data set
#dimensions of dataset
dim(dataset)
#next line fixes Species column type to aid in data visualization
dataset$"Species"<-as.factor(dataset$"Species")
#types for each attribute
sapply(dataset, class)
#peeking at the first 5 rows of data
head(dataset)
#listing all the levels of the class (corrected by fixing of Species column)
levels(dataset$Species)
#summury of class distribution
percentage<-prop.table(table(dataset$Species))*100
cbind(freq=table(dataset$Species), percentage= percentage)
#summary of attribute distributions
summary(dataset)
#splitting input and output
x<-dataset[,1:4]
y<-dataset[,5]
#boxplot for attributes
par(mfrow=c(1,4))
for(i in 1:4){boxplot(x[,i], main=names(iris)[i])}
#barplot for species breakdown
plot(y)
#scatterplot matrix
featurePlot(x=x, y=y, plot = "box")