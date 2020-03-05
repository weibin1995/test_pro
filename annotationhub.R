#安装AnnotationHub：
  source("https://bioconductor.org/biocLite.R")
  biocLite("AnnotationHub")
#上述方法安装不上可以尝试BiocManager安装：
if (!requireNamespace("BiocManager"))
  install.packages("BiocManager")
BiocManager::install("AnnotationHub")
#载入AnnotationHub：
library(AnnotationHub)
#建立AnnotationHub对象:
ah <- AnnotationHub()
#查看AnonotationHub里面包括那些物种：
unique(ah$species)
#查看目的物种（如水稻”Oryza sativa“）:
ah$species[which(ah$species=="Oryza sativa")]
#查看来源数据库:
unique(ah$dataprovider)
#AnnotationHub的注释信息的数据存放格式:
unique(ah$rdataclass)
#查看特定格式数据：
ah[ah$rdataclass == "OrgDb"]
subset(ah, ah$rdataclass == "OrgDb")
#使用qury函数查看水稻信息(AH66307)：
oryza <- query(ah,"Oryza sativa")
#下载注释数据:
oryzadownload <- ah[['AH66307']]
#查看数据包含哪些列:
columns(oryzadownload)
#查看oryza可以当做关键字(key)进行查找的列:
keytypes(oryzadownload)
#"ACCNUM" "ALIAS" "ENTREZID" "EVIDENCE" "EVIDENCEALL" "GENENAME" "GID" "GO" "GOALL" "ONTOLOGY" "ONTOLOGYALL" "PMID" "REFSEQ" "SYMBOL"     
head(keys(oryzadownload,keytype = "ALIAS"))
#利用关键字"GENENAME"查看所有基因名,筛选出myb,phy,wrky三个基因(不止这些，小写字母也可检索出更多结果)：
#wrky
keys(oryzadownload,keytype = "GENENAME", pattern= "WRKY") -> wrky
#myb
keys(oryzadownload,keytype = "GENENAME", pattern= "MYB") -> myb
#phy
keys(oryzadownload,keytype = "GENENAME", pattern= "PHY") -> phy
#合并
c(myb,phy,wrky) -> selectedgene
#根据你提供的key值去查找注释数据库，返回你需要的columns信息:
select(oryzadownload, keys= selectedgene, columns=c("ENTREZID","PMID"),keytype = "GENENAME") -> df
#存为数据框，方便存储
as.data.frame(df)
save(df,file = "df.txt")
