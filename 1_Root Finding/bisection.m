% 1/7/2020
% Matthew Pahayo
% bisection method calculator
% % root finder
% file Name: bisection.m

clc
clear all
close all

syms x
a = 0
b = 1
tol = .0001

f(x) = x^3+2*x-2;
iter = 0;
while (b-a)/2 >= tol
    c = (a+b)/2;
    if f(c) > 0
        b = c;
    end
    if f(c) < 0
        a = c;
    end
    iter = iter + 1;
end

x = (a+b)/2
