library(AnnotationHub)
ah <- AnnotationHub()
unique(ah$species)
unique(ah$dataprovider)
unique(ah$rdataclass)
ah[ah$rdataclass == "OrgDb"]
subset(ah, ah$rdataclass == "OrgDb")

Asparagus <- query(ah,'Asparagus')
Aspdownload <- ah[['AH72352']]
columns(Aspdownload)
keytypes(Aspdownload)

head(keys(Aspdownload,keytype = "ALIAS"))

keys(Aspdownload,keytype = "GENENAME", pattern= "WRKY") -> wrky
keys(Aspdownload,keytype = "GENENAME", pattern= "MYB") -> myb
keys(Aspdownload,keytype = "GENENAME", pattern= "PHY") -> phy
c(myb,phy,wrky) -> selectedgene


select(Aspdownload, keys= selectedgene, columns=c("ENTREZID","GID"),keytype = "GENENAME") -> df