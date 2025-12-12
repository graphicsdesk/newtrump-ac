library(tidyverse)
library(ggplot2)

data <- read.csv("/Users/alisonchiu/Graphics/training/data.csv")
View(data)
colnames(data)

class <- data$class_year
print(class)

grouped_data <- data %>%
  group_by(class_year) %>%
  summarise(count = n())

data.frame

ggplot(grouped_data, aes(x = class_year , y = count)) + 
  geom_bar(stat = "identity")
  