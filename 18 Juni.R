library("ggplot2")
library("dplyr")

head(USArrests)

data <- tibble(state = state.name,
               Region = state.region) %>%
                bind_cols(USArrests)

data %>%
  ggplot(aes(x=Murder,y=Assault, size=Rape))+
  geom_point(alpha=0.6)+
  scale_size_continuous(range = c(1,7))+
  labs(x="Murder",y="Assault",size="Rape")


data %>%
  ggplot(aes(x=Murder,y=Assault, size=Rape, color=UrbanPop, label=state))+
  geom_point(alpha=0.6)+
  scale_size_continuous(range = c(1,7))+
  labs(x="Murder",y="Assault",size="Rape")


plot1=data %>%
  ggplot(aes(x=Murder,y=Assault, size=Rape, color=UrbanPop, label=state))+
  geom_point(alpha=0.8)+
  geom_text(aes(label=state),hjust = 0, vjust=0)+
  scale_size_continuous(range=c(1,7))+
  labs(x="Murder",y="Assault",size="Rape",color="UrbanPop")
plot1


#MPG dataset
mpg <- mpg[mpg$manufacturer %in% c("audi","ford","honda","hyundai"),]
#scatterplot
theme_set(theme_bw())#preset bw theme
g <- ggplot(mpg,aes(displ,cty))+
  labs(subtitle = "mpg: Displacement vs City Mileage",
       title="Bubble chart")
g + geom_jitter(aes(col=manufacturer, size=hwy))+
  geom_smooth(aes(col=manufacturer), method="lw", se=F)
g

plot2 = g + geom_jitter(aes(col=manufacturer, size=hwy))+
  geom_smooth(aes(col=manufacturer), method="lm", se=F)
plot2


#mtcars dataset
#load data

data("mtcars")
df <- mtcars

df$cyl <- as.factor(df$cyl)

head(df[, c("wt","mpg","cyl","qsec")],4)
ggplot(df,aes(x=wt, y=mpg))+
  geom_point(aes(color=cyl, size=qsec),alpha = 0.5)+
  scale_color_manual(values = c("#00AFBB","#E7B800","#FC4E07"))+
  scale_size(range = c(0.5,12))

plot3 = ggplot(df,aes(x=wt, y=mpg))+
  geom_point(aes(color=cyl, size = qsec), alpha = 0.5)+
  scale_color_manual(values = c("#00AFBB","#E7B800","#FC4E07"))+
  scale_size(range = c(0.5,12))
plot3