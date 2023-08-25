# load package 
library(tidyverse)
library(naniar)



# wide data 
wide <- readxl::read_excel("data/Life_Expectancy_Wide.xlsx")

# wide to long 
long <- pivot_longer(wide, cols = 2:75, names_to = "Year", 
                     values_to = "LifeExp")
# summarize data 
long %>% 
  group_by(Country) %>% 
  summarise(avg_lifeExp = mean(LifeExp))

# long to wide 
wide_data <- pivot_wider(long, names_from = "Year", values_from = "LifeExp")

# load data 
data1 <- read.csv("data/join_example_01.csv")
data2 <- read.csv("data/join_example_02.csv")

# Left Join 
lj <- left_join(data1, data2, by = "x1")
lj

# Right Join 
rj <- right_join(data1, data2, by = "x1")
rj

# Inner Join 
ij <- inner_join(data1, data2, by = "x1")
ij

# Full Join 
fj <- full_join(data1, data2, by = "x1")
fj

# Semi Join 
sj <- semi_join(data1, data2, by = "x1")
sj

# Anti Join
aj <- anti_join(data1, data2, by = "x1")
aj



# load data 
data3 <- read.csv("data/join_example_03.csv")
data4 <- read.csv("data/join_example_04.csv")

# intersect 
intersect(data3, data4)

# union 
union(data3, data4)

# set difference 
setdiff(data3, data4)

data3
data4

# row binds
bind_rows(data3, data4)

# col binds 
bind_cols(data3, data4)


# dealing with missing data 
test<-c(0,NA, -1)

test/0

test <-test/0
test

# check missing data with `NA`
is.na(test)
sum(is.na(test))

# check missing value with "NaN"
is.nan(test)
sum(is.nan(test))

# check inf 
is.infinite(test)
sum(is.infinite(test))

# use any() 
A = c(1, 2, 4, NA)
B = c(1, 2, 3, 4)

# using any() 
any(is.na(A)) # are there any NAs - YES/TRUE

any(is.na(B)) # are there any NAs- NO/FALSE


# naniar to check missing data 
monkeypox <- read.csv("data/owid-monkeypox-data.csv")

# check missing data with any()
any(is.na(monkeypox))

# check mssinig data 
sum(is.na(monkeypox))

# calculate missing % 
pct_complete(monkeypox)

# import mental health data
mental_health <- read.csv("data/mental_health_survey.csv")

# check missing data with any()
any(is.na(mental_health))

# check mssinig data 
sum(is.na(mental_health))

# calculate missing % 
pct_complete(mental_health)

# built-in datasets 
data() 

# check missing data with any()
any(is.na(airquality))

# check mssinig data 
sum(is.na(airquality))

# calculate missing % 
pct_complete(airquality)

# visualization
gg_miss_var(airquality)


# issues with missing data 
sum(c(1,2,3,NA))
sum(c(1,2,3,NA), na.rm = T)


mean(c(2,4,NA))
mean(c(2,4,NA), na.rm = T)


median(c(1,2,3,NA))
median(c(1,2,3,NA), na.rm = T)


x = c(TRUE, TRUE, TRUE, TRUE, FALSE, NA)
sum(x)
# use na.rm 
sum(x, na.rm = TRUE)

# filter missing data 
airquality %>%
  select(Ozone) %>% 
  filter(is.na(Ozone))

sum(is.na(airquality))
dim(airquality)

new_data <- airquality %>% 
  drop_na()

dim(new_data)
sum(is.na(new_data))
pct_complete(new_data)

# columns with missing data 
miss_var_which(airquality)

# drop columns with missing data 
airquality %>% 
  select(miss_var_which(airquality)) %>% 
  head()

airquality %>% 
  select(!miss_var_which(airquality)) %>% 
  head()

# colmeans 
colMeans(airquality)

# remove if over 20% missing
airquality %>% 
  select(which(colMeans(is.na(airquality)) < 0.02))

pct_complete(airquality)

# change a value to be a NA 
airquality %>% 
  head(5)

new_data2 <- airquality %>% 
  mutate(Ozone = na_if(Ozone, 0))

new_data2 %>% 
  head(5)

library(skimr)
skim(airquality)

# impute missing data for single column
airquality %>% 
  mutate(Ozone = replace_na(Ozone,31)) %>% 
  head()

# impute missing data for multiple columns 
airquality %>% 
  mutate_at(vars(Ozone, Solar.R), ~ifelse(is.na(.x), mean(.x, na.rm = T), .x)) %>% 
  head()



# Recoding values 
diet_data <- read.csv("data/diet_data.csv")
head(diet_data)

diet_data %>% 
  count(Gender)

# recode 
diet_data %>% 
  mutate(Gender = recode(Gender, M = "Male", 
                         m = "Male", 
                         Man = "Male",
                         O = "Other",
                         f = "Female",
                         F = "Female")) %>%
  count(Gender)

diet_data %>% 
  mutate(Gender, case_when(Gender == "M" ~ "Male", 
                           Gender == "Man" ~ "Male", 
                           Gender == "m" ~ "Male")) %>% 
  count(Gender)

# I use 
diet_data %>% 
  mutate(Gender = case_when(
    Gender %in% c("M", "male", "Man", "m", "Male") ~ "Male",
    Gender %in% c("F", "Female", "f", "female")~ "Female",
    Gender %in% c("O", "Other") ~ "Other")) %>% 
  count(Gender)

# numeric to cat 
diet_data  %>% 
  mutate(Effect = case_when(Weight_change > 0 ~ "Increase",
                            Weight_change == 0 ~ "Same",
                            Weight_change < 0 ~ "Decrease"))

head(diet_data)


# working with strings 
library(stringr)
# str_detect 
x <- c("M", "male", "Man", "m", "Male", "F", "Female", "f", "female")
str_detect(string = x, pattern = "M")

# str_replace 
x <- c("M", "male", "Man", "m", "Male", "F", "Female", "f", "female")
str_replace(string = x, pattern = "F", replacement = "f")

# str_sub
x <- c("M", "male", "Man", "m", "Male", "F", "Female", "f", "female")
str_sub(string = x, start = 1, end = 2)
str_sub(string = x, start = 1, end = 3)

# filter 
diet_data %>% 
  filter(str_detect(string = Gender, pattern = "M"))

# case_when() improved with stringr
processed_df <- diet_data %>% 
  mutate(Gender = case_when(
    str_detect(string = Gender, pattern = "^m|^M") ~ "Male",
    str_detect(string = Gender, pattern = "^f|^F") ~ "Female",
    str_detect(string = Gender, pattern = "^o|^O") ~ "Other")) %>%
  count(Gender)

processed_df %>% 
  count(Gender)

write.csv(processed_df, file = "processed_df.csv")


