library(readr)
library(arules)
library(arulesViz)
data(Groceries)
View(Groceries)

rules<-apriori(Groceries,parameter=list(support = 0.01,confidence = 0.5,minlen = 2))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:15],method = "scatterplot")
plot(rules[1:15],method = "grouped")
plot(rules[1:15],method = "graph")

rules <- apriori(data=Groceries, parameter = list(supp=0.001,conf = 0.08), appearance = list(rhs="whole milk"))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:10],method = "scatterplot")
plot(rules[1:10],method = "grouped")
plot(rules[1:10],method = "graph")

rules <- apriori(data=Groceries, parameter = list(supp=0.002,conf = 0.1), appearance = list(rhs="butter"))
rules
inspect(head(sort(rules,by="support")))
inspect(head(sort(rules,by="confidence")))
inspect(head(sort(rules,by="lift")))
plot(rules[1:10],method = "scatterplot")
plot(rules[1:10],method = "grouped")
plot(rules[1:10],method = "graph")
