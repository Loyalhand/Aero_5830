a = 0 
b = 10
tol = .0000001
cl = [a,b]

def f(x):
    return x**3 + 2*x - 2 

i = 1
while abs(cl[i] - cl[i-1]) >= tol:
    c = b-f(b)*(b-a)/(f(b)-f(a))
    if f(c) > 0:
        b = c
    if f(c) < 0:
        a = c 
    cl.append(c)
    i += 1

print(c)
n = 1
while n == 1:
    n = input("Press enter to continue.")