library(tidyverse)
library(ggpubr)
library(gtsummary)
library(ggplot2)


data <- read.csv("data/pulse_data.csv")

data %>% 
  head()


data %>% 
  group_by(Gender) %>% 
  summarise(avg_bmi = mean(BMI))


data %>% 
  group_by(BMICat) %>% 
  summarise(avg_bmi = mean(BMI))



result <- t.test(data$BMI, mu = 22, alternative = "two.sided")
result

result$p.value < 0.05
result$statistic
result$conf.int



anorexia <- read.csv("data/anorexia.csv")
head(anorexia)


x <- subset(anorexia, Treat == "Cont", Prewt, drop =TRUE)

y <- subset(anorexia, Treat == "Cont", Postwt, drop=TRUE) 

# Perform paired t-test
t.test(x, y, paired = TRUE)



# Import data 
us_mortality = read.csv("data/USRegionalMortality.csv")
head(us_mortality)


# Filtering Data
x <- us_mortality %>%
  filter(Cause == "Heart disease" & Sex == "Male")

y <- us_mortality %>%
  filter(Cause == "Heart disease" & Sex == "Female")


plot(x$Rate, y$Rate)



# Student's t-test
test <- t.test(x$Rate, y$Rate, var.equal = TRUE)
test$p.value < 0.05


test <- t.test(x$Rate, y$Rate)
test



migraine_data <- read.csv("data/KosteckiDillon.csv")
head(migraine_data)


table <- table(migraine_data$sex, migraine_data$headache)
table

chisq.test(table)


fisher.test(migraine_data$sex, migraine_data$medication)



data("iris")
head(iris)

iris %>% 
  select(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) %>% 
  cor() 


iris %>% 
  select(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) %>% 
  cor(method = "spearman") 


cor.test(iris$Sepal.Length, iris$Petal.Length)




# Effect of cadmium on growth of green alga
pulse <- read.csv("data/pulse_data.csv")
head(pulse)

one_way_anova <- aov(BMI ~ as.factor(BMICat), data = pulse)
one_way_anova


summary(one_way_anova)


TukeyHSD(one_way_anova)





two_way_anova <- aov(BMI ~ as.factor(BMICat)+as.factor(Ran), data = pulse)
two_way_anova
TukeyHSD(two_way_anova)





