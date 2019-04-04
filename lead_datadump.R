library(tesseract)
library(data.table)
library(dplyr)

file <- list.files("C:/Users/gsand/OneDrive/Desktop/Lead/Lead_data/Pictures/")
file <- "1994.png"
for (i in 1:length(file)){
  pic <- ocr(c(paste("C:/Users/gsand/OneDrive/Desktop/Lead/Lead_data/Pictures/",file[i],sep="")))
  pic <- strsplit(unlist(pic), "[\n]+")
  z<-pic[[1]]
  y1<-0
  for (a in 1:as.numeric(length(z))) {
    y1[a]<-strsplit(z[a], "-")
  }
  x1 <- cbind(0,0)
  x1 <- data.frame(x1)
  colnames(x1) <- c("state","total")
  for (b in 1:as.numeric(length(y1))) {
    x1[b,1] <-y1[[b]][1]
    x1[b,2] <-tail(y1[[b]], n=1)
  }
  x1$state <- gsub("\\W\ ","",x1$state) %>% gsub("\\d","",.) %>% gsub("' ","",.) %>% gsub("[._]","",.)
  x1$total <- gsub("\\D+","", x1$total)
  x1 <- na.omit(x1)
  write.csv(x1,c(paste("C:/Users/gsand/OneDrive/Desktop/Lead/Lead_data/Consumption/",strsplit(file[i],split = "[.]")[[1]][1],".csv",sep="")))
}
strsplit(file[1],split = "[.]")[[1]][1]
