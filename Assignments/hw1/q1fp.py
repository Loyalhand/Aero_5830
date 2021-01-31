import csv

a = 1 
b = 10
tol = .0000001
cl = [a, b]
fl = []
eps = []

def f(x):
    return x**2 - 4 

i = 0
while abs(cl[i+1] - cl[i])/abs(cl[i]) >= tol:
    c = b-f(b)*(b-a)/(f(b)-f(a))
    eps.append(cl[i+1] - cl[i])
    if f(c) > 0:
        b = c
    if f(c) < 0:
        a = c 
    cl.append(c)
    fl.append(f(c))
    i += 1



print(c)
n = 1
while n == 1:
    n = input("Press enter to continue.")