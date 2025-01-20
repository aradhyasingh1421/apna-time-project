#!/usr/bin/env python
# coding: utf-8

# In[19]:


import pandas as pd


# In[20]:


import numpy as np


# In[21]:


import seaborn as snc


# In[22]:


import matplotlib.pyplot as plt


# In[23]:


data = pd.read_csv('Dataset.csv')
print(data)


# In[24]:


data.shape


# In[25]:


data.info()


# In[26]:


data.isnull().sum()/data.shape[0]*100


# In[27]:


type(data)


# In[28]:


data.info()


# In[29]:


data.describe()


# In[32]:


df=data.drop('Date',axis=1)


# In[33]:


df.mean()


# In[34]:


df.median()


# In[35]:


df.mode()


# In[36]:


df.mode()


# In[37]:


df.var()


# In[38]:


df.std()


# In[39]:


df.max()


# In[40]:


df.min()


# In[50]:


range = df.max() - df.min()


# In[46]:


df.skew()


# In[47]:


df.kurt()


# In[ ]:




