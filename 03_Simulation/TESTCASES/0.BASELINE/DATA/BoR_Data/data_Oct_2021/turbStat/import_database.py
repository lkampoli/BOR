# https://jakevdp.github.io/PythonDataScienceHandbook/04.14-visualization-with-seaborn.html
# https://tryolabs.com/blog/2017/03/16/pandas-seaborn-a-guide-to-handle-visualize-data-elegantly
# https://seaborn.pydata.org/tutorial/introduction

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
sns.set()
#plt.style.use('classic')

infile_csv = 'BoRDataCompilation_Medium.csv'

data = pd.read_csv(infile_csv, header=0, delim_whitespace=False)
df = data

print(data.shape)
print(data)

D      = 38.1 / 1000 # pipe diameter, m
R      = D / 2       # pipe radius, m
Ub     = 4.1         # bulk velocity, m/s
utau   = 0.186       # friction velocity, m/s
nu     = 1.0035e-06  # kinematic viscosity, m^2/s
Re_D   = 156000
Re_tau = 3550

# iterating the columns
for col in data.columns:
    print(col)

data.hist(column='x/R')
data.hist(column='r/R')
data.hist(column='y/R')
data.hist(column='Ux')
data.hist(column='Ur')
data.hist(column='<ux^2>')
data.hist(column='<ur^2>')
data.hist(column='<uxur>')

#with sns.axes_style('white'):
#    sns.jointplot("x/R", "r/R", data, kind='kde');

