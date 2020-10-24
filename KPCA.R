install.packages("kernlab")
library(kernlab)

## Customer Income Data ##

setwd("C:/Users/Hend Aljobaily/Desktop")

# Data
data(income)
test <- sample(1:8993,1000)

# Gaussian Kernel
kpc <- kpca(~.,data=income[-test,-14],kernel="rbfdot",
            kpar=list(sigma=0.2),features=2) 

# Print PC factors
pcv(kpc)

# Plot (data projection)
plot(rotated(kpc),col=as.integer(income[-test,14]),
     xlab="1st Principal Component",ylab="2nd Principal Component")

# Embed the rest of the data points 
emb <- predict(kpc,income[test,-14])
points(emb,col=as.integer(income[test,14]))