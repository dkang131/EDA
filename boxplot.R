library(ggplot2)

ToothGrowth$dose <- as.factor(ToothGrowth$dose)
str(ToothGrowth)

b <- ggplot(ToothGrowth, aes(x=dose, y=len))+
  geom_boxplot()
b


#fill
ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
  geom_boxplot()

#fill manually
ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
  geom_boxplot()+
  scale_fill_manual(values = c('orange1','dodgerblue1','olivedrab3'))

#fill using brwer
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot()+
    scale_fill_brewer(palette='Dark2')

#fill with grey
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot()+
    scale_fill_grey()

#fill ggplot color
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot(fill='lightblue1', color='dodgerblue1')

#see the outlier
  ggplot(ToothGrowth, aes(x=dose, len))+
    geom_boxplot(outlier.size = 3, outlier.shape = 18, outlier.colour = 'red')

#using other theme
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot()+
    theme_classic()

#add titles
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot()+
    ggtitle("Tooth Growth in Guinea Pigs")+
    xlab('vitamin C dose (mg/day)')+
    ylab("Length of odontoblasts")
  
#flip the graph
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot()+
    coord_flip()

#notched box plot
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot(notch = TRUE)

#include the mean
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot()+
    stat_summary(fun=mean, geom="point", shape = 18, size = 3, color="white")

#split into groups
  ggplot(ToothGrowth, aes(x=dose, len, fill=supp))+
    geom_boxplot()

#using facet
  ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot()+
    facet_grid(.~supp)

#add titles and change the theme
ggplot(ToothGrowth, aes(x=dose, len, fill=dose))+
    geom_boxplot(outlier.size = 3, outlier.shape = 18, outlier.colour = 'red')+
    geom_point()+
    facet_grid(.~supp)+
    ggtitle("Toothgrowth in Guinea Pigs")+
    xlab("vitamin c dose(mg/day)")+
    ylab("length of odontoblasts")+
    theme(panel.grid = element_blank(),
        axis.text = element_text(size = 12),
        axis.title = element_text(size=12),
        plot.title = element_text(size=14, hjust=0.5, face="bold"),
        plot.margin = unit(c(0.5,0.5,0.5,0.5), units = ,"cm"),
        legend.position = "bottom",
        legend.box.background = element_rect(color="grey", size =0.3))
        
  
