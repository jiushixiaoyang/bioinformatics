#create a vector of 100 random numbers between 0 and 50
vec_one <- c(runif(n = 100, min = 0, max = 50))
#look at the vector
vec_one

#show the help file of sort()
?sort()
#sort these by order of their value(from largest to smallest)
sort(x = vec_one, decreasing = TRUE)

#show the help file of log()
?log()
#create a function
function_one <- function(x){
  #subtract log10(x) from x
  x_log <- x - log10(x)
  #return the new vector
  return(x_log)
}
#run the function on vector_one
new_value <- function_one(x = vec_one)
#calculate mean of random numbers in vector_one
mean(x = new_value)
#calculate standard deviation of random numbers in vector_one
sd(x = new_value)
#calculate standard error of random numbers in vector_one
se(x = new_value)
#create a vector of these with names
vec_two <- c("mean" = mean(x = new_value), "sd" = sd(x = new_value), "se" = se(x = new_value))
#look at vector_two
vec_two

#create vector of a sequence number from 15 to 100
vec_three <- 15:100
#look at the vector
vec_three
#calculate mean of numbers >20 and <60
mean(x = vec_three[vec_three > 20 & vec_three < 60])
#calculate sum of numbers > 48
sum(x = vec_three[vec_three > 48])

#create a function returning the minimum and maximum values of a vector
function_two <- function(x){
  minimum_maximum = c(sort(x)[1], sort(x, decreasing = TRUE)[1])
  return(minimum_maximum )
}
#verify the function 
function_two(0:10)