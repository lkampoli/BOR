#!/usr/bin/env python
# coding: utf-8

# In[35]:


from IPython.display import display, HTML
display(HTML("<style>.container { width:100% !important; }</style>"))


# In[36]:


import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt

from scipy import spatial
from scipy.spatial import distance
from scipy.spatial.distance import cdist
from scipy.spatial import ConvexHull, convex_hull_plot_2d
from scipy.spatial import KDTree
import scipy.integrate
from scipy import interpolate
from scipy.interpolate import interp1d, interp2d


# In[37]:


matplotlib.rc('xtick', labelsize=25) 
matplotlib.rc('ytick', labelsize=25)

font = {'family' : 'sans-serif',
        'weight' : 'bold',
        'size'   : 25}

matplotlib.rc('font', **font)


# In[4]:


BOR = pd.read_csv('BOR_shape.csv')
BOR_full = pd.read_csv('BOR_shape_full.csv')


# In[5]:


BOR_full


# In[6]:


plt.figure(figsize=(30,15), frameon=False)
plt.axhline(y = 0, xmin=0.05, xmax=0.19, color = 'lightgrey', linewidth=5)
plt.axhline(y = 0, xmin=0.67, xmax=0.95, color = 'lightgrey', linewidth=5)
plt.scatter(BOR_full['C:0'], BOR_full['C:1'], label='BOR', linewidth=2, c='lightgrey', linestyle = '-')
plt.ylabel("$y/R$ [-]")
plt.xlabel("$x/R$ [-]")
plt.tight_layout()
plt.savefig('0.BOR_domain.pdf')
plt.grid()
plt.show()
plt.close()


# In[7]:


plt.figure(figsize=(30,15), frameon=False)

plt.axhline(y = 0, xmin=0.05, xmax=0.19, color = 'lightgrey', linewidth=5)
plt.axhline(y = 0, xmin=0.67, xmax=0.95, color = 'lightgrey', linewidth=5)

plt.scatter(BOR_full['C:0'], BOR_full['C:1'], label='BOR', linewidth=2, c='lightgrey', linestyle = '-')

plt.text(0.5, 1.02, 'BOW',    horizontalalignment='center', verticalalignment='center', color='m')
plt.text(4.8, 1.02, 'CENTER', horizontalalignment='center', verticalalignment='center', color='b')
plt.text(10.4, 1.02, 'STERN', horizontalalignment='center', verticalalignment='center', color='g')
plt.text(14.6, 1.02, 'WAKE',  horizontalalignment='center', verticalalignment='center', color='r')

