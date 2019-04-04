#http://images.library.wisc.edu/EcoNatRes/EFacs2/MineralsYearBk/MinYB1957v1/reference/econatres.minyb1957v1.obishop.pdf
setwd("C:/Users/gsand/OneDrive/Desktop/Lead")
library(XML) # HTML processing
library(pdftools)
rm(list=ls())

i <- 1
url <- 0
for (year in 1984:1993){
  url[i] <- c(paste("http://images.library.wisc.edu/EcoNatRes/EFacs2/MineralsYearBk/MinYB",year,"v1/reference/econatres.minyb",year,"v1.wwoodbury.pdf",sep=""))
  i <- i+1
}

filename <- "C:/Users/gsand/OneDrive/Desktop/Lead/year"
for (i in 1:length(url)){
  download.file(url[i], destfile = c(paste(filename,1983+i,".pdf",sep="")), mode = "wb")
}
download.file(url[1], destfile = c(paste(filename,1933,".pdf",sep="")), mode = "wb")
