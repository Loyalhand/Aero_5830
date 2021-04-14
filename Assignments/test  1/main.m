clc
clear all
close all
 
format longg

syms x1 x2 x3 x4 as
%=========================================================================%
                      % q2
%=========================================================================%

% F = @(x1,x2,x3,x4) cos(x1^2-x2)+sin(x1^2+x2^2)
% gradF(x1,x2,x3,x4) = gradient(F,[x1,x2,x3,x4])
% s = @(x1,x2,x3,x4) -gradF(x1,x2,x3,x4)
% search = double(s(.1,-.1,0,0))
% fas(as) =  F(.1+search(1)*as,-.1+search(2)*as,search(3)*as,search(4)*as)
% [xlow,w2,w1,xhigh] = onedOpt.Gold(0,1.2,20,10^-8,-fas)
% 
% diff(fas)

%=========================================================================%
                      % q3
%=========================================================================%

theta = 1
q0 = [1;1;0;0]
F = @(x1,x2,x3,x4) 1/30*(8*x1^2-x1*x2+.5*x2^2)+x1*exp(-x1^2-x2^2)
[Fq,q,iter,PE,q1,q2] = mOpt.BFGS(F,q0,theta,10^-6);
[Fs,qs,iters,PEs,q1s,q2s] = mOpt.Steep(F,q0,10^-6);

hold on
plot(1:length(PEs),PEs)
plot(1:length(PE),PE)
xlabel('Iterations')
legend('Steepest Descent','BFGS')
ylabel('F({x})')
title('Convergence history of the objective function')
grid on 