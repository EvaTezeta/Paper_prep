# Libraries
library(dplyr) # To use pipes/ recode composition code
library(readxl) # To import Excel files

# Load in data
SMASS <- read_excel("SMASS_Excel.xlsx")

SMASS_table <- table(SMASS$CoD)
SMASS_table
