#install.packages("tidyverse")
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
#install.packages("Rmisc")
library(Rmisc)

data <- read.csv("C:/Users/darre/Downloads/heart.csv")
df <- na.omit(data)

head(df)

str(df)

df$sex <- as.factor(df$sex)
df$cp <- as.factor(df$cp)
df$fbs <- as.factor(df$fbs)
df$restecg <- as.factor(df$restecg)
df$exang <- as.factor(df$exang)
df$slope <- as.factor(df$slope)
df$ca <- as.factor(df$ca)
df$thal <- as.factor(df$thal)
df$target <- as.factor(df$target)
str(df)

corrplot(cor(df[,c(1,4,5,8,10)]),type = "lower",method = "number")

library("ggplot2")
#age and cholesterol
g_age_chol <- ggplot(df,aes(x=age,y=chol,size=chol))+
  geom_point(aes(col=target))+
  geom_smooth(method = "lm",se=FALSE)+
  scale_x_continuous(name = "Age")+
  scale_y_continuous(name = "Chol level")+
  theme_economist_white(gray_bg = FALSE)+
  ggtitle("Age & Cholesterol")+
  theme(plot.title = element_text(hjust = 0.5))
g_age_chol

#age & max heart rate
g_age_maxhr <- ggplot(df,aes(x=age,y=thalach,size=thalach))+
  geom_point(aes(col=target))+
  geom_smooth(method = "lm",se=FALSE)+
  scale_x_continuous(name = "Age")+
  scale_y_continuous(name = "Max heart rate")+
  theme_economist_white(gray_bg = FALSE)+
  ggtitle("Age & Cholesterol")+
  theme(plot.title = element_text(hjust = 0.5))
g_age_maxhr

#total cases of heart disease (target = 1)
ggplot(df, aes(target,fill=target))+
  geom_bar(stat="count")+
  guides(fill=F)+
  labs(x="Target",y="count",caption = " 0 = no heart disease
       1 = heart disease")+
  theme_economist_white(gray_bg = FALSE)+
  theme(plot.caption = element_text(hjust = 0.5))+
  ggtitle("Total target")+
  theme(plot.title = element_text(hjust = 0.5))

summary(df$age)

#age by sex boxplot
g1 <- ggplot(df, aes(x=sex,y=age,fill=sex))+
  geom_boxplot()+
  theme_economist_white(gray_bg = FALSE)+
  labs(x="Sex",caption = " 0 = female
       1 = male",fill = "sex")+
  theme(plot.caption = element_text(hjust = 0.5))
g1

#sex bargraph
g2 <- ggplot(df,aes(sex,fill=sex))+
  geom_bar()+
  theme_economist_white(gray_bg = FALSE)+
  labs(x="sex",fill="sex")
g2

#age and target density
g3 <- ggplot(df,aes(age,col=target,fill=target))+
  geom_density(alpha=0.2)+
  theme_economist_white(gray_bg = FALSE)+
  guides(col=F)+
  labs(fill="Target",x="Age")
g3

#age and target boxplot
g4 <- ggplot(df,aes(x=target,y=age,fill=target))+
  geom_boxplot()+
  theme_economist_white(gray_bg = FALSE)+
  labs(y="Age",x="Target",fill="Target")
g4

grid.arrange(g2, g1, nrow=1)""

multiplot(g3,g4,cols=2)

#resting blood pressure and target density
g11 <- ggplot(df,aes(trestbps,col=target,fill=target))+
  geom_density(alpha=0.2)+
  theme_economist_white(gray_bg = FALSE)+
  guides(col=F)+
  labs(fill="Target",x="Resting Blood Pressure",y="Density")
g22 <- ggplot(df,aes(x=target,y=age,fill=target))+
  geom_boxplot()+
  theme_economist_white(gray_bg = FALSE)+
  labs(y="Resting Blood Pressure",x="Target",fill="Target")
multiplot(g11,g22,cols=2)

#chest pain type bargraph
g12 <- ggplot(df,aes(cp,fill=target))+
  geom_bar(stat = "count",position = "fill")+
  theme_economist_white(gray_bg = FALSE)+
  labs(x="Chest Paint Type",fill="Target",y="stacked count",caption = "Value 0: typical angina
       Value 1: atypical angina
       Value 2: non-anginal pain
       Value 3: asymptomatice")
g12

#quick summary of max heart rate
summary(df$thalach)

#max heart rate and target density
g13 <- ggplot(df,aes(thalach,col=target,fill=target))+
  geom_density(alpha=0.2)+
  guides(col=F)+
  labs(fill="Target",x="Maximum heart rate achieved")+
  theme_economist_white(gray_bg = FALSE)

#max heart rate and target boxplot
g23 <- ggplot(df, aes(target,thalach,fill=target))+
  geom_boxplot()+
  labs(y="Maximum Heart Rate Achieved",x="Target",fill="Target")+
  theme_economist_white(gray_bg = FALSE)

grid.arrange(g13,g23,nrow=1)