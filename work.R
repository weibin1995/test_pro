#为确保安装正确，更新包

update.packages()

#下载最新Biconductor

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install()

#BiocManager安装工具安装:
#Differential transcript usage (DTU)
#Differential gene expression (DGE) 
#Differential transcript expression (DTE)

BiocManager::install(c("edgeR","DESeq2","tximport","rnaseqDTU","annotation","DRIMSeq","stageR","limma","SGSeq","IsoformSwitchAnalyzeR","SGSeq","DEXSeq"))
ah <- AnnotationHub()
query(ah,'Asparagus') #AH72352
dir<- getwd()
files <- file.path(dir,sample,"quant.sf")
names(files) <- sample
head(files)
library(tximport)
txi <- tximport(files, type="salmon", txOut=TRUE,countsFromAbundance="scaledTPM")
cts <- txi$counts
cts <- cts[rowSums(cts) > 0,]
