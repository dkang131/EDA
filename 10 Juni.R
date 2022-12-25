#H0 = colors are significantly commonly distributed
#H1 = colors arent significantly commonly distributed

tulip <- c(81,50,27)
res <- chisq.test(tulip,p=c(1/3,1/3,1/3))
res
#alpha = 0.05
#if p value < alpha -> reject h0


#ratio = 3:2:1 -> 1/2:1/3:1/6
#H0 = no significant difference between observed and the expected value
#H1=is a significant difference between the observed and the expected value
tulip <- c(81,50,27)
res <- chisq.test(tulip,p=c(1/2,1/3,1/6))
res
#aplha = 0.05
#pvalue = 0.9037
#pvalue > aplha -> fail to reject Ho -> accept H0
#the observed proportions are not significantly different from the expected proportions

install.packages("dgof")
library("dgof")

#generating random variate
#sample 1
x <- rnorm(50)

#generating random deviates
#sample 2
y <- runif(30)

#performing the K-S test
#do x and y come from the same distribution?

ks.test(x,y)