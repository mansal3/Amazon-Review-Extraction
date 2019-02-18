library(rJava)
library(tm)
library(SnowballC)
library(wordcloud)
library(RWeka)
library(textir)
library(igraph)
library(qdap)
library(maptpx)
library(dplyr)
library(plotrix)
library(dendextend)
library(ggplot2)
library(ggthemes)
library(readr)
oneplus6t <- read_csv("oneplus6t.txt")
View(oneplus6t)
#convert all text to lower case
review <- tolower(oneplus6t)

# Replace blank space (“rt”)
review <- gsub("rt", "", oneplus6t)

# Replace @UserName
review <- gsub("@\\w+", "", oneplus6t)

# Remove punctuation
review <- gsub("[[:punct:]]", "", oneplus6t)

# Remove links
review <- gsub("http\\w+", "", oneplus6t)

# Remove tabs
review <- gsub("[ |\t]{2,}", "", oneplus6t)

# Remove blank spaces at the beginning
review <- gsub("^ ", "", oneplus6t)

# Remove blank spaces at the end
review <- gsub(" $", "", oneplus6t)
library("tm")

#create corpus
review_corpus <- Corpus(VectorSource(review))

#clean up by removing stop words
review_corpus <- tm_map(review_corpus, function(x)removeWords(x,stopwords()))
library("wordcloud")

#generate wordcloud
wordcloud(review_corpus,min.freq = 2, scale=c(7,0.5),colors=brewer.pal(8, "Dark2"),  random.color= TRUE, random.order = FALSE, max.words = 150)
