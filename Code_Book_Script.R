#Script to create rmd and html file for the CodeBook.
#The rmd and html file will have the same name as the variable assigned to the dataframe.
#If you receive an error creating the codebook, then rename the variable or delete the rmd and html file.
#install.packages("dataMaid")
library(dataMaid)
Human_Resource = read.csv("Source/CaseStudy2-data.csv", header = TRUE)
makeCodebook(Human_Resource)

