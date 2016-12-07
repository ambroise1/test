library(dplyr)
library(ggplot2)
#aa

#need hard drive attached

#windows path
setwd("F:\\TexData")

setwd("/Volumes/MyPassportW/TexData")
intData <- read.csv("inttexdata--survival--12-6-16.csv")
intData <- tbl_df(intData)
intData$patientid <- as.factor(intData$patientid)
intData$mets <- as.factor(intData$mets)
intData$dob <- as.Date(intData$dob, "%m/%d/%Y")
intData$dod <- as.Date(intData$dod, "%m/%d/%Y")
intData$pathdate <- as.Date(intData$pathdate, "%m/%d/%Y")
intData$ssf <- as.factor(intData$ssf)

tbl_i <- select(intData, patientid, mets, dob, dod, pathdate, sigma, TX_sigma,
                ssf, mean, sd, entropy, mpp, skewness, kurtosis)

pdf("int-boxplots--12-6-16.pdf")

ggplot(tbl_i, aes(mets, mean)) +
  facet_wrap (~ssf, scales = "free_y")+
  geom_boxplot()

ggplot(tbl_i, aes(mets, sd)) +
  facet_wrap (~ssf)+
  geom_boxplot()

ggplot(tbl_i, aes(mets, entropy)) +
  facet_wrap (~ssf)+
  geom_boxplot()

ggplot(tbl_i, aes(mets, mpp)) +
  facet_wrap (~ssf, scales = "free_y")+
  geom_boxplot()

ggplot(tbl_i, aes(mets, skewness)) +
  facet_wrap (~ssf)+
  geom_boxplot()

ggplot(tbl_i, aes(mets, kurtosis)) +
  facet_wrap (~ssf)+
  geom_boxplot()

dev.off()


#data don't appear normally distributed
#so, next we want to do kruskal wallis tests between the two groups across the SSF categories
