clc
clear all
close all
 
format longg

syms x1 x2 as
q1 = -4;
q2 = 5;
q0 = [q1;q2];
q = [q1;q2];
tol =10^-6;


k1 = 8;
k2 = 1;
P1 = 5;
P2 = 5 ;
l1 =10;
l2 = 10;
theta = 1 
F = @(x1,x2) 1/2*k1*(sqrt(x1^2+(l1-x2)^2)-l1)^2+k2/2*(sqrt(x1^2+(l2+x2)^2)-l2)^2-P1*x1-P2*x2
% F = @(x1,x2) x1^2+1/x1+x2+1/x2^2

% h = mOpt.BFGS(F,q0,theta,10^-6)



h = mOpt.Steep(F,q0,10^-6)
% 
%             q1(1) = q0(1)
%             q2(1) = q0(2)
%             i=2
%             q1(2) = 10^99
%             q2(2) = 10^99
%             gradF(x1,x2) = gradient(F,[x1,x2])
%             s = @(x1,x2) -gradF(x1,x2)/norm(gradF(x1,x2));
%             
%             H = eye(2)
%             D = 0
%             while abs(F(q1(i),q2(i))-F(q1(i-1),q2(i-1)))>tol
%                 if q1(2) == 10^99
%                     q1(2) = q0(1);
%                     q2(2) = q0(2);
%                 end
%                 if i >2
%             p = [q1(i)-q1(i-1);q2(i)-q2(i-1)]
%             y = double(gradF(q1(i),q2(i))-gradF(q1(i-1),q2(i-1)))
%             sigma = transpose(p)*y
%             tau = transpose(y)*H*y
%             
%             D = (sigma+theta*tau)/sigma^2*p*transpose(p)...
%                 +(theta-1)/tau*H*y*transpose(H*y)-...
%                 theta/tau*(H*y*transpose(p)+p*transpose(H*y))
%                 end
%                 H = H + D
%                 search = double(-H*gradF(q1(i-1),q2(i-1))/norm(-H*gradF(q1(i-1),q2(i-1))))
%             
%            
%              
%                 fas(as) =  F(q1(i)+search(1)*as,q2(i)+search(2)*as);
%                 [xlow,w2,w1,xhigh] = onedOpt.Gold(0,2,0,10^-7,-fas);
%                 [alpha,y] = cubicFit(xlow,w2,w1,xhigh,-fas);
%                 q = q + alpha(1)*search;
%                 q1(i+1) = q(1);
%                 q2(i+1) = q(2);
%                 i = i + 1;
%             
%             end
            
            
            
            
            
            
            
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