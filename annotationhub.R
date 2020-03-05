#��װAnnotationHub��
  source("https://bioconductor.org/biocLite.R")
  biocLite("AnnotationHub")
#����������װ���Ͽ��Գ���BiocManager��װ��
if (!requireNamespace("BiocManager"))
  install.packages("BiocManager")
BiocManager::install("AnnotationHub")
#����AnnotationHub��
library(AnnotationHub)
#����AnnotationHub����:
ah <- AnnotationHub()
#�鿴AnonotationHub���������Щ���֣�
unique(ah$species)
#�鿴Ŀ�����֣���ˮ����Oryza sativa����:
ah$species[which(ah$species=="Oryza sativa")]
#�鿴��Դ���ݿ�:
unique(ah$dataprovider)
#AnnotationHub��ע����Ϣ�����ݴ�Ÿ�ʽ:
unique(ah$rdataclass)
#�鿴�ض���ʽ���ݣ�
ah[ah$rdataclass == "OrgDb"]
subset(ah, ah$rdataclass == "OrgDb")
#ʹ��qury�����鿴ˮ����Ϣ(AH66307)��
oryza <- query(ah,"Oryza sativa")
#����ע������:
oryzadownload <- ah[['AH66307']]
#�鿴���ݰ�����Щ��:
columns(oryzadownload)
#�鿴oryza���Ե����ؼ���(key)���в��ҵ���:
keytypes(oryzadownload)
#"ACCNUM" "ALIAS" "ENTREZID" "EVIDENCE" "EVIDENCEALL" "GENENAME" "GID" "GO" "GOALL" "ONTOLOGY" "ONTOLOGYALL" "PMID" "REFSEQ" "SYMBOL"     
head(keys(oryzadownload,keytype = "ALIAS"))
#���ùؼ���"GENENAME"�鿴���л�����,ɸѡ��myb,phy,wrky��������(��ֹ��Щ��Сд��ĸҲ�ɼ�����������)��
#wrky
keys(oryzadownload,keytype = "GENENAME", pattern= "WRKY") -> wrky
#myb
keys(oryzadownload,keytype = "GENENAME", pattern= "MYB") -> myb
#phy
keys(oryzadownload,keytype = "GENENAME", pattern= "PHY") -> phy
#�ϲ�
c(myb,phy,wrky) -> selectedgene
#�������ṩ��keyֵȥ����ע�����ݿ⣬��������Ҫ��columns��Ϣ:
select(oryzadownload, keys= selectedgene, columns=c("ENTREZID","PMID"),keytype = "GENENAME") -> df
#��Ϊ���ݿ򣬷���洢
as.data.frame(df)
save(df,file = "df.txt")