# Libraries
library(dplyr) # To use pipes/ recode composition code
library(readxl) # To import Excel files

# Load in data
CSIP <- read_excel("CSIP_Excel.xlsx")

CSIP_table <- table(CSIP$CoD)
CSIP_table
