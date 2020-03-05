update.packages()
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

BiocManager::install(c("edgeR","DESeq2","tximport","rnaseqDTU","annotation","DRIMSeq","stageR","limma","SGSeq","IsoformSwitchAnalyzeR","SGSeq","DEXSeq"),dependencies=T)

getwd()
dir<- "C:/Users/Administrator/Documents/R/quant/"

sample <- dir("C:/Users/Administrator/Documents/R/quant")
files <- file.path(dir,sample,"quant.sf")

names(files) <- sample

head(files)
all(file.exists(files))

library(tximport)
txi <- tximport(files, type="salmon", txOut=TRUE,countsFromAbundance="scaledTPM")
d_test <- txi$counts
d_test <- d_test[rowSums(d_test) > 0,]

pheatmap::pheatmap(scale(d_test[1:200,1:8]))
