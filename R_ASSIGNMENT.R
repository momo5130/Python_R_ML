---
title: "R Notebook"
output: html_notebook
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code. 

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*. 

```{r}
getwd()

#removing the second row and loading the csv file
dataset = (read.csv(("IMDB_data.csv"), header = TRUE)[-2,])
View(dataset)

#exttracting the unique genres and its counts
#extracting unique Genre
uni=unique(dataset$Genre)

#calculating the length of unique Genre
len=length(uni)
View(uni)

#indexing the key
Index_Key=c(1:len)
w=table(dataset$Genre)
t=as.data.frame(w)
p=t[-1,]

View(p)
df_genre=data.frame(Index_Key,p)
d_genre=data.frame(Index=df_genre$Index_Key,df_genre$Freq)


#convert data types 
dataset$imdbRating=as.numeric(dataset$imdbRating)
dataset$Year=as.numeric(dataset$Year)
dataset$imdbVotes=as.numeric(dataset$imdbVotes)
dataset$Genre=as.factor(dataset$Genre)# converting to categorical variablw
dataset$Language=as.factor(dataset$Language)# converting to categorical variable 

#sort genre by its name
dataset=dataset[order(dataset$Genre),]
View(dataset)

#square of differnce between imdbRating and imdbVotes
dataset$SquareOfDiffernce=with(dataset,(imdbRating=imdbVotes)^2)
View(dataset)
```

`Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.
