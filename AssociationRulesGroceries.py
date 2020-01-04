import pandas as pd
from mlxtend.frequent_patterns import apriori,association_rules

groceries = []

# As the file is in transaction data we will be reading data directly 
with open("C:/My Files/Excelr/08 - Association Rules/Assignment/groceries.csv") as f:groceries = f.read()

# splitting the data into separate transactions using separator as "\n"
groceries = groceries.split("\n")
groceries_list = []

for i in groceries:
    groceries_list.append(i.split(","))
    
all_groceries_list = [i for item in groceries_list for i in item]

from collections import Counter
item_frequencies = Counter(all_groceries_list)
item_frequencies = sorted(item_frequencies.items(),key = lambda x:x[1])

# Storing frequencies and items in separate variables 
frequencies = list(reversed([i[1] for i in item_frequencies]))
items = list(reversed([i[0] for i in item_frequencies]))

import matplotlib.pyplot as plt

groceries_series  = pd.DataFrame(pd.Series(groceries_list))
groceries_series = groceries_series.iloc[:9835,:]
groceries_series.columns = ["transactions"]

X = groceries_series['transactions'].str.join(sep='*').str.get_dummies(sep='*')
frequent_itemsets = apriori(X, min_support=0.005, max_len=3,use_colnames = True)

# Most Frequent item sets based on support 
frequent_itemsets.sort_values('support',ascending = False,inplace=True)

plt.bar(list(range(1,11)),frequent_itemsets.support[1:11],color='rgmyk');plt.xticks(list(range(1,11)),frequent_itemsets.itemsets[1:11])
plt.xlabel('item-sets');plt.ylabel('support')

pd.set_option('display.expand_frame_repr', False)
rules = association_rules(frequent_itemsets, metric="lift", min_threshold=1)
rules.head(20)
rules.sort_values('lift',ascending = False,inplace=True)

def to_list(i):
    return (sorted(list(i)))

ma_X = rules.antecedents.apply(to_list)+rules.consequents.apply(to_list)
ma_X = ma_X.apply(sorted)

rules_sets = list(ma_X)
unique_rules_sets = [list(m) for m in set(tuple(i) for i in rules_sets)]
index_rules = []
for i in unique_rules_sets:
    index_rules.append(rules_sets.index(i))

rules_no_redudancy  = rules.iloc[index_rules,:]

# Sorting them with respect to list and getting top 10 rules 
rules_no_redudancy.sort_values('lift',ascending=False).head(10)

support = rules.as_matrix(columns=['support'])
confidence = rules.as_matrix(columns=['confidence'])
plt.scatter(support,confidence,color='r')
