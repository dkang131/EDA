library ("readr")
diabetes <- read_csv("C:/Users/darre/Documents/diabetes.csv")
View(diabetes)
str(diabetes)
colSums(is.na(diabetes))
diabetes$Outcome <- as.factor(diabetes$Outcome)
str(diabetes)

library("ggplot2")
p1 <- ggplot(diabetes, aes(x=Outcome, y=BMI,fill=Outcome))+
  geom_boxplot()
p1

p2 <- ggplot(diabetes, aes(x=Outcome, y=Glucose,fill=Outcome))+
  geom_boxplot()
p2

p3 <- ggplot(diabetes, aes(x=Outcome, y=Age,fill=Outcome))+
  geom_boxplot()
p3

p4 <- ggplot(diabetes, aes(x=Outcome, y=Insulin,fill=Outcome))+
  geom_boxplot()
p4

p5 <- ggplot(diabetes, aes(x=Outcome, y=BloodPressure,fill=Outcome))+
  geom_boxplot()
p5

p6 <- ggplot(diabetes, aes(x=Age, y=Glucose, col=Outcome))+
  geom_point()+
  geom_smooth(method = "loess")
p6

p7 <- ggplot(diabetes, aes(x=Glucose, y=SkinThickness, col=Outcome))+
  geom_point()+
  geom_smooth(method = "loess")
p7

df1 <- diabetes$BMI [diabetes$Outcome == "0"]
df1
df2 <- diabetes$BMI [diabetes$Outcome == "1"]
df2

install.packages("ggpubr")
library("ggpubr")
t.test(df1, df2, mu=25) #where y is numeric and x is binary factor


p6 <- ggplot(diabetes, aes(x=Age, y=Glucose, col=Outcome))+
  geom_point()+
  geom_smooth(method = "loess")
p6

p7 <- ggplot(diabetes, aes(x=Age, y=Glucose, col=Outcome))+
  geom_violin(position_dodge(width=FALSE))
p7


