tweets <- read.csv(file.choose(), stringsAsFactors = TRUE)

#Rmoving hashtag , urls and other special characters
library(gsubfn)
tweets.df <- gsub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\\w+:\\/\\/\\S+)","",tweets$tweet)

View(tweets.df)

library("syuzhet")

word.df <- as.vector(tweets.df)
emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tweets.df2, emotion.df) 
View(emotion.df2)
sent.value <- get_sentiment(word.df)
most.positive <- word.df[sent.value == max(sent.value)]
most.positive
most.negative <- word.df[sent.value == min(sent.value)]
most.negative
word.df<-cbind(word.df, sent.value)
nrow(word.df)
for(i in 1:nrow(word.df))
{
  
  t<-word.df[i,2];
  print(t)
  if(t<0) 
  {
    word.df[i,2]=-1;
  }else if(t>0)
  {
    word.df[i,2]=1;
  }else
    word.df[i,2]=0;

  print(word.df[i,2])
  }
View(word.df)
