install.packages("Hmisc")

library("ggplot2")
library("Hmisc")

#convert the variable dose from a numeric to a factor var
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

#Basic violin plot
p <- ggplot(ToothGrowth, aes(x=dose, y=len))+
  geom_violin()
p
#rotate the violin plot
p + coord_flip()
#set trim argument to false
ggplot(ToothGrowth, aes(x=dose, y=len))+
  geom_violin(trim=FALSE)
#pick an item to display
p + scale_x_discrete(limits=c("0.5","2"))


#add summary statistics on a violin plot
stat_summary()

#add mean and median points
#violin plot with points
p + stat_summary(fun.y=mean, geom="point", shape=23, size=2)
#violin plot with median points
p + stat_summary(fun.y=median, geom="point", size=2, color="red")
#add median and quartile
p + geom_boxplot(width=0.1)
#add mean and standard dev
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) +
  geom_violin(trim=FALSE)
p + stat_summary(fun.data="mean_sdl", mult=1,
                 geom="crossbar", width=0.2)
p + stat_summary(fun.data="mean_sdl", mult=1,
                 geom="pointrange", color="red")
#violin plot with dots
#violin plot with dot plot
p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
#violin plot with jittered points
#0.2 : degree of jitter in x direction
p + geom_jitter(shape=16, position=position_jitter(0.2))

#change violin plot colors by group
#change violin plot line color
#change violin plot line colors by group
p <- ggplot(ToothGrowth, aes(x=dose, y=len, color=dose))+
  geom_violin(trim=FALSE)
p
#use custom color palettes


#change violin plot fill colors
#use single color
ggplot(ToothGrowth, aes(x=dose, y=len))+
  geom_violin(trim=FALSE, fill="yellow", color="darkred")+
  geom_boxplot(width=0.1)+ theme_minimal()
#change violin plot colors by group
p<-ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose))+
  geom_violin(trim=FALSE)
p

#use custom color palettes

#change the legends position
p + theme(legend.position = "top")
p + theme(legend.position = "bottom")
p + theme(legend.position = "none")

#change the order of the items in the legend
p + scale_x_discrete(limits=c("2","1","0.5"))

#violin plot with multiple group
# change violin plot colors by groups
ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp))+
  geom_violin()
#change the position
p<-ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp))+
  geom_violin(position = position_dodge(1))
p


