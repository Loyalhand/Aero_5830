clc
clear all
close all
 
format longg

syms x1 x2 as
q1 = 2;
q2 = 2;
q0 = [q1;q2];
q = [q1;q2];
tol =10^-6;


k1 = 8;
k2 = 1;
P1 = 5;
P2 = 5 ;
l1 =10;
l2 = 10;
F = @(x1,x2) 1/2*k1*(sqrt(x1^2+(l1-x2)^2)-l1)^2+k2/2*(sqrt(x1^2+(l2+x2)^2)-l2)^2-P1*x1-P2*x2
h = mOpt.Steep(F,q0,10^-6)

% q1(1) = q0(1)
%             q2(1) = q0(2)
%             i=2
%             q1(2) = 10^99
%             q2(2) = 10^99
%             gradF(x1,x2) = gradient(F,[x1,x2])
%             s = @(x1,x2) -gradF(x1,x2)/norm(gradF(x1,x2));
%             while abs(F(q1(i),q2(i))-F(q1(i-1),q2(i-1)))>tol
%                 if q1(2) == 10^99
%                     q1(2) = q0(1);
%                     q2(2) = q0(2);
%                 end
%                 
%                 
%                 search = double(s(q1(i),q2(i)))
%                 fas(as) =  F(q1(i)+search(1)*as,q2(i)+search(2)*as)
%                 fas(-100)
%                 [xlow,w2,w1,xhigh] = onedOpt.Gold(0,2,0,10^-7,-fas);
%                 [alpha,y] = cubicFit(xlow,w2,w1,xhigh,-fas);
%                 
%                 q = q + alpha(1)*search;
%                 q1(i+1) = q(1);
%                 q2(i+1) = q(2);
%                 i = i + 1;
%                 search 
%                 alpha(1)
%                 q
%             end