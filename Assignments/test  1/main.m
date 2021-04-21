clc
clear all
close all
 
format longg

syms x1 x2 x3 x4 as
%=========================================================================%
                      % q2
%=========================================================================%

F = @(x1,x2,x3,x4) cos(x1^2-x2)+sin(x1^2+x2^2)
gradF(x1,x2,x3,x4) = gradient(F,[x1,x2,x3,x4])
s = @(x1,x2,x3,x4) -gradF(x1,x2,x3,x4)
search = double(s(.1,-.1,0,0))
fas(as) =  F(.1+search(1)*as,-.1+search(2)*as,search(3)*as,search(4)*as)
[xlow,w2,w1,xhigh] = onedOpt.Gold(0,1.2,20,10^-8,-fas)
[x,y] = cubicFit(xlow,w2,w1,xhigh,fas)
diff(fas)

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

%=========================================================================%
                      % q4
%=========================================================================%
 
x0 = [1;1;1;1];
imax = 400;
es = 10^-8;
lambda = 1;

n=3;
p=1;
q=4;
A = [1 1.14 1.24139863500022 1.38314240165432;1 1.925 3.70937912842696 7.14417091585262;...
     1 3.074 9.44963061390331 29.0484021516244;1 3.886 15.0995916226695 58.6742845308687];

b = zeros(n+1,1);
x = b;
i=0;
while i<n+1
    x(i+1) = (p+q)/2+(p-q)/2*cos(((2*(i)+1)/(2*n+2))*pi);
    b(i+1) = 1/(1+x(i+1)+x(i+1)^2);
    i=i+1;
end

 y = gauss(A,b)
 [w,z] = IM.gauSei(A,b,n+1,x0,imax,es,lambda)
 
