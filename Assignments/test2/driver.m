% main.m
clc
clear all
close all
format longg

%=========================================================================
                                %q1
%=========================================================================                                

% fun = @(x) x^2*sin(x)-2*x;
% fp(1,1) = fwd_fprimeO3(fun,-3,.1);
% fp(2,1) = fwd_fprimeO3(fun,-3,.01);
% fp(3,1) = fwd_fprimeO3(fun,-3,.001);
% h(1,1) = .1;
% h(2,1) = .01;
% h(3,1) = .001;
% exact = -10.063212421;
% err(1,1) = abs(exact-fp(1,1));
% err(2,1) = abs(exact-fp(2,1));
% err(3,1) = abs(exact-fp(3,1));
% 
% [h fp err]

%=========================================================================
                                %q2
%=========================================================================
% fun = @(x) x.^2.*sin(x)-2.*x;
% syms p 
% xend = 3
% xstart = -3
% b = xend - xstart
% intervals = 13
% n = intervals
% x = transpose(xstart:(xend-xstart)/intervals:xend)
% g = fun(x)
% pNC = (Spline.NC(g,n,x))
% spline = sym(zeros(b*100+1,1));
% err = spline;
% i = xstart ;
% j=1;
% while(true)
%     if i>=-3 && i<xstart+b/n
%         spline(j) = subs(pNC(1),p,i);
%     end
%     if i>=xstart+b/n && i<xstart+2*b/n
%         spline(j) = subs(pNC(2),p,i);
%     end
%     if i>=xstart+2*b/n && i<xstart+3*b/n
%         spline(j) = subs(pNC(3),p,i);
%     end    
%     if i>=xstart+3*b/n && i<xstart+4*b/n
%         spline(j) = subs(pNC(4),p,i);
%     end    
%     if i>=xstart+4*b/n && i<xstart+5*b/n
%         spline(j) = subs(pNC(5),p,i);
%     end    
%     if i>=xstart+5*b/n && i<xstart+6*b/n
%         spline(j) = subs(pNC(6),p,i);
%     end
%     if i>=xstart+6*b/n && i<xstart+7*b/n
%         spline(j) = subs(pNC(7),p,i);
%     end    
%     if i>=xstart+7*b/n && i<xstart+8*b/n
%         spline(j) = subs(pNC(8),p,i);
%     end    
%     if i>=xstart+8*b/n && i<xstart+9*b/n
%         spline(j) = subs(pNC(9),p,i);
%     end    
%     if i>=xstart+9*b/n && i<xstart+10*b/n
%         spline(j) = subs(pNC(10),p,i);
%     end    
%     if i>=xstart+10*b/n && i<xstart+11*b/n
%         spline(j) = subs(pNC(11),p,i);
%     end    
%     if i>=xstart+11*b/n && i<xstart+12*b/n
%         spline(j) = subs(pNC(12),p,i);
%     end        
%     if i>=xstart+12*b/n && i<xstart+13*b/n
%         spline(j) = subs(pNC(13),p,i);
%     end    
%     i=i+.01;
%     j =j+1;
%     if i>=b
%         break;
%     end
%     
% end

%=========================================================================
                                %q3
%=========================================================================
% syms x
% f = @(y) (2*x^5+x^2/3+x)*(y^3-y/4+1)
% g(x) = gaussQuad(f,0,3,2)
% I = gaussQuad(g,0,2,3)
% double(I)

%=========================================================================
                                %q4
%=========================================================================

syms t 
f(t) = sqrt(4-3*exp(-t^2));
xi = 0;
yi = 1;
h = .1;
steps = 25+1;

[xRK4,yRK4] = RK4(xi,yi,h,steps);
[xe,ye] = Euler(xi,yi,h,steps);
[xab2,yab2] = AB2(xi,yi,h,steps);

figure (1)
hold on 
fplot(f)
plot(xRK4,yRK4)
plot(xe,ye)
plot(xab2,yab2)
xlim([xi 2.5])
grid on 
xlabel('t')
ylabel('f(t)')
title('ODE approximations')
legend('Exact','RK4','Euler','AB2')

x = transpose(0:.1:2.5);
exact = zeros(steps,1);
for i = 1:steps
    exact(i,1) = f(x(i,1));
end

errRK4 = abs(yRK4-exact);
errAB2 = abs(yab2-exact);
errE = abs(ye-exact);
tab = [x exact yRK4 errRK4 yab2 errAB2 ye errE];
figure (2)
hold on 
plot(xRK4,errRK4)
plot(xe,errE)
plot(xab2,errAB2)
xlim([xi 2.5])
grid on 
xlabel('t')
ylabel('Absolute Error')
title('ODE Error')
legend('RK4','Euler','AB2')

figure (4)
hold on 
plot(xRK4,errRK4)
xlim([xi 2.5])
grid on 
xlabel('t')
ylabel('Absolute Error')
title('RK4 Error')
