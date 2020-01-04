library(readr)
library(arules)
library(arulesViz)

book<-read.csv(file.choose())
View(book)
barplot(sapply(book,sum),col=1:10)

rules<-apriori(as.matrix(book),parameter=list(support = 0.01,confidence = 0.5,minlen = 3))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:20],method = "scatterplot")
plot(rules[1:20],method = "grouped")
plot(rules[1:20],method = "graph")

rules <- apriori(as.matrix(book), parameter = list(supp=0.001,conf = 0.08), appearance = list(rhs="ItalAtlas"))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:10],method = "scatterplot")
plot(rules[1:10],method = "grouped")
plot(rules[1:10],method = "graph")

rules <- apriori(as.matrix(book), parameter = list(supp=0.002,conf = 0.1), appearance = list(rhs="ChildBks"))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:10],method = "scatterplot")
plot(rules[1:10],method = "grouped")
plot(rules[1:10],method = "graph")
