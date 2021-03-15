clc
clear all
close all
 
format longg

% A = [3 -.1 -.2;.1 7 -.3; .3 -.2 10];
% b = [7.85;-19.3;71.4];
% n = length(A);
% x = [0;0;0];
imax = 10000;
es = 10^-6;
lambda = 1;
% 
% [x,w] = IM.gauSei(A,b,n,x,imax,es,lambda)

syms x1 x2 x3 x4 
f = symfun([4*x1-x2+x3-x1*x4 -x1+3*x2-2*x3-x2*x4 x1-2*x2+3*x3-x3*x4 x1^2+x2^2+x3^2-1],[x1,x2,x3,x4])
q = transpose([3,3,3,3])
[b,A,q] = IM.newRap(f,q,-16)

