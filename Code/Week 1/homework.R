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

#make some changes