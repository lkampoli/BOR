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

from sklearn.metrics import mean_squared_error 			    # MSE 
from sklearn.metrics import mean_absolute_error			    # MAE
from sklearn.metrics import mean_absolute_percentage_error	# MAPE
from sklearn.metrics import max_error				        # ME

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

# case set-up
# initialise the object with a case directory, default is ./
bor = Case(case_dir = case_dir)

# change startTime in controlDict
bor.start(0)

# Clean the former simulation results
# rm polyMesh, postProcessing, and time folders
bor.clean()

# Run the RANS
# run the application as specified in the controlDict
bor.run()

bor.sample_complex("R")

# create fix_R_2000.sh on the fly
with open ('fix_R_2000.sh', 'w') as rsh:
    rsh.write('''\
#! /bin/bash
sed -i 's/mapMethod/mapMethod       planarInterpolation/g' BOR/2000/R
''')

# execute it 
print("start fix_R_2000")
subprocess.run(['chmod', '+x', 'fix_R_2000.sh'])
subprocess.call("./fix_R_2000.sh", shell=True)
print("end fix_R_2000")

# Sample the field
# postProcess -func sampleDict ...
bor.sample()

profiles = ['XoRm0.1','XoR0.0','XoRp0.1','XoRp0.2','XoRp0.3','XoRp0.4', 'XoRp0.5','XoRp0.6','XoRp0.7','XoRp0.8','XoRp0.9','XoRp1.0','XoRp1.1',
            'XoRp4.17','XoRp4.27','XoRp4.37','XoRp4.47','XoRp4.57','XoRp4.67','XoRp4.77','XoRp4.87','XoRp4.97','XoRp5.07','XoRp5.17','XoRp5.27','XoRp5.37','XoRp5.47',
            'XoRp8.67','XoRp8.92','XoRp9.17','XoRp9.42','XoRp9.67','XoRp9.92','XoRp10.17', 'XoRp10.42','XoRp10.67','XoRp10.92','XoRp11.17','XoRp11.42','XoRp11.67', 'XoRp11.92','XoRp12.17',
            'XoRp12.9167','XoRp13.17','XoRp13.4167','XoRp13.67','XoRp13.9167','XoRp14.17','XoRp14.4167','XoRp14.67','XoRp14.9167','XoRp15.17','XoRp15.4167','XoRp15.67','XoRp15.9167','XoRp16.17','XoRp16.4167']

err_U_bor         = 0.
err_R_bor         = 0.
err_bor           = 0.

# Calculate cost function(s)

# ===============================================================================

# Mean axial velocity in the CLUSTER0
#####################################
for j in range(len(profiles)):
    try:
       # RANS Data
       y_num, y_U_num = np.loadtxt(case_dir+"/postProcessing/sampleDict/2000/"+profiles[j]+"_U.xy", unpack=True, usecols=[1,3])
       y_U_num = y_U_num / 2.2

       # Experimental Data
       y_exp, y_U_exp = np.loadtxt("../../ref_data/postProcessing/sampleDict/0/"+profiles[j]+"_U.xy", unpack=True, usecols=[1,3])

       y_exp_cut = (y_exp <= np.max(y_num)) & (y_exp >= np.min(y_num))
       indices = [i for i, x in enumerate(y_exp_cut) if x]
       
       y_exp_cut   = y_exp[indices]
       y_U_exp_cut = y_U_exp[indices]

       g = interp1d(y_num, y_U_num, bounds_error=False, fill_value='extrapolate')
       y_U_num_int = g(y_exp_cut)

       err_U_bor = mean_absolute_percentage_error(y_U_exp_cut, y_U_num_int)
       if (err_U_bor < 0):
	       err_U_bor = 9999
    except:
       err_U_bor = 9999
    
    print("err_U_bor: ",err_U_bor)

# ===============================================================================


# *******************************************************************************

# Reynolds stresses in the CLUSTER0
###################################
for j in range(len(profiles)):
    try:
       # RANS Data
       y_num, y_R_num = np.loadtxt(case_dir+"/postProcessing/sampleDict/2000/"+profiles[j]+"_Rall.xy", unpack=True, usecols=[1,4])
       y_R_num = y_R_num * (4.1*4.1/(2.2*2.2)) / (0.186*0.186)
 
       # Experimental Data
       y_exp, y_R_exp = np.loadtxt("../../ref_data/postProcessing/sampleDict/0/"+profiles[j]+"_U.xy", unpack=True, usecols=[1,7])

       y_exp_cut = (y_exp <= np.max(y_num)) & (y_exp >= np.min(y_num))
       indices = [i for i, x in enumerate(y_exp_cut) if x]
       
       y_exp_cut   = y_exp[indices]
       y_R_exp_cut = y_R_exp[indices]

       g = interp1d(y_num, y_R_num, bounds_error=False, fill_value='extrapolate')
       y_R_num_int = g(y_exp_cut)

       err_R_bor = mean_absolute_percentage_error(y_R_exp_cut, y_R_num_int)
       if (err_R_bor < 0):
	       err_R_bor = 9999
    except:
       err_R_bor = 9999

    print("err_R_bor: ",err_R_bor)

# *******************************************************************************

err_bor = err_U_bor + err_R_bor
print("err_bor =", err_bor)

# write the value of cost functions in output folder
cost_list = [err_U_bor, err_R_bor]
costs = [[0.0001] for i in range(2) for i in range(1)] 
for y in range(len(cost_list)):
    costs[y][0] = cost_list[y]
    np.savetxt("./output/" + "C" + str(y+1) + ".edf.gz", costs[y])

