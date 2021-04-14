clc
clear all
close all
 
format longg

syms x1 x2 x3 x4 as 
q1 = 1;
q2 = 1;
q3 = 0;
q4 = 0;
q0 = [q1;q2;q3;q4];
tol =10^-10;
k1 = 8;
k2 = 1;
P1 = 5;
P2 = 5 ;
l1 =10;
l2 = 10;
theta = 1;

% F = @(x1,x2,x3,x4) 1/2*k1*(sqrt(x1^2+(l1-x2)^2)-l1)^2+k2/2*(sqrt(x1^2+(l2+x2)^2)-l2)^2-P1*x1-P2*x2;
% 
% % [Fq,q,iter,PE] = mOpt.BFGS(F,q0,theta,10^-6)
% [Fs,qs,iters,PEs] = mOpt.Steep(F,q0,10^-6)

% hold on
% plot(1:length(PEs),PEs)
% plot(1:length(PE),PE)
% xlabel('Iterations')
% legend('Steepest Descent','BFGS')
% ylabel('PE')
% title('Convergence history of the objective function')
% grid on 
% 
% x0 = [1;1;1;1]
% F = @(x1,x2,x3,x4) (4*x1-x2+x3-x1*x4)^2+ ...
%     (-x1+3*x2-2*x3-x2*x4)^2 + (x1-2*x3+3*x3-x3*x4)^2 + ...
%     (x1^2+x2^2+x3^2-1)^2
% [Fq,q,iter,PE] = mOpt.BFGS(F,x0,theta,tol)
% [Fq,q,iter,PE] = mOpt.Steep(F,x0,tol)
options = optimoptions('fminunc','Algorithm','quasi-newton');
fun = @(x) 1/30*(8*x(1)^2-x(1)*x(2)+.5*x(2)^2)+x(1)*exp(-x(1)^2-x(2)^2)
q0 = [1;1]
options.Display = 'iter';
[x, fval, exitflag, output] = fminunc(fun,q0,options);
