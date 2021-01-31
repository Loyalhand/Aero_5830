import numpy as np

def f(x):
    return np.cosh(x)*np.cos(x)+1

# define tol, guess a_0 and a_1
# a_0 != 0 
tol = .001
a_0 = 3.8
a_1 = 5

# declare lists
al = [a_0, a_1]
fl = []
dal = []

# secant method
# evaluates function at a_n
n = 0
while (abs(al[n+1]-al[n])/abs(al[n])) > tol:
    a_np1 = al[n+1] - f(al[n+1])/(f(al[n+1])-f(al[n]))*((al[n+1])-al[n])
    al.append(a_np1)
    fl.append(f(al[n]))
    n += 1

# defines dal list 
for k in range(len(al)-1):
    dal.append(al[k+1]-al[k])

print("a = " + str(a_np1))
print("total iterations = " + str(n))
print("final delta a = " + str(dal[n-1]))