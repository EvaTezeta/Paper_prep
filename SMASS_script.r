# Libraries
library(dplyr) # To use pipes/ recode composition code
library(readxl) # To import Excel files
library(ggplot2)

# Load in data
SMASS <- read_excel("SMASS_Excel.xlsx")

SMASS_table <- table(SMASS$CoD)
SMASS_table

# View(SMASS)

SMASS$`Dorsal Blubber mm` <- as.numeric(SMASS$`Dorsal Blubber mm`)
SMASS$`Ventral Blubber mm` <- as.numeric(SMASS$`Ventral Blubber mm`)
SMASS$`Lateral Blubber mm` <- as.numeric(SMASS$`Lateral Blubber mm`)

# Create a new variable for the average of blubber thickness
SMASS$Blubber_Average <- rowMeans(SMASS[, c("Dorsal Blubber mm", "Lateral Blubber mm", "Ventral Blubber mm")], na.rm = TRUE)


# Filter data for cases with "Starvation" as the cause of death
starvation_data <- subset(SMASS, `Cause of Death Category` %in% c("Starvation", "Starvation/Hypothermia"))


# Clustering
dorsal_blubber_values <- as.numeric(starvation_data$Blubber_Average)
kmeans_result <- kmeans(dorsal_blubber_values, centers = 2)

# Add cluster information to the dataframe
starvation_data$cluster <- as.factor(kmeans_result$cluster)


# Count cases in each cluster
cluster_counts <- table(starvation_data$cluster)
print(cluster_counts)

# Visualize clustered data with a scatterplot
ggplot(starvation_data, aes(x = Blubber_Average, y = cluster, color = cluster)) +
    geom_point() +
    labs(
        title = "Scatterplot of Average Blubber Thickness for Starvation Cases",
        x = "Average Blubber Thickness (mm)",
        y = "Cluster",
        color = "Cluster"
    )
