# Datacamp link
# https://www.datacamp.com/datalab/w/2a059e9d-7b5e-438a-b999-6cda8a34c786/edit 

# Load necessary packages
library(readr)
library(dplyr)
library(ggplot2)

# Load the dataset
data <- read_csv("stack_overflow_data.csv")

# Create a new data frame with a 'percentage' column
data_percentage <- data %>%
  mutate(percentage = (num_questions / year_total) * 100)


# filter for R tags
r_over_time <- data_percentage %>%
  filter(tag == "r")

ggplot(r_over_time) +
    geom_line(aes(x = year, y = percentage))

# Find total number of questions for each tag in the period 2015-2020
r_2020 <- r_over_time %>%
  filter(year == "2020")
print(r_2020)

highest_tags <- data %>%
  filter(year >= 2015) %>% 
  group_by(tag) %>% 
  summarize(tag_total = sum(num_questions)) %>% 
  arrange(desc(tag_total)) %>%
  slice_head(n = 5)

