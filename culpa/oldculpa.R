library(tidyverse)
library(ggplot2)

review <- read.csv("/Users/alisonchiu/Graphics/culpa/review.csv", header = FALSE)
department <- read.csv("/Users/alisonchiu/Graphics/culpa/department.csv", header = FALSE)
professor <- read.csv("/Users/alisonchiu/Graphics/culpa/professor.csv", header = FALSE)

colnames(review) <- c("review_id", "professor_id", "class_review", "ip_address", "workload", "rating", "timestamp")
colnames(department) <- c("department_id", "department", "dept_abbrev")
colnames(professor) <- c("professor_id", "first_name", "last_name", "uni", "approved", "culpa_nuggets_rating")

review <- merge(review, professor, by = "professor_id")

ggplot(review, aes(x = rating)) +
  geom_bar() +
  labs(title = "Distribution of Ratings", x = "Rating", y = "Count")

review <- review %>%
  separate(col=timestamp, into=c("year","dateandtime"), sep="-") %>%
  group_by(year) %>%
  summarize(avg = sum(ratings)/n)
