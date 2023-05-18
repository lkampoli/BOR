#export MPLBACKEND=agg
import matplotlib
#matplotlib.use('Agg')
import matplotlib.pyplot as plt
import pandas as pd


df = pd.read_csv('study_log_data_algo1.csv')
print(df)

x = df['gen']
y = df['minFit']

plt.plot(x,y)
plt.savefig('gen_minFit.png')
plt.show()
plt.close()
