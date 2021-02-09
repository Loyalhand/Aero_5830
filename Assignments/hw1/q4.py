def f(x):
    return x**4-x-10

def g(x):
    return (1.2-.99403)/(1.671*10**-4+9.7215*10**-8*x-9.5838*10**-11*x**2+1.952*10**-14*x**3)

tol = .000001

T_0 = 500

T_1 = g(T_0)

Tl = [T_0,T_1]

n = 0
while (abs(Tl[n+1]-Tl[n])/abs(Tl[n])) > tol or n<100:
    T_np1 = g(Tl[n+1])
    Tl.append(T_np1)
    n += 1

# keeps python console up; for non-IDE use
i = 1
while i == 1:
    i = input("Press enter to continue.\n")
