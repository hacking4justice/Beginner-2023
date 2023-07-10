## File: H4J_1_1July23_Student.R
## Course: Day 1, Morning Session
## Author: Kyla Bourne, kbourne@berkeley.edu
## Date: July 15 2023

#### Understanding the Building Blocks of R ####

# Before we tackle the actual data, we will practice some fundamental R skills

# To do this, we will build our own dataset to get you comfortable with:

# 1: RStudio, Variables and Data types
# 2: Vectors and Data Frames
# 3: Operators, Conditional Statements and Loops
# 4: Basic Data Frame Manipulation, Tables and Plots


#### Using RStudio: Editor, Console, Environment, Variables and Data Types  ####

# This script is in the Editor window. You should type and save all your answers here. 
# When you hit the 'Run' button, every line of code is interpreted and executed by R.
# The output of your R code is shown in the console below.
# Notice that the '#' sign adds comments to help you and others understand your code!
# Comments are not run as R code. Try it out with a simple calculation like three plus four



# You can also execute R commands straight in the console!
# For example, try using the following arithmetic operators in the console
# + (add), - (subtract), * (multiply), / (divide), ^ (exponent)


# The upper right Environment window displays variable objects
# Variables store values (e.g. 4) or objects (e.g. a function) in R for easy repeated use 
# Use <- to assign variables x to the value of 3 and y to the value of 4



# The output did not appear in the console this time. Why not?
# Use the print() function with x between the parentheses 
# Just type x in console


# note: the print() function is not necessary here, but can be useful in more complex code

# Create a new object called var_1 by adding x and y
# Print the value of var_1 to the console


### Data Types ###

# Integers and numeric are numbers 
# Characters are text (aka string) values: set with quotation marks
# Logical values (aka Boolean) can be TRUE or FALSE
# Factors create labels or "bucket" categories 

# What kind of data type is var_1? 
# Try running the class() function: class(variable_name)


# You can also try running is.numeric(variable_name)


# What type of data is the output of is.numeric()? How would you check?


# Create character var_2 using your first name
# R recognizes any text stringas a character when it is inside quotation marks


# Change x and y to character vectors


# Try to add x and y again. What does the error message mean?


# reset x and y to numeric using as.numeric()


# Let's start applying what we've learned!


#### CLUE narrative ####

# Imagine the following scenario:

# There was a incident at a mansion that lead to the death of Mr. Bobby
# After investigation, the CCSAO filed various charges on six defendants:

# Mr. Green (M, 45, White) is charged with murder (Class M) using a knife in the kitchen. 
# Miss Scarlet (F, 23, Latina) is charged with two counts of aggrevated battery, police officer (Class 3) for resisting arrest in the library.
# Colonel Mustard (M, 60, Black) is charged with the unlawful use of a weapon (Class 4) for carrying a revolver in the ballroom. 
# Mrs. Peacock (F, 35, Asian) is charged with the possession of a controlled susbtance (Class 4) for carrying poison in the lounge.
# Mrs. White (F, 78, Black) is charged with two counts of theft (Class 4) for two stolen candlesticks found in the dining room. 
# Prof. Plum (M, Age Unknown, White) is charged murder (Class M) using a lead pipe in the kitchen. He is Mr. Green's co-defendant.

# The following were the results of the charges:

# Mr. Green is found guilty of murder at trial and sentenced to life in prison. 
# Miss Scarlet pleaded guilty for three years probation on the first charge in exchange for the second charge being dropped "nolle prosequi"
# Colonel Mustard pleaded guilty and is given 2 years in prison.
# Mrs. Peacock pleaded guilty and is offered 2 years probation.
# Mrs. White dies soon after both charges are filed, resulting in a "Cause Abated" outcome.
# Prof. Plum is found not guilty at trial. 


# We will use this narrative to build 3 data tables 

# The first represents DEFENDANT information. We will build this together as a class.

# The second and third you will build in your groups.
# The second represents INITIATION (aka charge)
# This opens a formal case via grand jury indictment or through a finding of probable cause by a judge

# The third represents DISPOSITON and SENTENCE
# How are charges resolved e.g. plea of guilty, not guilty at trial, dropped etc?
# Is the defendant is guilty of one or more charges? 
# If the defendant is guilty, what is the punishment?

# For more detail, refer to https://www.cookcountystatesattorney.org/resources/how-read-data

#### Create basic vectors and data frames ####

# Vectors are one-dimensional arrays that store numeric, character, or logical data
# Let's build vectors that organize different types of information from the CLUE narrative

