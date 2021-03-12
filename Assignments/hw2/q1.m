%{
 2/28/2020
 Matthew Pahayo
 file Name: q1a.m
%}
clc
clear all
close all

format longg

a = [27.58 7.004 -7.004 0 0;...
     7.004 29.57 -5.253 0 -24.32;...
     -7.004 -5.253 29.57 0 0;...
     0 0 0 27.58 -7.004;...
     30 -24.32 0 -7.004 29.57]; 

b = transpose([0 0 0 0 -45]);
n = length(a);
 
k = 1 ;
p = k ;
big = abs(a(k,k));

%***************************************************
% pivoting portion 
%***************************************************
for ii=k+1:n
    dummy = abs(a(ii,k));
    if dummy > big
       big = dummy;
       p = ii ;
    end
end
if p ~= k
    for jj = k:n
        dummy = a(p,jj);
        a(p,jj) = a(k,jj);
        a(k,jj) = dummy;
    end
    dummy = b(p);
    b(p)=b(k);
    b(k) = dummy;
end

%***************************************************
% elimination step 
%***************************************************
for k=1:(n-1)
    for i=k+1:n
        factor = a(i,k)/a(k,k);
       for j=k+1:n
           a(i,j) = a(i,j) - factor*a(k,j);
       end
       b(i) = b(i) - factor*b(k);
    end
end

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
%}