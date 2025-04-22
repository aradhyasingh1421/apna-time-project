#!/usr/bin/env python
# coding: utf-8

# In[4]:


import pandas as pd


# In[5]:


import numpy as np


# In[6]:


import seaborn as snc


# In[7]:


import matplotlib.pyplot as plt


# In[8]:


df = pd.read_csv('supply_chain_extended_data.csv')


# In[10]:


print(df)


# In[11]:


df.shape


# In[12]:


from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score


# In[13]:


print("First 5 rows:")
print(df.head())


# In[14]:


print("\nShape of the data:", df.shape)


# In[15]:


print("\nColumn names:")
print(df.columns)


# In[16]:


print("\nMissing values information:")
print(df.isnull().sum())


# In[17]:


print("\nSummary statistics:")
import pandas as pd
import matplotlib.pyplot as plt


# In[18]:


print("\n✅ Columns in your dataset:")
print(df.columns.tolist())


# In[19]:


plt.style.use('ggplot')


# In[20]:


main_color = '#e74c3c'    
border_color = '#f1948a'


# In[21]:


columns = [
    'Current_Stock',
    'Demand_Forecast',
    'Lead_Time_Days',
    'Shipping_Time_Days',
    'Operational_Cost',
    'Monthly_Sales',
    'Order_Processing_Time',
    'Return_Rate',
    'Backorder_Quantity',
    'Damaged_Goods'
]


# In[22]:


for i, col in enumerate(columns, 1):
    plt.figure(figsize=(8, 4))
    plt.hist(df[col].dropna(), bins=20, color=main_color, edgecolor=border_color)
    plt.title(f"{i}. Histogram of {col}", fontsize=14)
    plt.xlabel(col, fontsize=12)
    plt.ylabel('Frequency', fontsize=12)
    plt.grid(True, linestyle='--', alpha=0.5)
    plt.tight_layout()
    plt.show()


# In[ ]:




