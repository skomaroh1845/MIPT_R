#1
nrow(USArrests)
ncol(USArrests)
dim(USArrests)

#2
head(USArrests)
tail(USArrests)

#3
colnames(USArrests)
USArrests[16:20, "UrbanPop"]

#4
mode(USArrests)
class(USArrests)
typeof(USArrests)

for (i in 1:ncol(USArrests)) {
  print(colnames(USArrests)[i])
  print(mode(USArrests[, i]))
  print(class(USArrests[, i]))
  print(typeof(USArrests[, i]))
  cat('\n')
}

#5
colnames(USArrests)
rownames(USArrests)
dimnames(USArrests)

#6
sum(USArrests)
mean(as.matrix(USArrests), na.rm = TRUE)
sd(as.matrix(USArrests))
var(as.matrix(USArrests))

#7
colSums(USArrests)
colMeans(USArrests)
sapply(USArrests, sd)
sapply(USArrests, var)

#8
rowSums(USArrests)
rowMeans(USArrests)

library(matrixStats)

print(data.frame(rowSds(as.matrix(USArrests)), 
                 row.names = rownames(USArrests)))
print(data.frame(rowVars(as.matrix(USArrests)), 
                 row.names = rownames(USArrests)))

#9
for (i in colnames(USArrests)) {
  print(USArrests[10:14, i])
}

#10
sum(USArrests < 10)

#11
apply(USArrests < 10, 2, sum)

#12
which(grepl("Miss",rownames(USArrests)))

#13
USArrests[grepl("New",rownames(USArrests)), ]

#14
write.csv(USArrests[1:20, c(1, 3)], "ex14.csv")

#15
library(openxlsx)
m_stats <- summary(USArrests[grepl("^M",rownames(USArrests)), ])
n_stats <- summary(USArrests[grepl("^N",rownames(USArrests)), ])
write.xlsx(list('M' = m_stats, 'N' = n_stats), "ex15.xlsx")

#16
csv_file <- read.csv("ex14.csv")
xlsx_file_M <- read.xlsx("ex15.xlsx", sheet = "M")
xlsx_file_N <- read.xlsx("ex15.xlsx", sheet = "N")
