import pandas as pd
bookData=pd.read_csv("C:/My Files/Excelr/08 - Association Rules/Assignment/book.csv")
bookData.head()
from mlxtend.frequent_patterns import apriori,association_rules
import matplotlib.pyplot as plt

frequent_items = apriori(bookData,min_support=0.005,max_len=3,use_colnames = True)
frequent_items
frequent_items.head()
rules = association_rules(frequent_items, metric="lift", min_threshold=1.2)
rules.head()
rules.sort_values('lift',ascending = False,inplace=True)

#visualization
support = rules.as_matrix(columns=['support'])
confidence = rules.as_matrix(columns=['confidence'])

plt.scatter(support,confidence,color='r')
