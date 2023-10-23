# Libraries
library(dplyr) # To use pipes/ recode composition code
library(readxl) # To import Excel files

# Load in data
UU <- read_excel("UU_Excel.xlsx")

UU_table <- table(UU$CoD)
UU_table

# Compare 
