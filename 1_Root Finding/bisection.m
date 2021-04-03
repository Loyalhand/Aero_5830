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

f = symfun(x^3+2*x-2,x);

 x = rootFind.Bisect(f,a,b,tol)
 