#sns.pairplot(data, hue='<uxur>', size=2.5);

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(data['x/R'], data['r/R'], data['Ux'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('Ux')
plt.savefig("Ux.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(data['x/R'], data['r/R'], data['Ur'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('Ur')
plt.savefig("Ur.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(data['x/R'], data['r/R'], data['<ux^2>'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('<ux^2>')
plt.savefig("Rxx.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(data['x/R'], data['r/R'], data['<ur^2>'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('<ur^2>')
plt.savefig("Rrr.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(data['x/R'], data['r/R'], data['<uxur>'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('<uxur>')
plt.savefig("Rxr.png", dpi=150)
plt.show()
plt.close()

#-------------------------------

subdata = data[data['x/R']<=20.]

#-------------------------------

subdata

#-------------------------------

X   = subdata['x/R'].to_numpy()
Y   = subdata['r/R'].to_numpy()
Rrr = subdata['<ur^2>'].to_numpy()
Rxx = subdata['<ux^2>'].to_numpy()
Rxr = subdata['<uxur>'].to_numpy()

points = np.transpose(np.vstack([X, Y, np.zeros(X.shape)]))
outputfile = 'XYZ.txt'
np.savetxt(outputfile, points)

fac = (utau*utau) / (Ub*Ub)
R_exp = np.transpose(np.vstack([Rxx * fac, Rxr * fac, np.zeros(Rxx.shape), Rrr * fac, np.zeros(Rxx.shape), np.zeros(Rxx.shape)]))

np.savetxt('Rrr.txt', Rrr * (utau*utau) / (Ub*Ub))
np.savetxt('Rxx.txt', Rxx * (utau*utau) / (Ub*Ub))
np.savetxt('Rxr.txt', Rxr * (utau*utau) / (Ub*Ub))

#-------------------------------

fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.scatter(X,Y,Rxr)

#-------------------------------

df

#-------------------------------

df.rename(columns = {'x/R':'x', 'r/R':'r', 'y/R':'y', 'Ux':'ux', 'Ur':'ur', '<ux^2>':'tau_xx', '<ur^2>':'tau_rr', '<uxur>':'tau_xr'}, inplace = True)

#-------------------------------

df['x'] = df['x'] * R
df['r'] = df['r'] * R
df['y'] = df['y'] * R
df['ux'] = df['ux'] * Ub
df['ur'] = df['ur'] * Ub
df['tau_xx'] = df['tau_xx'] * (Ub * Ub) / (utau * utau)
df['tau_rr'] = df['tau_rr'] * (Ub * Ub) / (utau * utau)
df['tau_xr'] = df['tau_xr'] * (Ub * Ub) / (utau * utau)

#-------------------------------

df

#-------------------------------

# iterating the columns
for col in df.columns:
    print(col)

df.hist(column='x')
df.hist(column='r')
df.hist(column='y')
df.hist(column='ux')
df.hist(column='ur')
df.hist(column='tau_xx')
df.hist(column='tau_rr')
df.hist(column='tau_xr')

#with sns.axes_style('white'):
#    sns.jointplot("x/R", "r/R", data, kind='kde');

#sns.pairplot(data, hue='<uxur>', size=2.5);

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(df['x'], df['r'], df['ux'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('ux')
plt.savefig("ux.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(df['x'], df['r'], df['ur'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('ur')
plt.savefig("ur.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(df['x'], df['r'], df['tau_xx'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('tau_xx')
plt.savefig("tau_xx.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(df['x'], df['r'], df['tau_rr'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('tau_rr')
plt.savefig("tau_rr.png", dpi=150)
plt.show()
plt.close()

fig = plt.figure(figsize=(20,15))
ax1 = fig.add_subplot(111)
f = ax1.tricontourf(df['x'], df['r'], df['tau_xr'], levels=50)
ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_aspect(4.5)
plt.title('tau_xr')
plt.savefig("tau_xr.png", dpi=150)
plt.show()
plt.close()

#-------------------------------

F_csv = 'F.csv'
R_csv = 'R.csv'
F = pd.read_csv(F_csv, header=0, delim_whitespace=False)
R = pd.read_csv(R_csv, header=0, delim_whitespace=False)
print(F.shape, R.shape)
print(F, R)

#-------------------------------

fig = plt.figure(figsize=(20,15))
plt.scatter(subdata['x/R'], subdata['<uxur>'], s=10, c='r', marker='o', label='EXP')
plt.scatter(subdata['x/R'], F['RXY'] * (Ub*Ub)/(utau*utau), s=10, c='g', marker='x', label='OF aij')
plt.scatter(subdata['x/R'], R['RXY'] * (Ub*Ub)/(utau*utau), s=10, c='b', marker='x', label='OF R')
plt.legend()
plt.grid(True)
plt.show()
plt.close()

#-------------------------------

fig = plt.figure(figsize=(20,15))
plt.scatter(subdata['x/R'], subdata['<ux^2>'], s=10, c='r', marker='o', label='EXP')
plt.scatter(subdata['x/R'], F['RXX'] * (Ub*Ub)/(utau*utau), s=10, c='g', marker='x', label='OF aij')
plt.scatter(subdata['x/R'], R['RXX'] * (Ub*Ub)/(utau*utau), s=10, c='b', marker='x', label='OF R')
plt.legend()
plt.grid(True)
plt.show()
plt.close()

#-------------------------------

fig = plt.figure(figsize=(20,15))
plt.scatter(subdata['x/R'], subdata['<ur^2>'], s=10, c='r', marker='o', label='EXP')
plt.scatter(subdata['x/R'], F['RYY'] * (Ub*Ub)/(utau*utau), s=10, c='g', marker='x', label='OF aij')
plt.scatter(subdata['x/R'], R['RYY'] * (Ub*Ub)/(utau*utau), s=10, c='b', marker='x', label='OF R')
plt.legend()
plt.grid(True)
plt.show()
plt.close()

#-------------------------------

#ratio = F['RYY']/R['RYY']
#for i in range(1, ratio.shape[0]):
#    print(ratio[i])

#-------------------------------

fig = plt.figure(figsize=(20,15))
plt.scatter(subdata['x/R'], subdata['<uxur>'] * (utau*utau) / (Ub*Ub) , s=10, c='r', marker='o', label='EXP')
plt.scatter(subdata['x/R'], F['RXY'], s=10, c='g', marker='x', label='OF')
plt.legend()
plt.grid(True)
plt.show()
plt.close()

#-------------------------------

fig = plt.figure(figsize=(20,15))
plt.scatter(subdata['x/R'], subdata['<ux^2>'] * (utau*utau) / (Ub*Ub) , s=10, c='r', marker='o', label='EXP')
plt.scatter(subdata['x/R'], F['RXX'], s=10, c='g', marker='x', label='OF')
plt.legend()
plt.grid(True)
plt.show()
plt.close()

#-------------------------------

fig = plt.figure(figsize=(20,15))
plt.scatter(subdata['x/R'], subdata['<ur^2>'] * (utau*utau) / (Ub*Ub) , s=10, c='r', marker='o', label='EXP')
plt.scatter(subdata['x/R'], F['RYY'], s=10, c='g', marker='x', label='OF')
plt.legend()
plt.grid(True)
plt.show()
plt.close()

#-------------------------------


