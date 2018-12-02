#Sandbox 2

#load packages

library(plyr)
library(tidyr)
library(dplyr)
library(base)
library(ggplot2)
library(gridExtra)
library(mlbench)
library(caret)

d1 = read.csv("Source/CaseStudy2-data.csv", header = TRUE)
str(d1)