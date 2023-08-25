# string value using single quotes
'Hello' 

# string value using double quotes 
"Hello" 

# Find Length of String
message1 <- "CHIRAL Bangladesh"
# use of nchar() to find length of message1 
nchar(message1)

# Join Strings Together
message1 <- "CHIRAL"
message2 <- "Bangladesh"

# use paste() to join two strings
paste(message1, message2)


# Compare Two Strings in R Programming
message1 <- "Hello, World!"
message2 <- "Hi, Bangladesh!"
message3 <- "Hello, CHIRAL!"

# `message1 == message2` - returns FALSE because two strings are not equal
message1 == message2

#`message1 == message3` - returns TRUE because both strings are equal 
message1 == message3

# Change Case of R String
message <- "R Programming"

# change string to uppercase
message_upper <- toupper(message)
message_upper

# change string to lowercase
message_lower <- tolower(message)
message_lower


# Numeric vector
numeric_vector <- c(1, 2, 3, 4, 5)
numeric_vector
typeof(numeric_vector)

# Character vector
character_vector <- c("apple", "banana", "orange")
character_vector
typeof(character_vector)

# Logical vector
logical_vector <- c(TRUE, FALSE, TRUE)
logical_vector
typeof(logical_vector)

# Numeric sequence vector
numeric_sequence <- 1:10
numeric_sequence

# Numeric sequence vector using seq()
numeric_sequence <- seq(from = 1, to = 10, by = 2)
numeric_sequence

# Repeated values vector using rep()
repeated_values <- rep(0, times = 5)
repeated_values

# Index sequence vector using seq_len()
index_sequence <- seq_len(10)
index_sequence

# Vector created using vectorized operation
numeric_vector <- c(1, 2, 3, 4, 5)
new_vector <- numeric_vector * 2
new_vector

# Character 
x <- c(1.7, "a")
x
# Numeric 
y <- c(TRUE, 2)
y
# Character 
z <- c("a", TRUE)
z

# Creating Matrix

# Create a matrix using matrix function 
mat1 <- matrix(1:9, nrow = 3, ncol = 3) 
mat1


# Create a matrix using matrix function: only one dimension  
mat2 <- matrix(1:9, nrow = 3)
mat2



# Create a matrix using matrix function: filling by row-wise 
mat3 <- matrix(1:9, nrow = 3, byrow = TRUE)
mat3


# Create a matrix using matrix function: dimension names 
mat4 <- matrix(1:9, nrow = 3, dimnames = list(c("X", "Y", "Z"), 
                                              c("A","B","C")))
mat4

# Matrix Properties
# Create a matrix using matrix function 
mat <- matrix(1:9, nrow = 3, dimnames = list(c("X", "Y", "Z"), 
                                        c("A","B","C")))
mat

# dimension 
dim(mat)

# Column Names 
colnames(mat) 

# Row Names 
rownames(mat)

# Create a list 
L = list(1, "a", TRUE, 1+3i)
typeof(L)

# Create a list with different elements
my_list <- list(
  name = "John Doe",  # Character value
  age = 30,  # Numeric value
  is_student = TRUE,  # Logical value
  scores = c(90, 85, 92),  # Numeric vector
  matrix_data = matrix(1:6, nrow = 2),  # Matrix
  sub_list = list("a", "b", "c")  # Nested list
)
my_list


# Create a factor using factor() function 
f <- factor(c("yes", "no", "yes", "no"))

class(f)

# Check levels 
levels(f)

# Create a data frame
df <- data.frame(
  name = c("John", "Alice", "Bob"),
  age = c(25, 30, 35),
  gender = factor(c("male", "female", "male")), 
  city = c("New York", "London", "Paris")
)
df 

# exploring data frame 
str(df)
summary(df) 

# Convert numeric values to character strings
numbers <- c(1, 2, 3)
character_numbers <- as.character(numbers)
character_numbers

# subsetting 
numeric_vector <- c(11, 22, 33, 44, 55)
numeric_vector[3]
numeric_vector[numeric_vector > 30]
numeric_vector[c(1, 3, 5)]
numeric_vector[2:5]
name = c("John", "Alice", "Bob")
name[2]

my_list <- list("apple", "banana", "orange")
my_list
my_list[[2]]


