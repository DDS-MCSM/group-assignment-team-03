#setwd("Users/Victor/Desktop/Data Driven/group-assignment-team03")
phishing <- read.csv("dataset.csv", header = TRUE)
#names(phishing)

matrixphising <- phishing[, c(1,2,3,4,5,6,7,8,13)]
#names(matrixphising)

#options(max.print = 150000)

#matrixphising
#phishing[0:11056, 2:8]


#write.csv(matrixphising, file = "phising.csv")
