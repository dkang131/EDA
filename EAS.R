
data <- read.csv("C:/Users/darre/Downloads/Automobile_repair.csv")
data
df <- na.omit(data)

head(data)
str(data)

df$Drive.wheels <- as.factor(df$Drive.wheels)
df$Fuel.type <- as.factor(df$Fuel.type)
df$Engine.location <- as.factor(df$Engine.location)
df$Make <- as.factor(df$Make)
df$Engine.type <- as.factor(df$Engine.type)
df$Num.of.cyclinders <- as.factor(df$Num.of.cyclinders)
str(df)


library("ggplot2")
g1 <- ggplot(df,aes(x=Engine.type,y=Drive.wheels,fill=Drive.wheels))+
  geom_bar(stat = "identity", position = position_dodge())
g1

g2 <- ggplot(df,aes(x=City.mpg.real,y=Highway.mpg.real))+
  geom_point()+
  geom_smooth(method = "lm",se=FALSE)
g2

g3 <- ggplot(df,aes(x=Engine.type,y=Engine.location,fill=Engine.location))+
  geom_bar(stat = "identity", position = position_dodge())
g3

g4 <- ggplot(df,aes(x=Wheel.base.real,y=Horsepower.real))+
  geom_point(aes(col=Wheel.base.real))+
  geom_smooth(method = "lm",se=FALSE)
g4

g41 <- ggplot(df,aes(x=Horsepower.real,y=Engine.size.real))+
  geom_point(aes(col=Engine.type))+
  geom_smooth(method = "lm",se=FALSE)
g41

g5 <- ggplot(df,aes(x=Make,y=Fuel.type,fill=Fuel.type))+
  geom_bar(stat = "identity", position = position_dodge())+
  coord_flip()
g5
