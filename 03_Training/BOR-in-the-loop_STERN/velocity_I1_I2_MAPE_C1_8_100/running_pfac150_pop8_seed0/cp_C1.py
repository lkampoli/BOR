import os
import numpy as np

directory = './'

file_object = open('costs.txt', 'w')

costs = []

for filename in os.listdir(directory):
	try:
		C1 = np.loadtxt(filename + "/output/C1.edf.gz")
		costs.append(C1)
		C1_str = str(C1)
		filename_str = str(filename)
		print(filename_str, C1_str)
		file_object.write(filename_str)
		file_object.write("\n")
		file_object.write(C1_str)
		file_object.write("\n")
	except:
		print("No file found!") 
file_object.close()		

min_val, idx = min([(abs(val), idx) for (idx, val) in enumerate(costs)])
print(min_val, idx)
