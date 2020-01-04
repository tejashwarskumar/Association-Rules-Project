import pandas as pd
moviesdata = pd.read_csv("C:/My Files/Excelr/08 - Association Rules/Assignment/my_movies.csv")
moviesdata = moviesdata.iloc[:,5:14]
moviesdata.head()

from mlxtend.frequent_patterns import apriori,association_rules
frequent_val = apriori(moviesdata,min_support=0.05,max_len=3,use_colnames=True)
model = association_rules(frequent_val,metric="lift",min_threshold=1.2)
model
model.sort_values('lift',ascending=False,inplace=True)
model.head()

support = model.as_matrix(columns=['support'])
confidence = model.as_matrix(columns=['confidence'])
import matplotlib.pyplot as plt
plt.scatter(support,confidence,color='r')
