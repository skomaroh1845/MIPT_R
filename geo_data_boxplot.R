library(ggpubr)
library(dplyr)
library(DESeq2)

# Load data 
expr_mtrx <- read.csv("Expr_data.csv")

# Preprocessing data
rownames(expr_mtrx) <- expr_mtrx[, 1]
expr_mtrx <- expr_mtrx[, -1]
countData <- expr_mtrx
colnames(countData) <- gsub("_S[0-9]+_.*", "", colnames(countData))
colnames(countData) <- gsub("\\.", "", colnames(countData))
colnames(countData) <- gsub("_", "", colnames(countData))
colData <- data.frame(colnames(countData), "")
colnames(colData) <- c("ID", "condition")
colData$condition <- gsub("RAIR[0-9]+", "radio_resistance", colData$ID) 
colData$condition <- gsub("TC[0-9]+", "radio_sensitivity", colData$condition)

# Normalization
dds <- DESeqDataSetFromMatrix(countData, colData, design=~condition)
dds <- estimateSizeFactors(dds)
normalized_counts <- counts(dds, normalized=TRUE)
data <- data.frame(colnames(expr_mtrx), normalized_counts["TERT", ])

# Organization by condition
colnames(data) <- c("ID", "norm_counts")
colData$ID <- colnames(expr_mtrx)
data <- left_join(data, colData, by="ID")
data$condition <- gsub("radio_sensitivity", "other", data$condition)

# Logarithmation of counts 
data$norm_counts <- log(data$norm_counts + 1)
colnames(data)[2] <- "log_counts"

# Create a chart
p <- ggboxplot(data, x = "condition", y = "log_counts",
               color = "condition", palette = "jco",
               add = "jitter", title = "Expression comparison of TERC",
               legend = "none") +
  theme(plot.title = element_text(hjust = 0.5))
p + stat_compare_means(label.x = 1.65)

