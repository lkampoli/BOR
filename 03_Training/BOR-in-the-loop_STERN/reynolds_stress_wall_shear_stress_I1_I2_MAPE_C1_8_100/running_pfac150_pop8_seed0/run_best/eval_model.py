import os
import numpy as np
import subprocess
import signal
import sympy as sp
import scipy.integrate
from scipy.interpolate import interp1d
import sys
from mop import *
import re

from sklearn.metrics import mean_squared_error 			# MSE 
from sklearn.metrics import mean_absolute_error			# MAE
from sklearn.metrics import mean_absolute_percentage_error	# MAPE
from sklearn.metrics import max_error				# ME

# Change working directory
os.chdir(os.path.dirname(__file__))

# Get run_id
run_id = os.path.basename(os.getcwd()).split('_')[-1]

# Load expressions
expressions = []
case_dir    = "./BOR"
numLines    = 0

# write the actual expression (phenotype) of individual colony
# populations from input_" + run_id" file into the zeta's files
# in /case_dir/constant/zeta#.H one for expression.
with open("input_" + run_id, 'r') as f:
    for line in f.readlines():
        expressions.append(line.replace('\n',''))
        numLines+=1
        g = open(case_dir+"/constant/zeta"+str(numLines)+".H", 'w')
        val = '("' + line[:-1].replace(',', '" "') + '")'
        print(val)
        g.writelines(val)
        g.close()

bor = Case(case_dir = case_dir)

bor.start(0)

bor.clean()

bor.run()

bor.sample_complex("R")

bor.fix_R_2000()

bor.sample()

# Read profiles in each region
#profiles_bow = ['XoRm0.1','XoR0.0','XoRp0.1','XoRp0.2','XoRp0.3','XoRp0.4', 'XoRp0.5','XoRp0.6','XoRp0.7','XoRp0.8','XoRp0.9','XoRp1.0','XoRp1.1'] # BOW
#profiles_center = ['XoRp4.17','XoRp4.27','XoRp4.37','XoRp4.47','XoRp4.57','XoRp4.67','XoRp4.77','XoRp4.87','XoRp4.97','XoRp5.07','XoRp5.17','XoRp5.27','XoRp5.37','XoRp5.47'] # CENTER
profiles_stern = ['XoRp8.67','XoRp8.92','XoRp9.17','XoRp9.42','XoRp9.67','XoRp9.92','XoRp10.17', 'XoRp10.42','XoRp10.67','XoRp10.92','XoRp11.17','XoRp11.42','XoRp11.67', 'XoRp11.92','XoRp12.17'] # STERN
#profiles_wake = ['XoRp12.9167','XoRp13.17','XoRp13.4167','XoRp13.67','XoRp13.9167','XoRp14.17','XoRp14.4167','XoRp14.67','XoRp14.9167','XoRp15.17','XoRp15.4167','XoRp15.67','XoRp15.9167','XoRp16.17','XoRp16.4167'] # WAKE

err_U_bow        = 0.
err_U_center     = 0.
err_U_stern      = 0.
err_U_wake       = 0.

err_shear_bow    = 0.
err_shear_center = 0.
err_shear_stern  = 0.
err_shear_wake   = 0.

err_R_bow    	 = 0.
err_R_center 	 = 0.
err_R_stern  	 = 0.
err_R_wake   	 = 0.

err_bor          = 0.

# Calculate cost function(s)

# *******************************************************************************

# Reynolds stresses in the STERN
################################
for j in range(len(profiles_stern)):
    try:
       print(j)
       # RANS Data
       file_rans = case_dir+"/postProcessing/sampleDict/2000/"+profiles_stern[j]+"_R.xy"
       print(file_rans)
       #y_num, y_R_num = np.loadtxt(case_dir+"/postProcessing/sampleDict/2000/"+profiles_stern[j]+"_R.xy", unpack=True, usecols=[0,2])
       y_num, y_R_num = np.loadtxt(file_rans, unpack=True, usecols=[0,2])
       y_R_num = y_R_num * (4.1*4.1) / (0.186*0.186)
 
       # Experimental Data
       file_exp = "../../ref_data/postProcessing/sampleDict/0/"+profiles_stern[j]+"_U.xy"
       print(file_exp)
       #y_exp, y_R_exp = np.loadtxt("../../ref_data/postProcessing/sampleDict/0/"+profiles_stern[j]+"_U.xy", unpack=True, usecols=[1,7])
       y_exp, y_R_exp = np.loadtxt(file_exp, unpack=True, usecols=[1,7])

       # interpolate experimental onto RANS data
       g = interp1d(y_num, y_R_num)
       y_R_num_int = g(y_exp)
      
       # limiter to avoid negative values
       err_R_stern = mean_absolute_percentage_error(y_R_exp, y_R_num_int)
       print(err_R_stern)
       if (err_R_stern < 0):
	       err_R_stern = 9999
    except:
       err_R_stern = 9999

    print("err_R_stern: ",err_R_stern)

# *******************************************************************************


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Reynolds wall shear stresses in the STERN
###########################################
try:
   # RANS Data
   x_num, x_R_num = np.loadtxt(case_dir+"/postProcessing/sampleDict/2000/frozen_STERN_R.xy", unpack=True, usecols=[0,4])
   x_R_num = x_R_num * (4.1*4.1) / (0.186*0.186)

   # Experimental Data
   x_exp, x_R_exp = np.loadtxt("../../ref_data/postProcessing/sampleDict/0/frozen_Rwall_STERN.xy", unpack=True, usecols=[0,2])

   # interpolate experimental onto RANS data
   g = interp1d(x_num, x_R_num)
   x_R_num_int = g(x_exp)
       
   # limiter to avoid negative values
   err_shear_stern = mean_absolute_percentage_error(x_R_exp, x_R_num_int)
   if (err_shear_stern < 0):
	   err_shear_stern = 9999
except:
   err_shear_stern = 9999

print("err_shear_stern: ",err_shear_stern)

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

err_bor = err_R_stern + err_shear_stern
print("err_bor =", err_bor)

# write the value of cost functions in output folder
cost_list = [err_bor]
costs = [[0.001] for i in range(1) for i in range(1)] 
for y in range(len(cost_list)):
    costs[y][0] = cost_list[y]
    np.savetxt("./output/" + "C" + str(y+1) + ".edf.gz", costs[y])

