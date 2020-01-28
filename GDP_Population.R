library(readr)
GDP <- read_csv("~/R/61c98e8b-7f89-4a42-9a2e-f36232882c62_Data.csv")



library(readr)
URBAN_population <- read_csv("~/R/2c2ee1ae-c970-4341-8634-5385b57af2c2_Data.csv")







Urban_1 <- URBAN_population[1:217, ]
View(Urban_1)
Gdp_1 <- GDP[1:217, ]
View(Gdp_1)


as.num = function(x, na.strings = "..") {
  stopifnot(is.character(x))
  na = x %in% na.strings
  x[na] = 0
  x = as.numeric(x)
  x[na] = NA_real_
  x
}



boxplot(as.num(Gdp_1$`2015 [YR2015]`))
boxplot(as.num(Urban_1$`2015 [YR2015]`)) ## For normality

newdata <- na.omit(data.frame(as.num(Urban_1$`2015 [YR2015]`), as.num(Gdp_1$`2015 [YR2015]`)))
View(newdata)
plot(newdata$as.num.Urban_1..2015..YR2015..., log10(newdata$as.num.Gdp_1..2015..YR2015...), pch = 13, col = 125, main = "Relation between Gdp&Population", xlab = "population", ylab = "gdp")
cor(newdata$as.num.Urban_1..2015..YR2015..., log10(newdata$as.num.Gdp_1..2015..YR2015...))

## regression
regmodel <- lm(log10(newdata$as.num.Gdp_1..2015..YR2015...)~newdata$as.num.Urban_1..2015..YR2015...)
abline(regmodel)
summary(regmodel)

## residuals
resmodel <- resid(regmodel)
plot(newdata$as.num.Urban_1..2015..YR2015..., resmodel)
