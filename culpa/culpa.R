library(tidyverse)
library(tidytext)
library(ggplot2)
setwd("/Users/alisonchiu/Graphics/culpa")

packages <- c("wordcloud", "tm")
lapply(packages, require , character.only = TRUE)

library(wordcloud)
library(tm)
library(udpipe)


course <- read.csv('course.csv', header = F)
dept_prof <- read.csv('department_professor.csv', header = F)
dept <- read.csv('department.csv', header = F)
prof_overview <- read.csv('professor_overview.csv', header = F)
prof <- read.csv('professor.csv', header = F)
review <- read.csv('review.csv', header = F)
vote <- read.csv('vote.csv', header = F)

review_words <- data_frame(review$V3)
review_words <- review_words %>%
  rename('reviews' = 'review$V3')
review_words <- review_words %>% 
  unnest_tokens(output = word, input = reviews)

review_words <- review_words %>%
  anti_join(stop_words)

review_wordcount <- review_words %>%
  count(word, sort = TRUE)

head(review_wordcount)

combined_review <- paste(review_words, collapse = " ")

parts_of_speech(review_words, combined_review) %>%
  filter(pos %in% c("Adjective", "Adjective, comparative", "Adjective, superlative"))
