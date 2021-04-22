% main.m

x = [1;4;6]
y = [0;1.386294;1.79176]
xx = 2
n = 2

sum = 0
for i = 1:n+1
    product = y(i,1) 
    for j = 1:n+1
        if i~=j
            product = product*(xx-x(j,1))/(x(i,1)-x(j,1))
        end
    end
    sum = sum + product
end
f = sum