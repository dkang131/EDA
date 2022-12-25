library(ggplot2)

################################################################################
#                          STUDY CASE 1 (FAITHFUL DATASET)                     #
################################################################################

head(faithful)

## Scatter Plot Basic
plot(faithful$eruptions, faithful$waiting,  # plot the variables 
     xlab="Eruption duration", #x-axis label
     ylab="Time waited")     #y-axis label


## Scatter Plot with Line
plot(faithful$eruptions, faithful$waiting,  # plot the variables 
     xlab="Eruption duration", #x-axis label
     ylab="Time waited")     #y-axis label
abline(lm(faithful$eruptions ~ faithful$waiting))

# Using ggplot
## Scatter Plot Basic
ggplot(data = faithful,aes(x=faithful$eruptions,y=faithful$waiting)) +
  geom_point() 

## Scatter Plot with Regression Line
ggplot(data = faithful,aes(x=faithful$eruptions,y=faithful$waiting)) +
  geom_point() +
  geom_smooth(method=lm , color="red", se=FALSE)

## Scatter Plot with Regression Line and CI
ggplot(data = faithful,aes(x=faithful$eruptions,y=faithful$waiting)) +
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE)


################################################################################
#                        STUDY CASE 2 (GAPMINDER DATASET)                      #
################################################################################
library(gapminder)
library(tidyr)
library(dplyr)

summary(gapminder)
glimpse(gapminder)


# Create basic ggplot, set gdpPercap as the x-axis and lifeExp as the y-axis
p <- ggplot(gapminder,aes(x=gdpPercap,y=lifeExp))

## Experiment with adding points
p + geom_point()

## Experiment with a different scale
p + geom_point() + scale_x_log10()


# We will be using 'scale_x_log10()'
p <- p + scale_x_log10()

p + geom_point()

p + geom_point(aes(color=continent))

p + geom_point(color="blue", pch=17, size=8, alpha=1/4)

p + geom_point(aes(col=continent, shape=continent, size=lifeExp))

p + geom_point(aes(col=continent), size=3)

## Filter to the year 2007
filter(gapminder,year==2007) %>%
  ggplot(aes(x=gdpPercap,y=lifeExp, color = continent))+
  geom_point()+
  scale_x_log10()

# Adding Line
p <- ggplot(gapminder,aes(x=gdpPercap,y=lifeExp)) + scale_x_log10()
p + geom_point() + geom_smooth()

p + geom_point() + geom_smooth(lwd=2, se=FALSE, method="lm", col="red")

# Coloring by the Continent
p + geom_point(aes(color = continent)) + geom_smooth()

p + aes(color = continent) + geom_point() + geom_smooth()
p + aes(color = continent) + geom_point() + geom_smooth(se=F, lwd=2)

# Faceting
p + geom_point(aes(color = continent)) + facet_wrap(~continent)
p + geom_point(aes(color = continent)) + geom_smooth() + facet_wrap(~continent, ncol=1)

# Publication Ready
p <- ggplot(gapminder,aes(x=gdpPercap,y=lifeExp) 
p <- p + scale_x_log10()
p <- p + aes(col=continent) + geom_point() + geom_smooth(lwd=2, se=FALSE)
p <- p + ggtitle("Life expectancy vs GDP by Continent")
p <- p + xlab("GDP Per Capita (USD)") + ylab("Life Expectancy (years)")
p
p + theme_gray()
p + theme_classic()
