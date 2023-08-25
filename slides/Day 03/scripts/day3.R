# Install readxl package 
install.packages("readxl") 

# Use readxl package 
library(readxl)

# Check documentation of any package 
?readxl

# read excel data into R 
excel_data <- read_excel("data/Life_Expectancy_Wide.xlsx")

# use function without loading packages 
ds <- readxl::read_excel("data/Life_Expectancy_Long.xlsx")

# read csv data into R 
diabetes <- read.csv("data/diabetes.csv")

# show built-in datasets 
data() 
CO2
airquality     

# store in a new variable 
aq <- airquality

# data packages 
install.packages("gapminder")

# load package data 
library(gapminder)
gapminder

# export data 
write.csv(gapminder, file = "data/gapminder_data.csv")

# install packages 
write.xlsx(gapminder, file = "data/gapminder_data.xlsx")






# load data 
library(gapminder)
library(tidyverse)

# show entire data 
gapminder

# examine first few rows 
head(gapminder)
head(gapminder, n = 10)
head(gapminder, 10)

# examine last few rows 
tail(gapminder)
tail(gapminder, n = 10)
tail(gapminder, 10)

# sampling 
sample(gapminder)
sample_n(gapminder, 20)
sample_frac(gapminder, .25) 

# dimension = row x columns 
dim(gapminder)

# number of rows 
nrow(gapminder)

# number of columns 
ncol(gapminder)

# column names 
names(gapminder)

# uniqueness 
unique(gapminder)

# data structure 
str(gapminder)

# using glimpse() function 
glimpse(gapminder)

# summary function
summary(gapminder)

# check missing data 
is.na(gapminder)
# all missing data 
sum(is.na(gapminder))
# remove missing data 
na.omit(gapminder)

# data exploration with skimr 
install.packages("skimr")
library(skimr)
skim(gapminder)

# check again our dataset 
gapminder

# select one column 
select(gapminder,country)

# select multiple columns 
select(gapminder, country, continent, year)

# remove single column 
select(gapminder, -gdpPercap)

# remove multiple columns 
select(gapminder, -c(year,lifeExp, pop)) 

# select column using range (:)
select(gapminder, country:lifeExp)

# select single column using numbers 
select(gapminder, 1)

# select multiple columns using numbers 
select(gapminder, c(1, 3, 5))

# select column using range with numbers 
select(gapminder, 1:3)

# remove single column using numbers 
select(gapminder, -1)

# remove multiple columns using numbers 
select(gapminder, -c(1, 3, 5))

# select columns using contains() function 
select(gapminder, contains("c"))
select(gapminder, contains("c"), contains("g"))

# select columns using starts_with() function
select(gapminder, starts_with("c"))

# select columns using ends_with() function
select(gapminder, ends_with("t"))


# filtering rows = equality 
filter(gapminder, country == "Bangladesh")

# filtering rows = inequality 
filter(gapminder, country != "India")

# filtering rows using ">" 
filter(gapminder, gdpPercap > 800)

# filtering rows using "<" 
filter(gapminder, gdpPercap < 800)

# filtering rows using "<=" 
filter(gapminder, gdpPercap <= 800)

# filtering rows using ">=" 
filter(gapminder, gdpPercap >= 800)


# filtering rows using AND (&)
filter(gapminder, country == "Bangladesh" & gdpPercap > 800)

# filtering rows using OR (|)
filter(gapminder, country == "Bangladesh" | gdpPercap > 800)

# using %in% operator 
filter(gapminder, country %in% c("Bangladesh", "Australia", "India"))

# chaining method
new_data <- select(gapminder, country, gdpPercap, pop)
filter(new_data, gdpPercap > 800)

# using pipe %>% 
gapminder %>% 
  select(country, gdpPercap, pop) %>% 
  filter(gdpPercap > 800) %>% 
  head()

# create new variables using mutate 
gapminder %>% 
  mutate(gdp = gdpPercap * pop) %>% 
  head()

gapminder %>% 
  mutate(gdpM = gdpPercap * pop / 10^6) %>% 
  tail()

gapminder %>% 
  mutate(Dummy = 1)

# rename variables 
gapminder %>% 
  rename(population = pop)

gapminder %>% 
  mutate(population = pop)

# sorting data 
gapminder %>%
  select(country, gdpPercap) %>%
  arrange(gdpPercap) %>% 
  head()

gapminder %>%
  select(country, gdpPercap) %>%
  arrange(desc(gdpPercap)) %>% 
  head()

# grouping data 
gapminder %>% 
  group_by(continent) %>% 
  summarise(min_lifeExp = min(lifeExp), 
            max_lifeExp = max(lifeExp), 
            avg_lifeExp = mean(lifeExp)) %>% 
  arrange(desc(min_lifeExp))

# save data frame 
df <- gapminder %>% 
  group_by(continent) %>% 
  summarise(min_lifeExp = min(lifeExp), 
            max_lifeExp = max(lifeExp), 
            avg_lifeExp = mean(lifeExp)) %>% 
  arrange(desc(min_lifeExp))
df


