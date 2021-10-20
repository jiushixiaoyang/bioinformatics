m <- matrix(seq(from = 1, to = 6, by = 1), ncol = 3, nrow = 2)
m

m2 <- matrix(NA, ncol = 3, nrow = 4)
m2

#shape a vector into a matrix using the dim() function
b <- seq(from = 1, to = 6, by = 1)
#set the dimensions of the matrix (nrows and then ncolumns)
dim(b) <- c(2, 3)
b

#using 1:6 in the dimension of the matrix
d <- dim(matrix(1:6, ncol = 3, nrow = 2))
d

#make a matrix of 80 random numbers drawn from a normal distribution
#use matrix()
e <- matrix(rnorm(80, mean = 0, sd = 1), ncol = 4, nrow = 20)
e
#use dim()
e2 <- rnorm(80, 0, 1)
dim(e2) <- c(4, 20)
e2

mat_rep <- matrix(rep(1:3, each = 5), nrow = 3, ncol = 5, byrow = TRUE)
mat_rep

vec_seq <- 1:5
#multiple the matrices using element-wise multiplication
##It has multipled the 1st number in the vector with the 1st number in column one, the 2nd number in the vector by the 2nd number in column 1, etc…, and has then rolled over from bottom of column 1 to the top of column 2 and so on. 
mat_rep * vec_seq

mat_seq <- matrix(seq(from = 1, to = 20, length.out = 6), ncol = 3, nrow = 2)
mat_seq
vec_seq <- seq(from = 10, to = 4, length.out = 3)
vec_seq
###multiple the matrices using true matrix multiplication
mat_seq %*% vec_seq

## display the logical operator of this matrix for values greater than 10
mat_seq > 10
##return the values which are greater than 10
mat_seq[mat_seq > 10]

matrix(1:2, ncol = 1, nrow = 2)
#Transpose
t(matrix(1:2, ncol = 1, nrow = 2))
#Create matrix where diagonal is filled with x
diag(x <- 1:5, nrow = 3 ,ncol = 3 ,names = TRUE)
#Create matrix where diagonal is filled with x (put specific numbers into other places also)
a <- matrix(1:9, ncol = 3, nrow = 3)
diag(a) <- 100:102
a
#Return the diagonal of a matrix
diag(matrix(1:9, ncol = 3, nrow = 3))
#Calculate eigenvalues and eigenvectors	
eigen(matrix(1:9, ncol = 3, nrow = 3))
#Sums of the rows
rowSums(matrix(1:9, ncol = 3, nrow = 3))
#Sums of the columns
colSums(matrix(1:9, ncol = 3, nrow = 3))
#Means of the rows
rowMeans(matrix(1:9, ncol = 3, nrow = 3))
#Means of the columns
colMeans(matrix(1:9, ncol = 3, nrow = 3))

an_array <- array(runif(1:100), dim = c(2,4,5,3,2))
an_array

?rbinom()

##make a data frame with information on whether a Species was seen (1 = yes, 0 = no), on a particular Day:
our_data <- data.frame("Day" = rep(1:3, each = 3), 
                       "Species" = rep(letters[1:3], each = 3),
                       "Seen" = rbinom(n = 9, size = 1, prob = 0.5))

##look at the Day column
our_data

our_data$Day
our_data$"location" = "United Kindom"
our_data

name = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas')
score = c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19)
questions = c(1, 3, 2, 3, 2, 3, 1, 1, 2, 1)
qualify = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes')
df = data.frame(name, score, questions, qualify) 
str(df)
df$mean_score <- df$score/df$questions
df

##use the install packages function to install the package "devtools" which we will use in a moment. dependencies = TRUE tells R to install any other packages that devtools relies on which you haven't already installed (I would always suggest keeping dependencies = TRUE when you are installing packages)
install.packages("devtools", dependencies = TRUE)
##load the devtools package
library("devtools")

##install the "vroom" package
##The arguement for install_github takes the username and repository name where the package resides 
##if we look at the vroom url: https://github.com/r-lib/vroom
##you can see that we just use the bit after github.com/:
install_github("r-lib/vroom")

## tell R to use the "vroom()" function from the vroom package (see below)
vroom::vroom()

##make sure vroom is loaded into your R session (you only need to do this once)
library(vroom)
##read in the wader data set
wad_dat <- vroom("C:/Users/qj21146/Downloads/wader_data.csv")

##look at the top of the data
head(wad_dat)

##first we set the working directory (which is the location of the current file you are working on):
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

##then read in the data using vroom:
my_data <- vroom('../Workshop 3/time_series_covid19_deaths_global.csv')

##use vroom to read in some data from github:
covid_dat <- vroom("https://raw.githubusercontent.com/jiushixiaoyang/bioinformatics/main/Code/Workshop%203/time_series_covid19_deaths_global.csv")

##you can ignore this code for the moment if you want
##but to briefly summarise it is reading in some data included in base R
##and then splitting it into 3 differnt data.frame style objects based on the values in one of the columns ("cyl")
mt <- tibble::rownames_to_column(mtcars, "model")
purrr::iwalk(
  split(mt, mt$cyl),
  ##save this split files in to the default directory
  ~ vroom_write(.x, glue::glue("mtcars_{.y}.csv"), "\t")
)
##find files in the default directory which start with "mtcars" and end in "csv"
##save these file names as an object called "files"
files <- fs::dir_ls(glob = "mtcars*csv")
##these are then the names of the files matching the above arguments:
files
##then load these file names using vroom 
vroom(files)

##load in some RData(a file type)
load("my_data/pathway/my_data.RData")

vroom::vroom_write()
library(vroom_write)
##write out a .csv file
vroom_write(my_data,"C:/Users/qj21146/Desktop/the_name_of_my_data.csv")
?vroom_write()
###### why can't find function vroom_write?????
### finally it works!!!

##write out my data as an RData file:
save(my_data, file = "C:/Users/qj21146/Desktop/the_name_of_my_RData.RData")
######not work#####work now!!!
##write out my data as an RData file:
save(my_data, 
     my_vector, 
     my_list, 
     my_array,
     file = "a pathway/a data folder/the_name_of_my_RData.RData")


##install the tidyverse
install.packages("tidyverse")
##load the tidyverse
library("tidyverse")
##### can't see what guidance said in Global Environment


##what class is the object
class(covid_dat)
##look at the data
covid_dat
####### the data is different from that in the guidance!!!

##change the first two names of our data frame
names(covid_dat)[1:2] <- c("Province.State", "Country.Region")
covid_dat


##so this says take our data frame called covid_dat
covid_long <- covid_dat %>%
  ##and then apply this function 
  pivot_longer(cols = -c( Province.State, 
                          Country.Region, 
                          Lat, 
                          Long))
covid_long

##our data frame
covid_long <- covid_dat %>%
  ##and then apply this function 
  pivot_longer(cols = -c(Province.State:Long),
               names_to = "Date",
               values_to = "Deaths")
covid_long

##change long to wide
covid_long %>% 
  pivot_wider(names_from = Date,
              values_from = Deaths)
covid_lon#### why it's wide, I think it's still long???????