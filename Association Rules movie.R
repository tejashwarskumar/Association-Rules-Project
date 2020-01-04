library(readr)
library(arules)
library(arulesViz)

movie<-read.csv(file.choose())
View(movie)
movie<-movie[,-c(1:5)]
barplot(sapply(movie,sum),col=1:10)

rules<-apriori(as.matrix(movie),parameter=list(support = 0.002,confidence = 0.2,minlen = 2))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:15],method = "scatterplot")
plot(rules[1:15],method = "grouped")
plot(rules[1:15],method = "graph")

rules <- apriori(as.matrix(movie), parameter = list(supp=0.001,conf = 0.08), appearance = list(rhs="Green.Mile"))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:10],method = "scatterplot")
plot(rules[1:10],method = "grouped")
plot(rules[1:10],method = "graph")

rules <- apriori(as.matrix(movie), parameter = list(supp=0.02,conf = 0.1), appearance = list(rhs="Sixth.Sense"))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:10],method = "scatterplot")
plot(rules[1:10],method = "grouped")
plot(rules[1:10],method = "graph")