my_list <- list(fruit1 = "apple", fruit2 = "banana", fruit3 = "orange")
my_list$fruit3


matrix <- matrix(1:6, nrow = 2)
matrix
matrix[1, ]
matrix[, 1]
matrix[1, 2]
matrix[1, 1]

x <- 0 
if (x > 0) {
  # do something - if block 
  print("positive")
} else if (x < 0){
  # do something - else if block 
  print("negative")
} else {
  # do something - else block 
  print("zero")
}

x <- 10 
if (x > 0) {
  print("positive")
} else {
  print("negative")
}

# ifelse function 
ifelse(x > 0, "positive", "negative")

# handling missing values 
x <- c(1, 2, NA, 4, 5)
is.na(x) 
na.omit(x) 
sum(is.na(x))

ifelse(is.na(x), "missing", ifelse(x > 3, "greater", "smaller"))

df <- data.frame(Name = c("John", "Alice", "Emily"), Age = c(25, 30, 35))
df$Age

df$age_cat <- ifelse(df$Age > 30, "senior", "junior")
df

df$age2 <- df$Age * 2
df

# loop - for loop 
for (i in 1:10) {
  # do something 
  print(i)
}

for (i in 10:1) {
  # do something 
  print(i)
}

x <- c(11, 22, 33, 44)
for (i in x) {
  # do something 
  print(i)
}


for (i in 1:20) {
  # do 
  if (i %% 2 == 0) {
    print(i)
  }
}


for (i in 1:20) {
  # do 
  if (i %% 2 != 0) {
    print(i)
  }
}

i = 1  
while (i <= 10) {
  # do 
  if (i %% 2 == 0) {
    print(i)
  }
  i <- i + 1
}


for (i in 1:20) {
  print(i) 
  if (i == 5) {
    break 
  }
}

for (i in 1:20) {
  print(i) 
  if (i == 5) {
    next 
  }
}

i <- 1
repeat {
  print(i)
  i <- i + 1
  if (i > 5) {
    break
  }
}


x <- c(10, 11, 9, 4, 5, 6)

# built-in functions 
sum(x)
mean(x)
min(x)
max(x)
sqrt(x)
sin(x)
log(x)
length(x)
cos(x)

factorial(5)


# create function 
f <- function(parameters) {
  # function body ~ operations 
}

f() 


# add two numbers 
add <- function(num1, num2) {
  # operations 
  result <- num1 + num2
  return(result)
}

class(add)

add(12, 12)

# default parameters 
subs <- function(x = 10, y) {
  result <- x - y 
  return(result)
}
subs(9, 7)


calculate_sum <- function(...) {
  numbers <- unlist(list(...)) 
  total <- sum(numbers)
  return(total)
}

result <- calculate_sum(1, 2, 3, 4, 5)
print(result)  

as.character()
as.numeric()
as.factor()



# Create date 
date <- as.Date("2023-07-05")
class(date)

datetime <- as.POSIXct("2023-07-05 10:30:00")
class(datetime)


formatted_date <- format(date, format = "%Y/%m/%d")
formatted_date

parsed_datetime <- strptime("2023-07-05 10:30:00", format = "%Y-%m-%d %H:%M:%S")
parsed_datetime

parsed_datetime$hour
parsed_datetime$min
parsed_datetime$sec

next_day <- date + 2
next_day




# loop functions 

# Apply sum function to rows of a matrix
mat <- matrix(1:9, nrow = 3)
mat

result <- apply(mat, 1, mean) 
result



# Apply sqrt function to each element of a list
numbers <- list(a = 4, b = 9, c = 16)
numbers

result <- lapply(numbers, sqrt)
result

seq <- c(11, 22, 33)
lapply(seq, sqrt)


# Apply sum function to each element of a list and simplify the result
numbers <- list(a = 4, b = 9, c = 16)
numbers


result <- sapply(numbers, sqrt)
result


runif(5)
runif(50, 1, 10)

sample(1:100, 10)
# Generate a random sample of 4 elements from a vector
vector <- c("A", "B", "C", "D", "E")
random_sample <- sample(vector, 4)
random_sample


x <- rnorm(10, mean = 0, sd = 1)
hist(x)

# Set a seed value for reproducibility
set.seed(123)

# string value using single quotes
'Hello' 




