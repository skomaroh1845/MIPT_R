dataset_stats <- function(dataset) {
  
  print("#1")
  print(nrow(dataset))
  print(ncol(dataset))
  print(dim(dataset))
  cat("\n")
  
  print("#2")
  print(head(dataset))
  print(tail(dataset))
  cat("\n")
  
  print("#3")
  print(dataset[16:20, 3])
  cat("\n")
  
  print("#4")
  print(mode(dataset))
  print(class(dataset))
  print(typeof(dataset))
  cat("\n")
  
  numeric_cols <- c()
  for (i in 1:ncol(dataset)) {
    print(colnames(dataset)[i])
    print(mode(dataset[, i]))
    print(class(dataset[, i]))
    print(typeof(dataset[, i]))
    if (is.numeric(dataset[1, i])) {
      numeric_cols <- append(numeric_cols, i)
    }
    cat('\n')
  }
  
  df <- dataset[, numeric_cols]
  
  print("#5")
  print(colnames(dataset))
  print(rownames(dataset))
  cat("\n")
  
  print("#6")
  print(sum(df))
  print(mean(as.matrix(df)))
  print(sd(as.matrix(df)))
  print(var(as.matrix(df)))
  cat("\n")
  
  print("#7")
  print(colSums(df))
  print(colMeans(df))
  print(sapply(df, sd))
  print(sapply(df, var))
  cat("\n")
  
  print("#8")
  print(rowSums(df))
  print(rowMeans(df))
  
  print(data.frame(matrixStats::rowSds(as.matrix(df)), 
                   row.names = rownames(df)))
  print(data.frame(matrixStats::rowVars(as.matrix(df)), 
                   row.names = rownames(df)))
  cat("\n")
  
  print("#9")
  for (i in colnames(dataset)) {
    print(dataset[10:14, i])
  }
  cat("\n")
  
  print("#10")
  print(sum(df < 10))
  cat("\n")
  
  print("#11")
  print(apply(df < 10, 2, sum))
  cat("\n")
  
  print("#14")
  write.csv(dataset[1:20, c(1, 3)], "extra_task.csv")
  print("csv file has been created")
}


dataset_stats(USArrests)
dataset_stats(mtcars)
dataset_stats(iris)
