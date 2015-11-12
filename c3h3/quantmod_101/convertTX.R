library(quantmod)
library(stringr)
tx <- read.csv("data/tx.txt", stringsAsFactors=FALSE)[,-1]

tx$Time = sapply(as.character(tx$Time), function(xx){
  ifelse(str_length(xx) >3, xx, sprintf("0%s",xx))
})

tx$Date = as.character(tx$Date)
tx$Time = strptime(paste0(tx$Date,tx$Time),"%Y%m%d%H%M",tz = "CST")
tx = tx[,-1]

Xt = xts(as.matrix(tx[,-1]),tx[,1])
View(Xt)

colnames(Xt)
chartSeries(Xt)

index(Xt)