# Vectors are created with the combine function c() (aka collect or concatenate)
# Place the vector elements separated by a comma between the parentheses

# Make three vectors for defendant name, race and gender


# Wait! Race and gender have a limited number of category values or 'buckets'
# Let's reclassify these variables as factors
# coerce using the var_name <- factor(var_name) function
# use the levels() function to see the category buckets


# Defendant Age: Integer
# But we don't know how old Prof. Plum is!
# Always use NA when data are missing because R will be able to recognize that the value is unknown
# the function is.na() will return a logical vector for whether the value is missing


# Note: other common ways to deal with missing data include using 0, 99,"NULL" or removing the row entirely
# Discuss: why is using NA the best way to represent missing data in R versus other options?
# Hint: Think about how the other approaches may lead to inaccuracies if you wanted to calculate mean age
# This will be elaborated more later on, but missing data are always a big issue!

# create Defendant ID (note colon operator)

# But want to make sure to never forget that these represent labels, not quantities!
# so 'coerce' the numeric vector into a factor data type that 'labels' data in arbitrary buckets


# You can always select certain elements from a vector by index using square brackets []
# Try printing only the first, third and fifth defendant names


# Don't forget you can also use the c() function!


# Create a new vector from the first five defendant names
# Hint: there are three ways to do this. Remember the minus and colon operators! 



# Now, let's create a basic defendant data frame using the data.frame() function
# A data frame has the variables of a dataset as columns and the observations as rows


# Note that columns are named after each vector
# Build a col_names vector removing the "vec_" and use the names() function to rename columns


# you can summarize a dataframe using the str() function
# this is especially important for larger dataframes that are too big to view in the console


## EXERCISE: CREATE TWO ADDITIONAL DATA FRAMES ##

# Using the skills you learned above, create two new data frames
# The first should store information about charging (aka initiation)
# The second should store information about disposition (charge outcome) and sentencing (punishment if guilty)

# Hint: Always remember the defendant-level row ID. It may need to duplicate if there are multiple charges!
# In this assignment, we care primarily about defendants, so they are the only category that needs an ID variable

# First, create a data frame that represents all the filed charges, cases and what we know about them
# Ask: what type of data does each vector represent?

# Bonus points: try making class an ordered factor e.g. High > Medium > Low categories
# To learn the additional arguments needed to make ordered factors, type ?factor() in the console
# We saw unordered (aka nominal) factors above, where there is no inherent hierarchy between categories
# In Illinois sentencing law  Class is ordered from Murders to Misdemeanors
# Class order: M > X > 1 > 2 > 3 > 4 > A > B > C

# More bonus points! Try nesting the c() within the rep() function to repeat
# To learn how rep() works, type ?rep() in the console


# Be sure to change the names of the columns and check the dataframe structure



# Next, create a data frame that represents all the sentencing results

# HINT: you can re-use the ID variable for defendants from the charge table! 


#### Relational Operators, Conditional Statements and Loops ####

# Broadly there are four types of operators:
# Arithmetic (+, -, /, *) and Assignment (<-) -- we saw these already!
# Let's add Relational and Logical operators

# R uses Relational operators to compare the relationship between two objects: 
# These are extremely useful:
# equals (==); be careful to use two equals signs (one equal sign acts like the <- assignment operator)
# not equal to (!=)
# greater than (>), greater than or equal to (>=)
# less than (<), less than or equal to (<=)

# Let's practice! Notice the logical variables we created above for Trial and Plea. 
# vec_trial is true if the defendant had a trial on the charge, and false otherwise. 
# vec_plea is true if the defendant plead guilty on the charge, and false otherwise.
# Can you use Relational operators to determine which charges were resolved neither through a plea nor through a trial?

# Hint: Here assume trials and pleas are mutually exclusive i.e. they cannot both be true


# Use the Relational operators to test if any defendant is older than 65


# Finally, there are three Logical operators: AND (&), OR (|), NOT (!) 
# Learn how they work by comparing vec_trial and vec_plea like above



# Operators are most often used in two settings:
# Conditional Statements: IF, IF ELSE, ELSE (and CASE SWITCH)
# WHILE and FOR loops

# IF statement asks if a given condition is true. If the condition is true, then it executes a set of statements
# If the condition is not true, then it ignores the statements

# Syntax: if (condition) {
#	\\statement 1
#}

# Create a simple if statement that prints "Three equals three" when x = 3


# If you want to add additional conditions, use ELSE IF. If the first condition is false, the second condition will be checked in sequence

