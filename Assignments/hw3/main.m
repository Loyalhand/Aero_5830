clc
clear all
close all
 
format longg
%=========================================================================%
                      % q1
%=========================================================================%        
% n = 2
% A = Hilbert(n);
% b = ones(n,1);
% x = b;
% imax = 5000;
% es = 10^-8
% lambda = .1;
% i = 1;
% [x,w] = IM.gauSei(A,b,n,b,imax,es,lambda)
% while lambda < 2
%     [x,w] = IM.gauSei(A,b,n,b,imax,es,lambda)
%     y(i,1) = w(1,1);
%     y(i,2) = w(1,2);
%     lambda = lambda + .1
%     i = i + 1
% end
% 
% plot(y)
% xlabel("relaxation parameter")
% ylabel("number of iterations")
% 
% grid on 
%=========================================================================%
                      % q2
%=========================================================================%        

syms x1 x2 x3 x4 
p = -16;
kmax = 100;
f = symfun([4*x1-x2+x3-x1*x4 -x1+3*x2-2*x3-x2*x4 x1-2*x2+3*x3-x3*x4...
x1^2+x2^2+x3^2-1],[x1,x2,x3,x4]);
q = transpose([3,3,3,3]);
[q,k] = IM.newRap(f,q,p,kmax)


% fun = @root2d
% x0 = [1,1,1,1];
% x = fsolve(fun,x0)
% 
