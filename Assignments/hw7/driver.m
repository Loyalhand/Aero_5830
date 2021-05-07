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

syms w 
f(w) = 1/5*w*exp(3*w)-1/25*exp(3*w)+1/25*exp(-2*w)
xi = 0;
yi = 0;
h = .1;
steps = 11;
[xh,yh] = Heun(xi,yi,h,steps);
[xe,ye] = Euler(xi,yi,h,steps);
[xme,yme] = mEuler(f,xi,yi,h,steps);
[xRK,yRK] = RK4(xi,yi,h,steps);
[xmid,ymid] = midpoint(xi,yi,h,steps);

%=========================================================================
                                %q4
%=========================================================================
f(w) = w/(1+log(w))
[x2,y2] = AB2(xi,yi,h,steps);
[x3,y3] = AB3(xi,yi,h,steps)