plt.axvline(x = -0.1,    ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=-0.1')
plt.axvline(x = 1.1,     ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=1.1')
plt.axvline(x = 4.17,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=4.17')
plt.axvline(x = 5.37,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=5.37')
plt.axvline(x = 8.67,    ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=8.67')
plt.axvline(x = 12.17,   ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=12.17')
plt.axvline(x = 12.9167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=12.4167')
plt.axvline(x = 16.4167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=16.4167')

plt.ylabel("$y/R$ [-]")
plt.xlabel("$x/R$ [-]")
plt.tight_layout()
plt.savefig('1.BOR_domain_exp_lines.pdf')
plt.grid()
plt.show()
plt.close()


# In[8]:


plt.figure(figsize=(30,15), frameon=False)

plt.axhline(y = 0, xmin=0.05, xmax=0.19, color = 'lightgrey', linewidth=5)
plt.axhline(y = 0, xmin=0.67, xmax=0.95, color = 'lightgrey', linewidth=5)

plt.scatter(BOR_full['C:0'], BOR_full['C:1'], label='BOR', linewidth=2, c='lightgrey', linestyle = '-')

# load experimental point
exp_points = np.loadtxt('BoRDataCompilation_Medium.dat') 
exp_points = exp_points[:5229, :]                       

plt.scatter(exp_points[:,0], exp_points[:,1], c='lightgrey', s=10, label='Exp. points')

plt.text(0.5, 1.02,  'BOW',    horizontalalignment='center', verticalalignment='center', color='m')
plt.text(4.8, 1.02,  'CENTER', horizontalalignment='center', verticalalignment='center', color='b')
plt.text(10.4, 1.02, 'STERN',  horizontalalignment='center', verticalalignment='center', color='g')
plt.text(14.6, 1.02, 'WAKE',   horizontalalignment='center', verticalalignment='center', color='r')

plt.axvline(x = -0.1,    ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=-0.1')
plt.axvline(x = 1.1,     ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=1.1')
plt.axvline(x = 4.17,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=4.17')
plt.axvline(x = 5.37,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=5.37')
plt.axvline(x = 8.67,    ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=8.67')
plt.axvline(x = 12.17,   ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=12.17')
plt.axvline(x = 12.9167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=12.4167')
plt.axvline(x = 16.4167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=16.4167')

plt.ylabel("$y/R$ [-]")
plt.xlabel("$x/R$ [-]")
plt.tight_layout()
plt.savefig('2.BOR_domain_exp_lines_and_points.pdf')
plt.grid()
plt.show()
plt.close()


# In[9]:


# load original raw cluster points
cluster0 = np.loadtxt('cluster0.txt')
cluster1 = np.loadtxt('cluster1.txt')
cluster2 = np.loadtxt('cluster2.txt')
cluster3 = np.loadtxt('cluster3.txt')
cluster4 = np.loadtxt('cluster4.txt')
cluster5 = np.loadtxt('cluster5.txt')


# In[10]:


plt.figure(figsize=(30,15), frameon=False)

plt.axhline(y = 0, xmin=0.05, xmax=0.19, color = 'lightgrey', linewidth=5)
plt.axhline(y = 0, xmin=0.67, xmax=0.95, color = 'lightgrey', linewidth=5)

plt.scatter(BOR_full['C:0'], BOR_full['C:1'], label='BOR', linewidth=2, c='lightgrey', linestyle = '-')

# load experimental point
exp_points = np.loadtxt('BoRDataCompilation_Medium.dat') 
exp_points = exp_points[:5229, :]                       

plt.scatter(exp_points[:,0], exp_points[:,1], c='lightgrey', s=10, label='Exp. points')

plt.text(0.5, 1.02,  'BOW',    horizontalalignment='center', verticalalignment='center', color='m')
plt.text(4.8, 1.02,  'CENTER', horizontalalignment='center', verticalalignment='center', color='b')
plt.text(10.4, 1.02, 'STERN',  horizontalalignment='center', verticalalignment='center', color='g')
plt.text(14.6, 1.02, 'WAKE',   horizontalalignment='center', verticalalignment='center', color='r')

plt.axvline(x = -0.1,    ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=-0.1')
plt.axvline(x = 1.1,     ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=1.1')
plt.axvline(x = 4.17,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=4.17')
plt.axvline(x = 5.37,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=5.37')
plt.axvline(x = 8.67,    ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=8.67')
plt.axvline(x = 12.17,   ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=12.17')
plt.axvline(x = 12.9167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=12.4167')
plt.axvline(x = 16.4167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=16.4167')

plt.scatter(cluster0[:,0], cluster0[:,1], c='b', s=20, label='cluster0')
plt.scatter(cluster1[:,0], cluster1[:,1], c='r', s=20, label='cluster1')
plt.scatter(cluster2[:,0], cluster2[:,1], c='g', s=20, label='cluster2')
plt.scatter(cluster3[:,0], cluster3[:,1], c='y', s=20, label='cluster3')
plt.scatter(cluster4[:,0], cluster4[:,1], c='m', s=20, label='cluster4')
plt.scatter(cluster5[:,0], cluster5[:,1], c='c', s=20, label='cluster5')

plt.ylabel("$y/R$ [-]")
plt.xlabel("$x/R$ [-]")
plt.tight_layout()
plt.savefig('3.BOR_domain_exp_lines_and_points_and_clusters.pdf')
plt.grid()
plt.show()
plt.close()


# In[11]:


##### load sub-sampled cluster points
subsampled_cluster0 = np.loadtxt('subsampled_cluster0_unique.txt')
subsampled_cluster1 = np.loadtxt('subsampled_cluster1_unique.txt')
subsampled_cluster2 = np.loadtxt('subsampled_cluster2_unique.txt')
subsampled_cluster3 = np.loadtxt('subsampled_cluster3_unique.txt')
subsampled_cluster4 = np.loadtxt('subsampled_cluster4_unique.txt')
subsampled_cluster5 = np.loadtxt('subsampled_cluster5_unique.txt')

# filter outsiders
subcluster0 = subsampled_cluster0[(subsampled_cluster0[:,0] > 0)     & (subsampled_cluster0[:,0] < 1.1)   |
                                  (subsampled_cluster0[:,0] > 4.17)  & (subsampled_cluster0[:,0] < 5.37)  |
                                  (subsampled_cluster0[:,0] > 8.67)  & (subsampled_cluster0[:,0] < 12.17) | 
                                  (subsampled_cluster0[:,0] > 12.91) & (subsampled_cluster0[:,0] < 16.4167)]

subcluster1 = subsampled_cluster1[(subsampled_cluster1[:,0] > 0)     & (subsampled_cluster1[:,0] < 1.1)   |
                                  (subsampled_cluster1[:,0] > 4.17)  & (subsampled_cluster1[:,0] < 5.37)  |
                                  (subsampled_cluster1[:,0] > 8.67)  & (subsampled_cluster1[:,0] < 12.17) | 
                                  (subsampled_cluster1[:,0] > 12.91) & (subsampled_cluster1[:,0] < 16.4167)]

subcluster2 = subsampled_cluster2[(subsampled_cluster2[:,0] > 0)     & (subsampled_cluster2[:,0] < 1.1)   |
                                  (subsampled_cluster2[:,0] > 4.17)  & (subsampled_cluster2[:,0] < 5.37)  |
                                  (subsampled_cluster2[:,0] > 8.67)  & (subsampled_cluster2[:,0] < 12.17) | 
                                  (subsampled_cluster2[:,0] > 12.91) & (subsampled_cluster2[:,0] < 16.4167)]

subcluster3 = subsampled_cluster3[(subsampled_cluster3[:,0] > 0)     & (subsampled_cluster3[:,0] < 1.1)   |
                                  (subsampled_cluster3[:,0] > 4.17)  & (subsampled_cluster3[:,0] < 5.37)  |
                                  (subsampled_cluster3[:,0] > 8.67)  & (subsampled_cluster3[:,0] < 12.17) | 
                                  (subsampled_cluster3[:,0] > 12.91) & (subsampled_cluster3[:,0] < 16.4167)]

subcluster4 = subsampled_cluster4[(subsampled_cluster4[:,0] > 0)     & (subsampled_cluster4[:,0] < 1.1)   |
                                  (subsampled_cluster4[:,0] > 4.17)  & (subsampled_cluster4[:,0] < 5.37)  |
                                  (subsampled_cluster4[:,0] > 8.67)  & (subsampled_cluster4[:,0] < 12.17) | 
                                  (subsampled_cluster4[:,0] > 12.91) & (subsampled_cluster4[:,0] < 16.4167)]

subcluster5 = subsampled_cluster5[(subsampled_cluster5[:,0] > 0)     & (subsampled_cluster5[:,0] < 1.1)   |
                                  (subsampled_cluster5[:,0] > 4.17)  & (subsampled_cluster5[:,0] < 5.37)  |
                                  (subsampled_cluster5[:,0] > 8.67)  & (subsampled_cluster5[:,0] < 12.17) | 
                                  (subsampled_cluster5[:,0] > 12.91) & (subsampled_cluster5[:,0] < 16.4167)]


# In[12]:


plt.figure(figsize=(30,15), frameon=False)

plt.axhline(y = 0, xmin=0.05, xmax=0.19, color = 'lightgrey', linewidth=5)
plt.axhline(y = 0, xmin=0.67, xmax=0.95, color = 'lightgrey', linewidth=5)

plt.scatter(BOR_full['C:0'], BOR_full['C:1'], label='BOR', linewidth=2, c='lightgrey', linestyle = '-')

# load experimental point
exp_points = np.loadtxt('BoRDataCompilation_Medium.dat') 
exp_points = exp_points[:5229, :]                       

plt.scatter(exp_points[:,0], exp_points[:,1], c='lightgrey', s=10, label='Exp. points')

plt.text(0.5, 1.02,  'BOW',    horizontalalignment='center', verticalalignment='center', color='m')
plt.text(4.8, 1.02,  'CENTER', horizontalalignment='center', verticalalignment='center', color='b')
plt.text(10.4, 1.02, 'STERN',  horizontalalignment='center', verticalalignment='center', color='g')
plt.text(14.6, 1.02, 'WAKE',   horizontalalignment='center', verticalalignment='center', color='r')

plt.axvline(x = -0.1,    ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=-0.1')
plt.axvline(x = 1.1,     ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=1.1')
plt.axvline(x = 4.17,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=4.17')
plt.axvline(x = 5.37,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=5.37')
plt.axvline(x = 8.67,    ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=8.67')
plt.axvline(x = 12.17,   ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=12.17')
plt.axvline(x = 12.9167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=12.4167')
plt.axvline(x = 16.4167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=16.4167')

#plt.scatter(subsampled_cluster0[:,0], subsampled_cluster0[:,1], c='b', s=30, label='subcluster0')
#plt.scatter(subsampled_cluster1[:,0], subsampled_cluster1[:,1],  c='r', s=30, label='subcluster1')
#plt.scatter(subsampled_cluster2[:,0], subsampled_cluster2[:,1], c='g', s=30, label='subcluster2')
#plt.scatter(subsampled_cluster3[:,0], subsampled_cluster3[:,1], c='y', s=30, label='subcluster3')
#plt.scatter(subsampled_cluster4[:,0], subsampled_cluster4[:,1], c='m', s=30, label='subcluster4')
#plt.scatter(subsampled_cluster5[:,0], subsampled_cluster5[:,1], c='c', s=30, label='subcluster5')

plt.scatter(subcluster0[:,0], subcluster0[:,1], c='b', s=30, label='subcluster0')
plt.scatter(subcluster1[:,0], subcluster1[:,1], c='r', s=30, label='subcluster1')
plt.scatter(subcluster2[:,0], subcluster2[:,1], c='g', s=30, label='subcluster2')
plt.scatter(subcluster3[:,0], subcluster3[:,1], c='y', s=30, label='subcluster3')
plt.scatter(subcluster4[:,0], subcluster4[:,1], c='m', s=30, label='subcluster4')
plt.scatter(subcluster5[:,0], subcluster5[:,1], c='c', s=30, label='subcluster5')

plt.ylabel("$y/R$ [-]")
plt.xlabel("$x/R$ [-]")
plt.tight_layout()
plt.savefig('4.BOR_domain_exp_lines_and_points_and_subclusters.pdf')
plt.grid()
plt.show()
plt.close()


# In[21]:


ref_file = 'BoRDataCompilation_Medium.dat'
ref_path = 'REF/'

REF = ['-0.1', '0.0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1.0', '1.1',
       '4.17','4.27','4.37','4.47','4.57','4.67','4.77','4.87','4.97','5.07','5.17','5.27','5.37','5.47',
       '8.67','8.92','9.17','9.42','9.67','9.92','10.17','10.42','10.67','10.92','11.17','11.42','11.67','11.92','12.17',
       '12.9167','13.17','13.4167','13.67','13.9167','14.17','14.4167','14.67','14.9167','15.17','15.4167','15.67','15.9167','16.17','16.4167']


# In[22]:


of_path = 'OF/'


# In[63]:


for c in range(0,6):
    print("Cluster", c) # clusters
    data_OF_U = np.loadtxt(of_path+'cluster'+str(c)+'_U.xy')

    x_OF = data_OF_U[:,0]
    y_OF = data_OF_U[:,1]
    z_OF = data_OF_U[:,2]

    CLUSTER = np.column_stack((x_OF, y_OF))
    print("CLUSTER", CLUSTER.shape)
    tree = spatial.KDTree(CLUSTER)
    
    for p in REF:
        print("Profile", p) # profiles
        
        # load experimental profiles
        data_ref = np.loadtxt(ref_path+'XoR_'+p+'.xy')

        x_ref   = data_ref[:,0]
        y_ref   = data_ref[:,1]
        z_ref   = np.zeros(y_ref.shape)
     
        p_exp = np.array([x_ref, y_ref]).T
        
        plt.figure(figsize=(30,15), frameon=False)

        plt.axhline(y = 0, xmin=0.05, xmax=0.19, color = 'lightgrey', linewidth=5)
        plt.axhline(y = 0, xmin=0.67, xmax=0.95, color = 'lightgrey', linewidth=5)

        plt.scatter(BOR_full['C:0'], BOR_full['C:1'], label='BOR', linewidth=2, c='lightgrey', linestyle = '-')

        # load experimental point
        exp_points = np.loadtxt('BoRDataCompilation_Medium.dat') 
        exp_points = exp_points[:5229, :]                       

        plt.scatter(exp_points[:,0], exp_points[:,1], c='lightgrey', s=10, label='Exp. points')

        plt.text(0.5, 1.02,  'BOW',    horizontalalignment='center', verticalalignment='center', color='m')
        plt.text(4.8, 1.02,  'CENTER', horizontalalignment='center', verticalalignment='center', color='b')
        plt.text(10.4, 1.02, 'STERN',  horizontalalignment='center', verticalalignment='center', color='g')
        plt.text(14.6, 1.02, 'WAKE',   horizontalalignment='center', verticalalignment='center', color='r')

        plt.axvline(x = -0.1,    ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=-0.1')
        plt.axvline(x = 1.1,     ymin=0.05, ymax=0.95, color = 'm', lw=5, label = 'x=1.1')
        plt.axvline(x = 4.17,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=4.17')
        plt.axvline(x = 5.37,    ymin=0.05, ymax=0.95, color = 'b', lw=5, label = 'x=5.37')
        plt.axvline(x = 8.67,    ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=8.67')
        plt.axvline(x = 12.17,   ymin=0.05, ymax=0.95, color = 'g', lw=5, label = 'x=12.17')
        plt.axvline(x = 12.9167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=12.4167')
        plt.axvline(x = 16.4167, ymin=0.05, ymax=0.95, color = 'r', lw=5, label = 'x=16.4167')
        
        if(c==0):
            plt.plot(CLUSTER[:,0], CLUSTER[:,1], '.', c='b', label='cluster'+str(c))
        elif(c==1):
            plt.plot(CLUSTER[:,0], CLUSTER[:,1], '.', c='r', label='cluster'+str(c))
        elif(c==2):
            plt.plot(CLUSTER[:,0], CLUSTER[:,1], '.', c='g', label='cluster'+str(c))
        elif(c==3):
            plt.plot(CLUSTER[:,0], CLUSTER[:,1], '.', c='y', label='cluster'+str(c))
        elif(c==4):
            plt.plot(CLUSTER[:,0], CLUSTER[:,1], '.', c='m', label='cluster'+str(c))
        elif(c==5):
            plt.plot(CLUSTER[:,0], CLUSTER[:,1], '.', c='c', label='cluster'+str(c))
#       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        plt.plot(x_ref, y_ref, 'x', c='k',label='REF')
        for results in tree.query_ball_point(p_exp, 0.03): # tunable parameter to get more or less points
            nearby_points = CLUSTER[results]
            plt.plot(nearby_points[:,0], nearby_points[:,1], color='yellow', marker='o', markersize=10)
#       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
#           write files with cluster line points
            nearby_points_z = np.zeros(nearby_points[:,0].shape)
            LINE = np.column_stack((nearby_points[:,0], nearby_points[:,1], nearby_points_z))
            print(LINE.shape)
            with open("cluster"+str(c)+"_XoR_"+str(p)+".txt", "ab") as f:
                np.savetxt(f, LINE)
#       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        plt.ylabel("$y/R$ [-]")
        plt.xlabel("$x/R$ [-]")
        plt.tight_layout()
        #plt.savefig('5.BOR_cluster'+str(c)+'_XoR'+p+'.pdf')
        #plt.savefig('cluster'+str(c)+'_XoR'+p+'.pdf')
        #plt.savefig('cluster'+str(c)+'_XoR'+p+'.png')
        plt.grid()
        plt.show()
        plt.close()


# In[ ]:




