# Matthew Pahayo
# 2/11/2021
# computational methods
# hw 1
# question 2 
# secant method
# q2.py

import numpy as np

def f(x):
    gam = 1.4
    P0r = 1
    return (1+(2*gam)/(gam+1)*(x**2-1))**(-1/(gam-1))*((2+(gam-1)*x**2)/(((gam+1))*x**2))**(-gam/(gam-1))-P0r

# define tol, guess a_0 and a_1
# a_0 != 0, because of stopping criteria
tol = 10**-8
a_0 = 2.8
a_1 = 2.2

# declare lists
al = [a_0, a_1]
fl = [f(a_0), f(a_1)]
dal = []

# secant method
# evaluates function at a_n
n = 0
while (abs(al[n+1]-al[n])/abs(al[n])) > tol:
    if (f(al[n+1])-f(al[n]))*((al[n+1])-al[n]) ==0:
        break
    a_np1 = al[n+1] - f(al[n+1])/(f(al[n+1])-f(al[n]))*((al[n+1])-al[n])
    al.append(a_np1)
    fl.append(f(al[n]))
    n += 1

# defines dal list 
for k in range(len(al)-1):
    dal.append(al[k+1]-al[k])

i=0
data_fl = open("fl.txt", "a")
data_al = open("al.txt", "a")
for i in range(len(al)):
    data_al.write(str(al[i]) + "\n")
    data_fl.write(str(fl[i]) + "\n")
data_al.close()
data_fl.close()

i = 0 
data_dal = open("dal.txt", "a")
for i in range(len(dal)):
    data_dal.write(str(dal[i]) + "\n")
data_dal.close()


print("a = " + str(a_np1))
print("total iterations = " + str(n))
print("final delta a = " + str(dal[n-1]))