a = 0 
b = 1
tol = .0000001

def f(x):
    return x**3 + 2*x - 2 

while (b-a)/2 >= tol:
    c = b-f(b)*(b-a)/(f(b)-f(a))
    if f(c)>0:
        b = c
    if f(c)<0:
        a = c 

x = (a+b)/2
print(x)
