import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

conv_ecut, conv_etot, conv_ef, conv_stress = [], [], [], []
data = pd.read_csv('reference.txt', header=None, delimiter=' ')
ecut, etot, ef, stress = data.iloc[:, 0], data.iloc[:, 1], data.iloc[:, 2], data.iloc[:, 3]

etot_end = etot.iloc[-1]
ef_end = ef.iloc[-1]
stress_end = stress.iloc[-1]
conv_etot = np.abs((etot - etot_end) / etot_end)
conv_ef = np.abs((ef - ef_end) / ef_end)
conv_stress = np.abs((stress - stress_end) / stress_end)
    
print(conv_etot, conv_ef, conv_stress)
# plt.yscale('log')
plt.legend(['Energy', 'Force', 'Stress'], loc='best')
plt.xlabel('Ecut')
plt.ylabel(r'$|\frac{x_{conv} - x_i}{x_{conv}}|$')
plt.plot(ecut, conv_etot, 'b', ecut, conv_ef, 'g', ecut, conv_stress, 'r')
plt.show()
