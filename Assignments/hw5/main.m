clc
clear all
close all
 
format longg

syms x1 x2 as
q1 = -4;
q2 = 5;
q0 = [q1;q2];
q = [q1;q2];
tol =10^-10;
k1 = 8;
k2 = 1;
P1 = 5;
P2 = 5 ;
l1 =10;
l2 = 10;
theta = 1;

F = @(x1,x2) 1/2*k1*(sqrt(x1^2+(l1-x2)^2)-l1)^2+k2/2*(sqrt(x1^2+(l2+x2)^2)-l2)^2-P1*x1-P2*x2;

[Fq,q,iter,PE] = mOpt.BFGS(F,q0,theta,10^-6)
[Fs,qs,iters,PEs] = mOpt.Steep(F,q0,10^-6)

plot(length(PE),PE)
xlabel('Iterations')
ylabel('PE')
title('Convergence history of the objective function')
grid on 
