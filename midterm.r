library(mice)

fullData <- complete(mice_imputes)

place <- fullData[4]
crimes <- fullData[-4]
crimes <- subset(crimes, select=-c(PolicPerPop))

#pca = princomp(crimes, cor = T)
#summary(pca, loadings = T)

library(CCA)
policeData = crimes[, 101:126] %>% select(-LandArea, -PopDens, -PctUsePubTrans)
restData = crimes[, 1:100]
restData = cbind(restData, crimes %>% select(LandArea, PopDens, PctUsePubTrans))


#exploring the data
cc1 <- CCA::cc(policeData, restData)
cc2 <- CCA::comput(policeData, restData, cc1)
