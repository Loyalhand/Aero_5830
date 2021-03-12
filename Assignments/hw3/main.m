clc
clear all
close all
 
format longg

A = [3 -.1 -.2;.1 7 -.3; .3 -.2 10];
b = [7.85;-19.3;71.4];
n = length(A);
x = [0;0;0];
imax = 3000;
es = 10^-9;
lambda = 1;

[x,w] = IM.gauSei(A,b,n,x,imax,es,lambda)
% for i = 1:n
%     dum = A(i,i)
%     for j = 1:n
%         A(i,j) = A(i,j)/dum
%     end
%     b(i) = b(i)/dum
% end
% for i = 1:n
%     sum = b(i)
%     for j = 1:n
%         if i~= j
%             sum = sum - A(i,j)*x(j)
%         end
%         x(i) = sum
%     end
% end
% iter = 1
% ea = 1000
% sen = 0
% while sen == 0
%     sen = 1
%     for i = 1:n
%         old = x(i)
%         sum = b(i)
%         for j = 1:n
%             if i~= j
%                 sum = sum - A(i,j)*x(j)
%             end
%         end
%         x(i) = lambda*sum + (1-lambda)*old
%         if sen == 1 && x(i) ~= 0
%             ea = abs((x(i)-old)/x(i))*100
%             if ea > es
%                 sen = 0
%             end
%         end
%         
%     end
%     iter = iter + 1
%     if iter >= imax
%         break
%     end
% end