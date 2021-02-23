%{
 2/18/2020
 Matthew Pahayo
 file Name: pivotingTemplate.m
%}
clc
clear all
close all

format longg

a = [1 1 ;2 100000];
b = [2;100000];
n = length(a);
 
k = 1 
p = k 

[L,U] = LUdecompCrout(a)

%***************************************************
% forward substitution 
%***************************************************
for i = 2:n
    sum = b(i)
    for j = 1:i-1
        sum = sum - a(i,j)*b(j)
    end
    b(i) = sum
end
D = b

%***************************************************
% back substitution 
%***************************************************
x(n,1) = b(n)/a(n,n)
for i = n-1:-1:1
    sum = b(i)
   for j = i + 1:n
       sum = sum - a(i,j)*x(j,1)
   end
   x(i,1) = sum/a(i,i)
end








% big = abs(a(k,k))
% 
% %***************************************************
% % pivoting portion 
% %***************************************************
% for ii=k+1:n
%     dummy = abs(a(ii,k))
%     if dummy > big
%        big = dummy
%        p = ii 
%     end
% end
% if p ~= k
%     for jj = k:n
%         dummy = a(p,jj)
%         a(p,jj) = a(k,jj)
%         a(k,jj) = dummy
%     end
%     dummy = b(p)
%     b(p)=b(k)
%     b(k) = dummy
% end
% 
% %***************************************************
% % elimination step 
% %***************************************************
% for k=1:(n-1)
%     for i=k+1:n
%         factor = a(i,k)/a(k,k)
%        for j=k+1:n
%            a(i,j) = a(i,j) - factor*a(k,j)
%        end
%        b(i) = b(i) - factor*b(k)
%     end
% end
% 
