

#epilegoume k=4 giati exei megalitero silhouette kai oxi 5 gia poliplokotita


#2 clusters mean_sil=0.68
#3 clusters mean_sil=0.7
#4 clusters mean_sil=0.88
#5 clusters mean_sil=0.92


NL_ALL=medium_size$NLE+medium_size$NL
a=NL_ALL

a=na.omit(a)

b=data.frame(a,0)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

b = b[sample(nrow(b),10000),]
#10000 gia na mi xalaei i katanomi

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

source('1d_optimal_silhouette.R')
model=Ckmeans.1d.dp(b$a, k=4, y=1, method=c("linear"), estimate.k=c("BIC"))

NLALL_LOW=b[which(model$cluster==1),1]
NLALL_MED=b[which(model$cluster==2),1]
NLALL_HIGH=b[which(model$cluster==3),1]


plot(model)


