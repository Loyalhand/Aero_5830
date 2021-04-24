function f = Lagran(x,y,n,xx)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


sum = 0;
for i = 1:n+1
    product = y(i,1);
    for j = 1:n+1
        if i~=j
            product = product*(xx-x(j,1))/(x(i,1)-x(j,1));
        end
    end
    sum = sum + product;
end
f = sum;
end
