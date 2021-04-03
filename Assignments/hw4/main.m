% matthew Pahayo
% main.m
clc
clear all
close all
 
format longg
syms x V

%=========================================================================%
                      % q1
%=========================================================================% 
% f = symfun(2*sin(x)-x^2/10,x)
f = symfun(x^4-x^3-(sin(x))^2+(cos(x))^2+2,x);
xlow = 0;
xhigh = .1;
iter = 10;
[xlow,x2,x1,xhigh] = onedOpt.Gold(xlow,xhigh,iter,0,f);
[x,y] = cubicFit(xlow,x2,x1,xhigh,f);

%=========================================================================%
                      % q2
%=========================================================================% 
W = 3.7278*10^6; %[N]
sigma = .31; 
D = symfun(-(6.62725*sigma*V^2+1.31493*10^-4/sigma*(W/V)^2),V)
Vlow = 100;
Vhigh = 400;
es = 10^-3;
[Vlow,V2,V1,Vhigh] = onedOpt.Gold(Vlow,Vhigh,0,es,D);
[V,D] = cubicFit(Vlow,V2,V1,Vhigh,D);

