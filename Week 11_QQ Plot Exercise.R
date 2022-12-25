### Normal QQPlot
x <- rnorm(1000, 50, 10)
#rnorm()
qqnorm(x)
qqline(x, col = "red")


### Non-normal QQPlot (Exponential)
#right skewed
x <- rexp(1000, 5)
qqnorm(x)
qqline(x, col = "red")

## Study Case 

#Load the packages
library(MASS)
library(ggplot2)

#Take a peak into the data frame
head(MASS::birthwt)

bwt <- birthwt$bwt

hist(bwt,
     main = "Baby's Birth Weight Histogram", 
     xlab = "Birth Weight (in grams)")


#Create basic qqnorm
qqnorm(bwt)


#Create basic qqnorm with y-axis title and qqline
qqnorm(bwt, 
       ylab = "Birth Weight (in grams)")
qqline(bwt, col="Red")


#Create basic qqnorm with dark green color and red line
qqnorm(bwt, 
       ylab = "Birth Weight (in grams)", 
       col="dark green")
qqline(bwt, col="red")


### Using ggplot2 package
#Create basic qqplot using ggplot2 package
ggplot(data=birthwt,aes(sample = bwt)) + 
  geom_qq()


#Create qqplot using ggplot2 package with line and y-axis title
ggplot(data=birthwt,aes(sample=bwt)) + 
  geom_qq( ) +
  geom_qq_line( ) +
  labs(y = "Birth Weight (in grams)") 


#Create qqplot using ggplot2 package with dark blue color and orange line and y-axis title = "Birth Weight (in grams)"
ggplot(data=birthwt,aes(sample=bwt)) + 
  geom_qq(col="dark green") +
  geom_qq_line(col="red") +
  labs( y = "Birth Weight (in grams)")+
  ggtitle("Normal Q-Q Plot for Birth Weights")+
  theme_minimal()
  
