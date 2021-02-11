# Matthew Pahayo
# 2/11/2021
# computational methods
# hw 1
# question 1 
# false position
# q1_fp.py

import numpy as nu

def f(x):
    f = 2*nu.sin(x**2)-3*nu.sin(x**2)+x**2*nu.sin(x**2)
    return f

a = 3.2
b = 3.8
tol = .00000001
cl = [a, b]
fl = [f(a), f(b)]
eps = []

i = 0
while abs(cl[i+1] - cl[i])/abs(cl[i]) >= tol:
    c = b-f(b)*(b-a)/(f(b)-f(a))
    eps.append(abs(cl[i+1] - cl[i])/abs(cl[i]))
    if f(c)*f(b) > 0:
        b = c
    if f(c)*f(b) < 0:
        a = c 
    cl.append(c)
    fl.append(f(c))
    i += 1

eps.append(abs(cl[i+1] - cl[i])/abs(cl[i]))

i=0
data_fl = open("fl.txt", "a")
data_cl = open("cl.txt", "a")
for i in range(len(cl)):
    data_cl.write(str(cl[i]) + "\n")
for g in range(len(fl)):
    data_fl.write(str(fl[g]) + "\n")
data_cl.close()
data_fl.close()

i = 0 
data_eps = open("eps.txt", "a")
for i in range(len(eps)):
    data_eps.write(str(eps[i]) + "\n")
data_eps.close()

print(c)
n = 1
while n == 1:
    n = input("Press enter to continue.")