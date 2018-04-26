# 26/04/18
# Generate random school data in R for a tutorial 

####
# Psuedocode ----
# 1. Generate columns of data
# 2. Bind columns together 
# 3. Add new data based on existing data

####
# 1. Generate columns of data ----

library(tidyverse)
set.seed(101) # To make the random data generation consistently random

# Make columns 
age_aug_31 <- sample(c(4,5,6,7,8,9,10), size = 15000, replace = TRUE, prob = c(1/7,1/7,1/7,1/7,1/7,1/7,1/7))
gender <- sample(c("Male", "Female"), size = 15000, replace = TRUE, prob = c(0.5, 0.5))
ethnicity <- sample(c("White", "Black", "Mixed", "Asian", "Chinese"), size = 15000, replace = TRUE, prob = c(0.8, 0.05, 0.05, 0.05, 0.05))
language <- sample(c("English", "Polish", "Indian", "Bangladeshi", "French"), size = 1500, replace = TRUE, prob = c(0.8, 0.05, 0.05, 0.05, 0.05)) 
FSM <- sample(c(1,0), size = 15000, replace = TRUE, prob = c(0.15, 0.85))
SEN <- sample(c("N", "Y", "X", "C"), size = 15000, replace = TRUE, prob = c(0.8, 0.1, 0.5, 0.5)) # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
school <- sample(c("St.Josephs Roman Catholic", "No.2 school", "No.3 School", "School 4"), size = 15000, replace = TRUE, prob = c(0.25, 0.25, 0.25, 0.25))
name_of_head <- sample(c("Dave", "Mary"), size = 15000, replace = TRUE, prob = c(0.5, 0.5))
excluded <- sample(c(1,0), size = 15000, replace = TRUE, prob = c(0.04, 0.96))

####
# 2. Bind columns together ----

df <- as.data.frame(cbind(age_aug_31, gender, ethnicity, language, FSM, SEN, school, name_of_head, excluded))

####
# 3. Add new data based on existing data

df$age_aug_31 <- as.character(df$age_aug_31)
df$age_aug_31 <- as.numeric(df$age_aug_31)

df %>%
  mutate(NC_year = ifelse(age_aug_31 == 4, "Reception", 
                   ifelse(age_aug_31 == 5, "Year 1",
                   ifelse(age_aug_31 == 6, "Year 2",
                   ifelse(age_aug_31 == 7, "Year 3",
                   ifelse(age_aug_31 == 8, "Year 4",
                   ifelse(age_aug_31 == 9, "Year 5",
                   ifelse(age_aug_31 == 10, "Year 6","NA")))))))) -> df
