% 2/11/2020
% Matthew Pahayo
% hw 1 
% % q3 plot
% file Name: plt.m

clc
clear all
close all

f_m = importdata("flm.txt");
f = importdata("fl.txt");

g_m = abs(f_m/f_m(1));
g = abs(f/f(1)); 

a = 0:length(g)-1;
a_m = 0:length(g_m)-1;


semilogy(a,g,'.',a_m,g_m,'o')
title('semi-log plot of f(x) normalized')
xlabel('iteration')
ylabel('f(x)/f(x_0)')
grid on 
legend('Newton', 'modified')