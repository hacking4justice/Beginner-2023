## File: H4J_1_2July23_Teacher.R
## Course: Day 1, Afternoon Session
## Author: Kyla Bourne, kbourne@berkeley.edu
## Date: July 15 2023

####### Exploring CCSAO Sentencing Dataset ########

# Now we'll apply the skills from the morning with real data!

# In this session, you'll learn about:

# 1: Importing existing datasets
# 2: R Packages and CRAN
# 3: Wrangling a complex dataset 
# 4: Dig deeper and get curious!


#### IMPORT CCSAO DATA ####

# Be sure the CCSAO data is saved in your working directory!

getwd() # to check your working directory

# to set or change your working directory use for example 
# setwd("~/Documents/H4J_2023")

# .csv ia a 'comma separated value' file and is a common way of storing and opening spreadsheet-style data
# versus, e.g. .xlsx files which are tied to the Excel program, so less flexible

# from the built-in utils package, use the read.csv() function 
# Find the syntax to open the file using the ?read.csv command

?read.csv

df_sent <- read.csv("Sentencing.csv", header = TRUE) # What does 'header = TRUE' do?

# if it worked, a new data frame will appear in your environment after several seconds


#### PACKAGES ####

# R Packages are pre-written code that adds new functions 

# R Packages can be either included with R already (base) or are created by third-parties

# Base packages are already installed and just need to be loaded from your library
# To do this, use the library() function

# Third-party packages need to be downloaded from CRAN and installed to your hard-drive first
# For these, begin with install.packages() function, then use library()
# CRAN stands for the "Comprehensive R Archive Network" 
# www.cran.r-project.org (Packages, Task View)

# Let's try installing the 'psych' package

install.packages("psych")
library(psych)

# To learn more about any package with documentation, vignettes and fuctions, type ?'package'

?psych

# We will be using the functions describe and describeBy in psych
?describe
?describeBy

# NOTE: You can always also google the package documentation or vignettes!

# HINT: Unless you are updating the package version, you don't need to reinstall to your hard-drive
# But in each new session, you will need to re-load packages to make them available to your current routines

# HINT: To manage the CCSAO data frames, you might explore the 'data.table' or 'dplyr' packages
# To create beautiful graphics, you can use 'ggplot2'




#### Data wrangling ####

# After uploading the CCSAO data, try the following summary functions

# data type: class()
# number of rows: nrow()
# number of columns: ncol()
# column names: names()

# set col names to lower to avoid typos uisng tolower() and names()

# first 6 rows: head()
# first 16 rows: run ?head() to see how to change default
# last 6 rows

# with a dataframe this big, use summary() instead of str()



## EXERCISE: FIRST STEPS ##

# What does each row represent? Here, think back to your CLUE dataframe.

# What does each column represent? What type of data is each column (e.g. factor, interger, numeric, logical)?

# Are there columns we are certain to not need? 
# Of course, this depends on our question!
# Let's drop statute, judge,incident and arrest details for now 
# (you can explore these tomorrow if you want!) 

# HINT: Be careful when deleting id columns: here case_id, charge_id and case_participant_id
# create a vector of variable names that we want to keep


# Split df_sent table into two new data frames: defendant and plea bargaining (reverse of CLUE task)

# HINT: This will make row counts more intuitive for defendants. Why?
# Be sure to keep case_participant_id: why?


### Defendant df ###

# Choose columns relevant to defendants and name vector def_vars
# Subset df_sent to def_vars and save as sub_def

# use the duplicated() function to check if case participants in the dataframe are duplicated 


# Why are there 38866 duplicated case participant ids in the defendant subset data frame?
# remove duplicated rows using the NOT operator !

# Let's look at defendant race and gender using table() and age using the psych package describe()
# What sort of data cleaning is needed?

# Roughly, what percent of defendants are Black?
# First, make a dummy or indicator variable, or numerical versions of logical variables
# if the defendant is Black, then the value is one, otherwise it is zero

# HINT: use functions sum() and nrow, divison and multiplication


### Plea bargaining df ###

# Look at the CCSAO data codebook: what is 'charge_disposition'?
# What values of 'charge_disposition' might we be most interested in?
# Again, it depends on our research question!
# Here, Let's ask what percent of guilty outcomes come from plea bargaining versus trial

# choose columns relevant to plea bargaining and assign to plea_vars vector
# Subset df_sent to def_vars and create sub_def dataframe


# Why might we want to narrow sub_sent to rows where primary_charge_flag == "true"?
# NOTE: check the class of primary_charge_flag
# primary_charge_flag is "true/false" (character), not TRUE/FALSE (logical) data type!


# the subset() function allows for row selection conditional on a column value
# syntax: new_dataframe <- subset(old_dataframe, selection condition)


# Which values of charge_disposition can help us answer our research question?
# subset to those values
# note how useful operators are here

# make a guilty plea dummy variable like above

# what percent of guilty outcomes are the result of plea bargains?


#### DIG DEEPER ####

## EXERCISES: EXPLORE THE DATA ##

# Question: what are the top five most common charged offenses?
# create frequency dataframe

# sort charges into descending frequency using with() and order()

# plot top 5 most common charges

#### DIG DEEPER ####

## EXERCISES: EXPLORE THE DATA ##

# Question: what are the top five most common charged offenses?
# create frequency dataframe using data.frame() and table()

# sort charges into descending frequency using with() and order()

# plot top 5 most common charges
# create sub_top5_offense dataframe with head()

vec_names <- c("Drugs", "UUW", "DUI", "Retail Theft", "Burglary")

barplot(sub_top5_offense$Freq, # barplot is useful for categorical variables like charge.
	main = "Most Common Offenses",
	names.arg = vec_names, ylab = "Frequency")  #Note here how to add labels!


# Can you identify problematic data values (e.g. rare, missing, or nonsensical) using familiar functions?

# you might need to coerce the column into a different type, remove or change values, or make vectors, etc, to help

# e.g. age using class(), table(), is.na(), and describe()
class(sub_def$age_at_incident)

table(is.na(sub_def$age_at_incident)) # 3325 NA values 

describe(sub_def$age_at_incident) # max is 137 years old?

# How might you deal with impossibly old ages?


#  Use describe() and describeBy() to explore descriptive statistics and interesting relationships between variables

# e.g. look at prison length by plea/trial
# create vars_plea_prison by adding commitment_type, commitment_unit and commitment_term to plea_vars vector

# subset df_sent by vars_plea_prison

# subset to primary charge, only guilty outcomes, and only prison with unit as years

# what data type is commitment_term? what type should it be to use describe()?

# now the prison term can be described using basic measures of central tendency (mean, median) and variability (min, max, standard deviation) 


# it can be informative to group these measures according to a variable of interest 
# e.g. whether the defendant pleaded guilty using describeBy()

# syntax: describeBy(quant variable, grouping variable)

# HINT: Practice for tomorrow's discussion of theory and hypothesis building. 

# Do you expect prison length to be on average LONGER or SHORTER for defendants who plead guilty? Why?




# Dose the evidence from running describeBy() support your initial hypothesis? 

# NOTE: this is a fast and rough way to deal with data inconsistencies
# What is the problem with this approach using this sort of "messy" data?
# What about missing, inconsistent or impossible values? (e.g. Max, min values)
# How else might you check?

