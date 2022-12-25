library("ggplot2")

ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_jitter()

p <- ggplot(ToothGrowth,aes(x=dose,y=len))+
      geom_jitter(position = position_jitter(0.2))
p

p + coord_flip()

p+scale_x_discrete(limits=c("0.5","2"))


ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_jitter(position = position_jitter(0.2),cex=1.2)

#change shape
ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_jitter(position = position_jitter(0.2),shape=17)

#add mean and median point
p + stat_summary(fun.y = mean, geom="point",shape=18,
                 size=3, color="red")


p + stat_summary(fun.y = median, geom="point",shape=18,
                 size=3, color="red")


ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_boxplot()+
  geom_jitter(position=position_jitter(0.2))


ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_boxplot(notch = TRUE)+
  geom_jitter(position=position_jitter(0.2))

ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_violin(trim = FALSE)+
  geom_jitter(position=position_jitter(0.2))

#add mean and stdev
p <- ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_jitter(position_jitter(0.2))
p+stat_summary(fun.data = "mean_sdl",mult=1,
               geom="crossbar",width=0.5)

p+stat_summary(fun.data="mean_sdl",mult=1,
               geom="pointrange",color="red")

#change point shapes by group
p <- ggplot(ToothGrowth,aes(x=dose,y=len,shape=dose))+
  geom_jitter(position=position_jitter(0.2))
p

#change point shapes manually
p + scale_shape_manual(values=c(1,17,19))

par(mfrow=c(3,1))
plot(dat, main="No jitter for x-axis",xlab="")