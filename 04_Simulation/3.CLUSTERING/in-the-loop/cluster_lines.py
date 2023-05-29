#!/usr/bin/env python
# coding: utf-8

# In[56]:


#from IPython.display import display, HTML
#display(HTML("<style>.container { width:100% !important; }</style>"))


# In[57]:


#get_ipython().run_cell_magic('javascript', '', 'IPython.OutputArea.prototype._should_scroll = function(lines) {\n    return false;\n}\n')


# In[58]:


import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d.axes3d as p3
import matplotlib.cm as cm
from matplotlib import offsetbox
import matplotlib
import pandas as pd
import numpy as np
from numpy import genfromtxt
import seaborn as sns


# In[59]:


matplotlib.rc('xtick', labelsize=25) 
matplotlib.rc('ytick', labelsize=25)

font = {'family' : 'sans-serif',
        'weight' : 'bold',
        'size'   : 25}

matplotlib.rc('font', **font)


# In[60]:


df        = pd.read_csv('INPUT_FEATURES/df.csv')


# In[61]:


df.drop('Unnamed: 0', axis=1, inplace=True)


# In[62]:


df


# In[63]:


labels = np.loadtxt('labels.txt')


# In[64]:


labels = labels.reshape(-1,1).astype(int)


# In[65]:


labels.shape


# In[66]:


df_labels = pd.DataFrame(data=labels)


# In[67]:


df['labels'] = df_labels


# In[68]:


n_clusters = len(np.unique(labels)); print("Number of clusters", n_clusters)


# In[69]:


points = df[['x','y','z','labels']]


# In[79]:


clusters = []
for c in range(n_clusters):
    clusters.append(points[points['labels']==c])
    
for c in range(n_clusters):    
    clusters[c].to_csv("cluster"+str(c)+".csv")

plt.figure(figsize=(30,15))
for c in range(n_clusters):    
    plt.scatter(clusters[c]['x'], clusters[c]['y'])


# In[71]:


colors = ['r', 'b', 'g', 'm', 'k', 'y']

fig, axs = plt.subplots(2, 3, figsize=(30, 15), sharex=True, sharey=True)

for c in range(n_clusters):
    
    if (c == 0):
        ax0 = 0
        ax1 = 0
    if (c == 1):
        ax0 = 0
        ax1 = 1
    if (c == 2):
        ax0 = 0
        ax1 = 2
    if (c == 3):
        ax0 = 1
        ax1 = 0
    if (c == 4):
        ax0 = 1
        ax1 = 1
    if (c == 5):
        ax0 = 1
        ax1 = 2
    
    axs[ax0,ax1].scatter(clusters[c]['x'], clusters[c]['y'], s=80, c=colors[c], marker=">")
    axs[ax0,ax1].set_title("cluster "+str(c))
    axs[ax0,ax1].grid()

plt.tight_layout()
plt.show()


# In[72]:


profiles_bow    = ['XoRm0.1','XoR0.0','XoRp0.1','XoRp0.2','XoRp0.3','XoRp0.4', 'XoRp0.5','XoRp0.6','XoRp0.7','XoRp0.8','XoRp0.9','XoRp1.0','XoRp1.1'] # BOW
profiles_center = ['XoRp4.17','XoRp4.27','XoRp4.37','XoRp4.47','XoRp4.57','XoRp4.67','XoRp4.77','XoRp4.87','XoRp4.97','XoRp5.07','XoRp5.17','XoRp5.27','XoRp5.37','XoRp5.47'] # CENTER
profiles_stern  = ['XoRp8.67','XoRp8.92','XoRp9.17','XoRp9.42','XoRp9.67','XoRp9.92','XoRp10.17', 'XoRp10.42','XoRp10.67','XoRp10.92','XoRp11.17','XoRp11.42','XoRp11.67', 'XoRp11.92','XoRp12.17'] # STERN
profiles_wake   = ['XoRp12.9167','XoRp13.17','XoRp13.4167','XoRp13.67','XoRp13.9167','XoRp14.17','XoRp14.4167','XoRp14.67','XoRp14.9167','XoRp15.17','XoRp15.4167','XoRp15.67','XoRp15.9167','XoRp16.17','XoRp16.4167'] # WAKE

profiles_all = profiles_bow + profiles_center + profiles_stern + profiles_wake

xs = np.array([-0.1,0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,4.17,4.27,4.37,4.47,4.57,4.67,4.77,4.87,4.97,5.07,5.17,5.27,5.37,5.47,8.67,8.92,9.17,9.42,9.67,9.92,10.17,10.42,10.67,10.92,11.17,11.42,11.67,11.92,12.17,12.9167,13.17,13.4167,13.67,13.9167,14.17,14.4167,14.67,14.9167,15.17,15.4167,15.67,15.9167,16.17,16.4167])


# In[73]:


exp = np.loadtxt('BoRDataCompilation_Medium.dat')


# In[74]:


exp.shape


# In[75]:


len(profiles_all), len(xs)


# In[76]:


#get_ipython().system('mkdir cluster0 cluster1 cluster2 cluster3 cluster4 cluster5')


# In[77]:


eps = 0.05 # important parameter: left and right margin to search for points respect to nominal abscissa. Smaller values will make it more precise but fewer points

colors = ['r', 'b', 'g', 'm', 'k', 'y']

plt.figure(figsize=(30,20))
plt.scatter(exp[:4000,0],exp[:4000,1], s=2)

for c in range(n_clusters):
    print('cluster:',c)

    for i in range(len(xs)):
        
        cluster_data    = clusters[c][(clusters[c]['x']>=xs[i]-eps)&(clusters[c]['x']<=xs[i]+eps)]
        cluster_path    = "cluster"+str(c)+"/"
        cluster_profile = "XoR"+str(xs[i])+".xy"
        np.savetxt(cluster_path+cluster_profile, cluster_data[['x','y','z']])
      
        plt.scatter(cluster_data['x'], cluster_data['y'], c=colors[c])

        with open(cluster_path+cluster_profile, 'r') as f:
            lines = f.readlines()

        with open(cluster_path+cluster_profile, 'w') as f:
            f.writelines([''.join(['(', line.strip(), ')\n']) for line in lines])
    
plt.grid()

