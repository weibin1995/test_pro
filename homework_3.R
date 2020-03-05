# 1. 使用 read.csv ()函数将cancer_risk.csv读进 R， 载入数据命名为 cancer.risk
cancer.risk <- read.csv("cancer_risk.csv", header = FALSE)
# 2. 使用 fix () 函数观察数据，并使用 colnames () 函数将数据的 7 个变量分别命名为“Cancer type”、 “Lifetime risk”、“No. of normal cells”、“No. of stem cells”、“Divisions of each stem cell per year”、 “Divisions of each stem cell per lifetime”、“Total stem cell divisions”。
fix(cancer.risk)
cancer.risk <- cancer.risk[-1,]
colnames(cancer.risk) = c("Cancer type","Lifetime risk","No. of normal cells","No. of stem cells","Divisions of each stem cell per year","Divisions of each stem cell per lifetime","Total stem cell divisions")
fix(cancer.risk)
# 3. 使用 log10 () 函数将 Lifetime risk 和 Total stem cell divisions 取对数后，用 boxplot () 函数画出 它们的分布图。
as.numeric(as.character(cancer.risk$`Lifetime risk`)) -> Lifetime_risk
as.numeric(as.character(cancer.risk$`Total stem cell divisions`)) -> Total_stem_cell_divisions
cbind(Lifetime_risk,Total_stem_cell_divisions) -> combine
log10(combine) -> lc
rownames(lc) = cancer.risk$`Cancer type`
boxplot (lc)
# 4. 使用 log10 () 函数将 Lifetime risk 取对数后，分别求出它们的中位数和均值，结合中位数与均值的大小关系分析数据分分布特征。
median(log10(Lifetime_risk))
mean(log10(Lifetime_risk)) #平均数与中位数分别为-2.440313,-2.387216,两者相差不大表,数据分布均匀
# 5.  参考文章的 Fig.1，使用 log10 () 函数将 Lifetime risk 和 Total stem cell divisions 取对数后，用plot ()  函数画出散点图，并以相应的变量名称作为散点图的坐标轴标签（Lifetime risk 作为纵轴）。
as.data.frame(lc) -> lc
plot(lc$Total_stem_cell_divisions, lc$Lifetime_risk) + text(lc$Total_stem_cell_divisions, lc$Lifetime_risk, rownames(lc), cex = 0.7)
# 6. 假设 5 中的横纵坐标存在线性关系，使用 lm () 函数估计出回归模型（给出线性回归模型的斜率 和截距），并将回归线添加到 5 中的散点图上。
lm(lc) -> lm
abline(a = -7.6108, b = 0.5326)
# 7. summary () 函数查看回归模型的假设检验结果，回答响应变量与预测变量之间是否存在关系并说明理由。
summary(lm)#p值在0～0.001之间是非常非常显著，通常用‘***’号表示；在0.001～0.01之间是非常显著，通常用‘**’号表示；在0.01～0.05之间是比较显著，通常用‘**’号表示；在0.05～0.1之间是显著，通常用‘.’号表示；在0.1～1之间是不显著。返回结果为***，表现为极显著,
# 8. summary () 函数查看回归模型的假设检验结果，回答响应变量的差异能被预测变量解释的部分所占的比例是多少，结合文章分析其生物学意义。
不会做
# 要求：
# (1) 将分析结果、作图、必要的文字解释和标注汇总成文档，将该文档和分析所使用的 R 代码文 件（homework_1.R）发送至邮箱 mao2010zichao@126.com，文档名称和邮件主题均统一为 “学号+姓名+作业 1”，如：1601110101+张三+作业3；
# (2)  作业提交截止时间为 2019年 7 月 10日（星期三） 22:00；
# (3)  鼓励互相交流学习，但严禁照搬他人等抄袭行为；
# (4)   本作业占课程总成绩 25%。