# Syntax: if (condition 1) {
#	\\statement 1
#} else if (condition 2) {
#	\\statement 2
#}

# Create a simple else if statement that prints "Three is greater than four" if x is greater than y
# and else if "Three equals three" when x = 3


# Syntax: if (condition 1) {
#	\\statement 1
#} else if (condition 2)
#{
#	\\statement 2
#} else
#{
#	\\statement 3
#}

# But what if all the conditions are false? 
# Then the ELSE condition can return a statement if no other conditions are met
# create a simple if statement that prints "Three is greater than four" if x is greater than y
# and else if "Four is greater than seven" when y > var_1
# or else print "Three equals three"


## WHILE loop ##

# The while loop is similar to an if statement: it executes the internal code if the condition is true
# unlike the if statement, the while loop will continue indefinitely if the condition is true


# Syntax: while (condition 1) {
#	\\statement 1
#} else if (condition 2)
#{
#	\\statement 2
#} else
#{
#	\\statement 3
#}

# while (condition) {
# \\ statement 1
# \\ new value 
# }

# create a while loop that prints "Still not zero" and subtracts 1 from var_1 
# until var_1 is no longer greater than zero

# Why are there 7 lines of output before the while loop ends?

### FOR loop ###

# The for loop recipe is: for each variable in sequence, run expression

# for(variable in sequence){
# \\ expression  
# }

# create a simple for loop that prints every variable in vec_race

# for loops become especially powerful when they are combined with conditional statements

# create a for loop that prints "Defendant is white" when accurate  and "Defendant is not white" otherwise 



# the ifelse() function is a useful shortcut here
# the function tests a logical condition in its first argument. 
# If the test is TRUE, ifelse() returns the second argument
# If the test is FALSE, ifelse() returns the third argument.

# Syntax: ifelse(expression, true statement, false statement)

# Use ifelse() with relational and logical operators 

## Use ifelse to Quickly check how many of the defendants are white men ##




#### Basic Data Frame Manipulation, Tables and Plots ####

# We made three separate data frames: one for defendants, one for charges, and one for sentencing results
# print the structure of each 


# Each of the 6 rows in the defendant table represents a single person along with their attributes
# Each of the 8 rows in the charge/result tables represents a single charge

# We know only Ms. White (id = 5) is older than 65. How old is she exactly, though?

# Look at one defendant (one row) and their age (value in one column) 
# Index using square brackets like vectors
# Use a comma to indicate what to select from the rows and the columns respectively.
# syntax: dataframe[row_number, col_number]


# Select the race and age of the first three defendants using indexing


# You can also use the column name to select values
# This prevents easy-to-make (and hard-to-debug) errors re: column number

# Select Ms. White's age and race
# Hint: remember the c() function!


# After further investigation, the SAO has learned Prof. Plum (id = 6) is 39
# Use this approach to fill in Prof. Plum's NA age value

# First, check that Prof. Plum's age value is NA using is.na()

# then set Prof. Plum's age to 39

# another way to select column vectors is using the $ operator: dataframe$col_name
# use both the [] and $ approach to see just the race column


# use both approaches and a logical operator to see the defendants who not white


# Joining tables
# Note that the charge and result tables have equivalent rows, 
# This means you can use the cbind() function to pair each charge with its outcome
# syntax: new_dataframe <- cbind(dataframe_1, dataframe_2)


# note that the ID variable has  been duplicated because cbind() is just appending columns
# the equivalent function for rows is rbind()

# remove the id row using $, varname and the NULL command


# how is this result different than using $? Why?
# be careful with this method, as the sequential positions change when you make deletions


# To combine the new charge/result table with the defendant table, we must use the merge( ) function, 
# Why can't we use cbind() here?

# Syntax: merge(dataframe_1, dataframe_2, by = "col_name")



# We included a common ID label throughout. This will help you merge the separate dataframes together
# Keep your eyes peeled for ID variables in the SAO datasets

### Tbles and Plots ###

# Play with the plot() and table() functions to see what you can learn from the data!

# e.g. use the table() function to see a count of defendants by their race



# use the table() function to see a count of defendants who are not white



# Try these examples and explain what they are showing you

table(df_clue$name)

table(df_clue$name, df_clue$type)

table(df_clue$evidence, df_clue$location)


# Should you use df_clue or df_defendant to get average defendant age using the mean() function, and why?

plot(df_defendant$gender, df_defendant$age)

# After lunch we'll use these tools on a real CCSAO dataset!

