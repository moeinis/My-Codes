###### Installing "neuralnet" & "PerformanceAnalytics" Packages 
# install.packages("neuralnet")
library(neuralnet)
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")

##### Importing dataset & Data slicing and EDA
set.seed(500)
dataset = read.csv(file = "Abol_V5.CSV")
dataset = dataset[1:90, 2:7]
pairs(dataset)
chart.Correlation(dataset, histogram=TRUE, pch=19)



###### Scaling data for the NN
maxs <- apply(dataset, 2, max) 
mins <- apply(dataset, 2, min)
scaled <- as.data.frame(scale(dataset, center = mins, scale = maxs - mins))
sum(is.na(scaled))


###########################
# k-fold Cross Validation #
###########################
# 5-fold CV
set.seed(1022)
kfolds <- 5
folds <- rep_len(1:kfolds, 1000)
folds <- sample(folds, 1000)

ANN.MSE.fold <- rep(0, kfolds)

for(k in 1:kfolds){
  fold <- which(folds == 1)
  
###### Train-test split(test_&train_ are dataset (with response var))
  train_ <- scaled[-fold,]
  test_ <- na.omit(scaled[fold,])
  
  
######## Model building
  n <- names(train_)
  f <- as.formula(paste("ActualPressure ~", paste(n[!n %in% "ActualPressure"], collapse = " + ")))
  nn <- neuralnet(f,data=train_,hidden=c(9,6),linear.output=T)
  plot(nn)
  # Predict(pr)"$net.result" variable contains scaled predicted results for dependent variable in test dataset
  pr.nn <- compute(nn,test_[,1:5])
  
  
  # Results from NN are normalized ("$net.result" is scaled)
  # Descaling for comparison, "pr.nn_" is reall predicted results for dependent var +  "test.r" is reall test dependent var 
  pr.nn_ <- pr.nn$net.result*(max(dataset$ActualPressure)-min(dataset$ActualPressure))+min(dataset$ActualPressure)
  test.r <- (test_$ActualPressure)*(max(dataset$ActualPressure)-min(dataset$ActualPressure))+min(dataset$ActualPressure)
  
####### Model evaluation-  Calculating MSE
  MSE.nn <- sum((test.r - pr.nn_)^2)/nrow(test_)
  MSE.nn
  ANN.MSE.fold[k] <- sum((test.r - pr.nn_)^2)/nrow(test_)
  ANN.MSE.fold
}
Observed.test=test.r
Predicted.ANN=pr.nn_
test.error.fold <- mean(ANN.MSE.fold)
test.error.fold

######## Visualization
plot(Observed.test,Predicted.ANN,col='red',main='Observed Pressure vs Predicted on Test data 1/5',pch=18,cex=0.7)
abline(0,1,lwd=2)
legend('bottomright',legend='NN',pch=18,col='red', bty='n')

gwplot(nn, rep = "best", max = NULL, min = NULL, file = NULL,
       selected.covariate = 1, selected.response = 1, highlight = FALSE,
       type = "p", col = "black")
