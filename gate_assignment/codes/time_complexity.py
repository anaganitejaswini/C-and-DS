import numpy as np
import matplotlib.pyplot as plt

#If using termux
import subprocess
import shlex

enqueue_time = np.loadtxt('../data/enqueue.dat')
dequeue_time = np.loadtxt('../data/dequeue.dat')

n1 = len(enqueue_time)
n2 = len(dequeue_time)

en_start = enqueue_time[:-1]
en_end = enqueue_time[1:]


plt.figure()
plt.plot(np.arange(1000),(en_end-en_start))
plt.title("Enqueue")
plt.grid()
plt.xlabel("n")
plt.ylabel("Time in seconds")
# If using termux
plt.savefig('../figs/enqueue.eps')
plt.savefig('../figs/enqueue.pdf')

plt.figure(2)
plt.plot(np.linspace(499,1000,500),(dequeue_time[1:]))
plt.title("Dequeue")
plt.grid()
plt.xlabel("n")
plt.ylabel("Time in seconds")
# If using termux
plt.savefig('../figs/dequeue.eps')
plt.savefig('../figs/dequeue.pdf')

#else
plt.show()

