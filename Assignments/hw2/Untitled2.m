% 2/11/2020
% Matthew Pahayo
% hw 1 
% % q3 plot
% file Name: plt.m

clc
clear all
close all

a = [3 -.1 -.2;.1 7 -.3; .3 -.2 10];
b = [7.85;-19.3;71.4];
n = length(a);


for k=1:(n-1)
    for i=k+1:n
        factor = a(i,k)/a(k,k)
       for j=k+1:n
           a(i,j) = a(i,j) - factor*a(k,j)
       end
       b(i) = b(i) - factor*b(k)
    end
end
x(n,1) = b(n)/a(n,n)
for i = n-1:-1:1
    sum = b(i)
   for j = i + 1:n
       sum = sum - a(i,j)*x(j,1)
   end
   x(i,1) = sum/a(i,i)
end