library("ggplot2")

head(ToothGrowth)

ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head (ToothGrowth)

p <- ggplot(ToothGrowth,aes(x=dose,y=len))+geom_violin()
p

p + coord_flip()
p

ggplot(ToothGrowth,aes(x=dose,y=len))+
  geom_violin(trim=FALSE)

head(mtcars)

ggplot(mtcars, aes(x=drat,y=mpg))
ggplot(mtcars,aes(x=drat,y=mpg))+geom_point()


data("midwest",package="ggplot2")
head(midwest)

gg <- ggplot(midwest,aes(x=area,y=poptotal))+
  geom_point(aes(col=state,size=popdensity))+
  geom_smooth(method="loess", se=F)+
  xlim(c(0,0.1))+
  ylim(c(0,500000))+
  labs(subtitle="Area Vs Population",
       y="population",
       x="Area",
       title="Scatterplot",
       caption = "Source : midwest")

plot(gg)


data("mpg",package="ggplot2")
#mpg <- read.csv("http://goo,gl/uEeRGu")
#scatterplot
theme_set(theme_bw())#preset the bw theme

g <- ggplot(mpg,aes(cty,hwy))
g + geom_jitter(width = 0.5, size = 1)+
  labs(subtitle="mpg: city vs highway mileage",
       y="hwy",
       x="cty",
       title="Jittered Points")