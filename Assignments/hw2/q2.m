%{
 2/25/2020
 Matthew Pahayo
 file Name: q2.m
%}
clc
clear all
close all

format longg

a = [3 -.1 -.2 ;.1 7 -.3;.3 -.2 10];
b = [7.85;-19.3;71.4];
n = length(a);
a
%***************************************************
% modified A
%***************************************************
for i = 1:n
    o(i) = i;
    s(i) = abs(a(i,1));
    for j = 2:n
        if abs(a(i,j))>s(i)
            s(i) = abs(a(i,j));
        end
    end
end
for k = 1:n-1
    for i = 1+k:n
        factor = a(o(i),k)/a(o(k),k);
        a(o(i),k) = factor ;
        for j = k+1:n
            a(o(i),j) = a(o(i),j) - factor*a(o(k),j);
        end
    end
end

%***************************************************
% get L and U 
%***************************************************
for i = 1:n
    L(i,1) = a(i,1);
    U(i,i) = 1;
end
for k = 1:n
    for j = k:n
        U(k,j) = a(k,j);
    end
end
for i = 1:n
    for j = 1:i
        L(i,j) = a(i,j);
    end 
end
(L)
(U)
%***************************************************
% forward substitution 
%***************************************************
for i = 2:n
    sum = b(i);
    for j = 1:i-1
        sum = sum - a(i,j)*b(j);
    end
    b(i) = sum;
end
D = b

%***************************************************
% back substitution 
%***************************************************
x(n,1) = b(n)/a(n,n);
for i = n-1:-1:1
    sum = b(i);
   for j = i + 1:n
       sum = sum - a(i,j)*x(j,1);
   end
   x(i,1) = sum/a(i,i);
end
x