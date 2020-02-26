# arxika kanoume pca gia oles tis metrikes, gia 6 PCs . Prokyptei pio megalo contribution sto PC1 apo to LLOC
#opote me vasi autou ginetai o diaxwrismos tou dataset se low, medium ,high size (lines of code). 
# epeita kanoume pca gia kathe ena apo ta clusters megethous  kai vriskoume tis 5 metrikes pou sinisferoun pio poli sta 5  prwta PCs 

#small_size PC1=MIMS, PC2=CD, PC3=CLLC, PC4=NL+NLE , PC5=TLOC
#medium_size PC1=MI, PC2=CLC, PC3=CD, PC4=NL+NLE , PC5=HDIF
#large_size PC1=HVOL, PC2=CLC, PC3=CD, PC4=NL+NLE , PC5=TLOC

a=total_metrics[,11:47]
#a=small_size[,11:47]
#a=medium_size[,11:47]
#a=large_size[,11:47]

#dokimi gia NA=median kai pca
#den volevei, uparxei polwsi pros median times, kai me na.omit vgainoun metrikes apo oles tis katigories pou epireazoun to readability
#for(i in 1:ncol(a)){
 
#    a[is.na(a[,i]),i] =median(a[,i], na.rm=TRUE)
  
  
#}

#diadikasia PCA kai gia NA.omit kai gia NA=median 
a=na.omit(a)
pca_model <- prcomp(a, center = TRUE, scale = TRUE)
eigenvalues = pca_model$sdev^2
barplot(pca_model$sdev ^ 2 / sum(pca_model$sdev ^ 2))
info_loss=sum(eigenvalues[7:37])/sum(eigenvalues)

model=get_pca(pca_model, "var")
contributions=model$contrib[,1:6]

names_important_metrics=c()
important_metrics=c()

for(i in 1:6){
  cat("PC",i,"\n")
  for(j in 1:5){
    cat(names(contributions[,i])[which.max(contributions[,i])],"\n")
    names_important_metrics=c(names_important_metrics,names(contributions[,i])[which.max(contributions[,i])])
    important_metrics=c(important_metrics,contributions[which.max(contributions[,i]),i])
    contributions[which.max(contributions[,i]),i]=0
    
  }
}

d=dist(contributions)
hc=hclust(d,method='complete')
plot(hc)
clusters=cutree(hc,k=5)
rect.hclust(hc,k=5)




