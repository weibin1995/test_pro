# 《组学与数据分析》第4次作业 
# 阅读文献“Reconstructing lineage hierarchies of the distal lung epithelium using single-cell RNA- seq”。作业附件中 txt 文件是 E18.5 的 80 个单细胞的表达数据（文献的 Supplementary Data 3）。请 结合文献并参考《统计学习导论-基于 R 应用》，按要求回答问题。
# 1.  仿照文献 Fig. 1b，使用 PCA 降维可视化，并对结果反映的生物现象进行解释说明。
BiocManager::install("scater")
browseVignettes("scater")
library("scater")
data<-read.table("exp_E18.5.txt",header=T,row.names=1)
sc_example_counts <- data[,-1:-4]
rownames(sc_example_counts) = data$cell_name
t(sc_example_counts) -> sc_example_counts
sc_example_counts
sc_example_cell_info <- data[,1:4]
rownames(sc_example_cell_info) = data$cell_name
sc_example_cell_info
  
sce <- SingleCellExperiment(
  assays = list(counts = sc_example_counts),
  colData = sc_example_cell_info
)
sce <- normalize(sce)
plotPCA(sce)
# 2.  仿照文献 Fig. 2a，画出 marker genes 的表达热图，并对结果反映的生物现象进行解释说明。
scale(sc_example_counts) -> mapdata
pheatmap::pheatmap(mapdata,color = colorRampPalette(c("navy", "white", "firebrick3"))(50))

# 提示：
# （1） 可参考文献补充材料中相关单细胞 RNA-seq 分析的 R 脚本
# （2） 作图需准确反映数据信息，且整洁美观；
# 
# 
# 要求：
# （1） 将分析结果、作图、必要的文字解释和标注汇总成文档，将该文档和分析所使用的 R 代码文 件（homework_3.R）打包成 zip 格式压缩包，发送至邮箱 mao2010zichao@126.com，文档 名称、压缩包名称和邮件主题均统一为“学号+姓名+作业 3”，如：1601110101+张三+作业 3；
# （2） 作业提交截止时间为 2019 年 7 月10日（星期三）22:00；
# （3） 鼓励互相交流学习，但严禁照搬他人等抄袭行为；
# （4） 本作业占课程总成绩 25%。