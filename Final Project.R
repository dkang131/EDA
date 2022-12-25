library(tidyverse)
library(readr)
library(dplyr)
library(corrplot)
library(ggcorrplot)
library(MASS)
library(rpart)
library(class)
library(GGally)
library(gridExtra)
library(extrafont)
library(ggthemes)
library(Rmisc)

data <- read.csv("C:/Users/darre/Desktop/EDA/archive (2)/drug200.csv")
data
df <- na.omit(data)

head(df)

str(df)

df$Sex <- as.factor(df$Sex)
df$BP <- as.factor(df$BP)
df$Cholesterol <- as.factor(df$Cholesterol)
df$Drug <- as.factor(df$Drug)
str(df)


library("ggplot2")
g1 <- ggplot(df,aes(x=BP,y=Cholesterol,size=Cholesterol))+
  geom_point(aes(col=Drug))+
  geom_smooth(method = "lm",se=FALSE)
g1

g2 <- ggplot(df,aes(x=Age,y=Cholesterol,size=Cholesterol))+
  geom_point(aes(col=Drug))+
  geom_smooth(method = "lm",se=FALSE)
g2

g3 <- ggplot(df,aes(x=Age,y=BP,size=BP))+
  geom_point(aes(col=Drug))+
  geom_smooth(method = "lm",se=FALSE)
g3

#boxplot
g11 <- ggplot(df, aes(x=Sex,y=Age,fill=Sex))+
  geom_boxplot()+
  theme_economist_white(gray_bg = FALSE)
g11

#bargraph
g12 <- ggplot(df, aes(Drug,fill=Drug))+
  geom_bar()+
  theme_economist_white(gray_bg = FALSE)
g12

#age drug density
g31 <- ggplot(df,aes(Age,col=Drug,fill=Drug))+
  geom_density(alpha=0.2)+
  theme_economist_white(gray_bg = FALSE)+
  guides(col=F)
g31

#age drug boxplot
g41 <- ggplot(df,aes(x=Age,y=Drug,fill=Drug))+
  geom_boxplot()+
  theme_economist_white(gray_bg = F)+
  coord_flip()+
  stat_summary(fun=mean, geom="point", shape=20, size=3, color="red", fill="red")+
  ggtitle("Age & Drug Boxplot")
g41

g42 <- ggplot(df,aes(x=Age,y=Drug,fill=Drug))+
  geom_violin(trim = FALSE)+
  #theme_economist_white(gray_bg = F)+
  coord_flip()+
  stat_summary(fun=mean, geom="point", shape=23, size=2)+
  stat_summary(fun=median, geom="point", size=2, color="red")+
  geom_boxplot(width=0.1)
g42

multiplot(g41,g42,cols=2)
grid.arrange(g41,g42,nrow=1)

#age Na_to_K
g51 <- ggplot(df,aes(x=Age,y=Na_to_K,size=Age))+
  geom_point(aes(col=Drug))+
  geom_smooth(method = "lm",se=FALSE)+
  scale_x_continuous(name = "Age")+
  scale_y_continuous(name = "Na_to_K")+
  theme_economist_white(gray_bg = FALSE)+
  ggtitle("Age & Na_to_K")+
  theme(plot.title = element_text(hjust = 0.5))
g51

#drug count
g61 <- ggplot(df,aes(Drug,fill=Drug))+
  geom_bar(stat = "count")+
  #guides(fill = F)+
  #theme_economist_white(gray_bg = FALSE)+
  ggtitle("Count of Each Type of Drug")
g61

g62 <- ggplot(df,aes(Sex,fill=Sex))+
  geom_bar(stat = "count")+
  #guides(fill = F)+
  #theme_economist_white(gray_bg = FALSE)+
  ggtitle("Count of Patients by Sex")
g62


#age bar
g62 <- ggplot(df,aes(Age,fill=Age))+
  geom_bar(stat="count",fill="steelblue")+
  #guides(fill = F)+
  theme_economist_white(gray_bg = FALSE)
g62

#sex age drug bar
g71 <- ggplot(data=df,aes(x=Sex, y=Age, fill=Drug))+
  geom_bar(stat = "identity", position = position_dodge())+
  ggtitle("Age & Sex Bargraph")
g71

#bp chol drug bar
g72 <- ggplot(data=df,aes(x=BP, y=Cholesterol, fill=Drug))+
  geom_bar(stat = "identity", position = position_dodge())
g72
