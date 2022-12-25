head(ToothGrowth)

df <- data.frame(dose=c("D0.5","D1","D2"), len=c(4.2,10,29.5))
head(df)

library("ggplot2")
p <- ggplot(data=df,aes(x=dose, y=len))+
  geom_bar(stat = "identity")
p

p + coord_flip()

p <- ggplot(data=df,aes(x=dose, y=len))+
  geom_bar(stat = "identity", width = 0.5)
p

p <- ggplot(data=df,aes(x=dose, y=len))+
  geom_bar(stat = "identity", width = 0.5, color="blue", fill="white")
p

p <- ggplot(data=df,aes(x=dose, y=len))+
  geom_bar(stat = "identity", width = 0.5,fill="steelblue")+
  theme_minimal()
p

p + scale_x_discrete(limits = c("D0.5","D2"))

p <- ggplot(data=df,aes(x=dose, y=len))+
  geom_bar(stat = "identity", fill="steelblue")+
  geom_text(aes(label=len),vjust=-0.3,size=3.5)+
  theme_minimal()
p

p <- ggplot(data=df,aes(x=dose, y=len))+
  geom_bar(stat = "identity", fill="steelblue")+
  geom_text(aes(label=len),vjust=1.6,color="white",size=3.5)+
  theme_minimal()
p


df2 <- data.frame(supp=rep(c("VC","OJ"), each=3), dose=rep(c("D0.5","D1","D2"),2),
                           len = c(6.8,15,33,4.2,10,29.5))
head(df2)

ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity")                           

ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity", position=position_dodge())

p <- ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity", color="black", position=position_dodge())+
  theme_minimal()
p

p + scale_fill_manual(values=c('#999999','#E69F00'))
p + scale_fill_brewer(palette="Blues")

ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity", position=position_dodge())+
  geom_text(aes(label=len), vjust=1.6, color="white",
            position = position_dodge(0.9), size=3.5)+
  scale_fill_brewer(palette="Paired")+
  theme_minimal()

library(plyr)
# Sort by dose and supp
df_sorted <- arrange(df2, dose, supp)
head(df_sorted)
# Calculate the cumulative sum of len for each dose
df_cumsum <- ddply(df_sorted, "dose",
                   transform, label_ypos=cumsum(len))
head(df_cumsum)

# Create the barplot
ggplot(data=df_cumsum, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity")+
  geom_text(aes(y=label_ypos, label=len), vjust=1.6,
            color="white", size=3.5)+
  scale_fill_brewer(palette="Paired")+
  theme_minimal()

df_cumsum <- ddply(df_sorted, "dose",
                   transform,
                   label_ypos=cumsum(len) - 0.5*len)
# Create the barplot
ggplot(data=df_cumsum, aes(x=dose, y=len, fill=supp)) +
  geom_bar(stat="identity")+
  geom_text(aes(y=label_ypos, label=len), vjust=1.6,
            color="white", size=3.5)+
  scale_fill_brewer(palette="Paired")+
  theme_minimal()


# Libraries
library(ggplot2)
library(dplyr)
# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)
# Most basic bubble plot
ggplot(data, aes(x=gdpPercap, y=lifeExp, size = pop)) +
  geom_point(alpha=0.7)

# Most basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size = pop)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")
