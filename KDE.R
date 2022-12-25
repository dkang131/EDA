d <- c(101,97,99,104,103,94,102,94,102,106)

kde <- density(x = d, kernel = 'gaussian', bw =1.0, from = 90, to = 110)

plot(kde)

pi
# GaussianKernel
GK <- function(u) {(1/sqrt(2*pi))*exp(-(u^2)/2)} # or dnorm(u)

DensityGraph <- function(x, h){
  n    <- length(x)
  xi   <- seq(min(x) - sd(x), max(x) + sd(x), length.out = 512)
  
  # fhat without sum since we are interest in the bell shaped curves
  fhat <- sapply(x, function(y){(1/(n*h))*GK((xi - y)/h)})
  
  # histogram of x
  hist (x, freq = FALSE, main = "Kernel Density with Histogram of River Monsters",
        xlab = paste("N = ", n, "   ", "Bandwidth = ", h), ylim = c(0, 0.15))
  
  # add fhat with sum
  lines(xi, rowSums(fhat), lwd = 2)
  
  # add the bell shaped curves
  apply(fhat, 2, function(j) lines(xi, j, col = 4))
  
  # show data points
  rug  (x, lwd = 2, col = 2)
}

DensityGraph(d, h)


################################

install.packages('ggplot2')

library(ggplot2)
library(dplyr)

df = data_frame(x=c(101,97,99,104,103,94,102,94,102,106)) 

density_estimate <- density(df$x)
mode_value <- density_estimate$x[which.max(density_estimate$y)]
mode_value

df %>% 
  ggplot(aes(x=x, fill = 'x')) + 
  geom_density(bw=1, kernel = 'gaussian') + 
  geom_rug(aes(x=x, y = 0), color = "grey",position = position_jitter(height = 0)) +
  geom_vline(aes(xintercept=mode_value),
             color="blue", linetype="dashed")+
  ggtitle('Kernel Density with Histogram of River Monsters')+
  theme_bw()

