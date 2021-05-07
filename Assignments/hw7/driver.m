% main.m
clc
clear all
close all
format longg
%=========================================================================
                                %q1
%=========================================================================                                
% xstart = 1;
% xend = 2;
% xstart = 0;
% xend = pi;
% Trap = zeros(20,1);
% Simp = Trap;
% meshSize = Simp;
% I = pi*ones(20,1);
% i = 1;
% for intervals = 2:2:40
%     [range,xpoints] = getRange(xstart,xend,intervals);
%     h = xpoints(2)-xpoints(1);
%     meshSize(i,1) = h;
%     Trap(i,1) = Trapz(h,intervals,range);
%     Simp(i,1) = Simp13(h,intervals,range);
%     i = i + 1;
% end
% 
% errTrap = abs(I-Trap);
% errSimp = abs(I-Simp);
% 
% hold on 
% set(gca, 'XScale', 'log', 'YScale', 'log');
% loglog(meshSize,errTrap)
% loglog(meshSize,errSimp)
% legend('Trapezoidal','Simpson 1/3','location','northwest')
% title('Error vs.Mesh size')
% ylabel('error')
% xlabel('mesh size')
% grid on
% hold off

%=========================================================================
                                %q2
%=========================================================================

% Iquad3 = gaussQuad(@f,0,pi,3);
% Iquad4 = gaussQuad(@f,0,pi,4);

%=========================================================================
                                %q3
%=========================================================================
%  I = 0.0158434;
% syms y % start with x first
% [range,xpoints]=getRange2(@f2,0,.5,2);
% h = xpoints(2)-xpoints(1);
% g(y) = Simp13(@f2,h,2,range);
% [range,xpoints]=getRange(g,0,.5,2);
% h = xpoints(2)-xpoints(1);
% Isimp = double(Simp13(g,h,2,range))
% g(y) = gaussQuad(@f2,0,.5,3);
% Iquad = double(gaussQuad(g,0,.5,3))
% 
% errSimp = abs(Isimp - I)
% errQuad = abs(Iquad - I)

%=========================================================================
                                %q4
%=========================================================================

% y = .5
% xi = 0 
% xf = 2
% dx = (xf-xf)/10
% xout = 2
% 
% x = xi
% m = 0
% xp(m+1,1) = x 
% yp(m+1,1) = y 
% while true 
%     xend = x+xout
%     if xend>xf
%         xend = xf
%     end
%     h=dx
%     Integrator(x,y,h,xend)
%     m = m + 1
%     xp(m+1,1) = x
%     yp(m+1,1) = y
%     if x>=xf
%         break
%     end
% end

[x,y] = Euler(0,1,.1,100);

% wi = 0
% h=.1
% x=0
% syms y 
% wp = 1
% f(y) = diff(-y^2)
% a = 1/h-f(wp)
% b = Deriv(x,wp)
% b/a+1

syms w
f(w) = -w^2
xi = 0
yi = 1
h = .1
steps = 100
[x,y] = Heun(xi,yi,h,steps)
[x,y] = Euler(xi,yi,h,steps)
% [x,y] = mEuler(f,xi,yi,h,steps)