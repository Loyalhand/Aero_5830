




a = 0 
b = 1
tol = .0000001

def f(x):
    return x**3 + 2*x - 2 

c1 = b-f(b)*(b-a)/(f(b)-f(a))
cl = [c1]
if f(c1) > 0:
        b = c1
if f(c1) < 0:
        a = c1 

c2 = b-f(b)*(b-a)/(f(b)-f(a))
if f(c2) > 0:
        b = c2
if f(c2) < 0:
        a = c2 
cl.append(c2)

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