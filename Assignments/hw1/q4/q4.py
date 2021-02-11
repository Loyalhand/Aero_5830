# Matthew Pahayo
# 2/11/2021
# computational methods
# hw 1
# question 4
# fixed point
# q4.py

def g(x):
    return (1.2-.99403)/(1.671*10**-4+9.7215*10**-8*x-9.5838*10**-11*x**2+1.952*10**-14*x**3)

tol = 10**-5
T_0 = 500
T_1 = g(T_0)

Tl = [T_0,T_1]
fl = [g(T_0),g(T_1)]
eps = []

n = 0
while (abs(Tl[n+1]-Tl[n])/abs(Tl[n])) > tol and n<99:
    T_np1 = g(Tl[n+1])
    Tl.append(T_np1)
    fl.append(T_np1)
    eps.append((abs(Tl[n+1]-Tl[n])/abs(Tl[n])))
    n += 1

i=0
data_fl = open("fl.txt", "a")
data_Tl = open("cl.txt", "a")
for i in range(len(Tl)):
    data_Tl.write(str(Tl[i]) + "\n")
for g in range(len(fl)):
    data_fl.write(str(fl[g]) + "\n")
data_Tl.close()
data_fl.close()

i = 0 
data_eps = open("eps.txt", "a")
for i in range(len(eps)):
    data_eps.write(str(eps[i]) + "\n")
data_eps.close()

# keeps python console up; for non-IDE use
i = 1
while i == 1:
    i = input("Press enter to continue.\n")
