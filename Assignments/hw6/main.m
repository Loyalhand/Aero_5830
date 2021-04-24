% main.m
clc
clear all
close all
format longg
syms xx 
interval = 2;
x = transpose(0:2/interval:2);
f = @(x) sin(exp(x)-2);
y = f(x);
n = interval;
fapprox3(xx) = Lagran(x,y,n,xx);

interval = 5;
x = transpose(0:2/interval:2);
y = f(x);
n = interval;
fapprox6(xx) = Lagran(x,y,n,xx);

hold on
fplot(f)
fplot(fapprox3)
fplot(fapprox6)
xlim([ 0 2 ])
ylim([-1 1])
title('Langrange interpolation')
xlabel('x')
ylabel('f(x)')
legend('actual','3rd degree','6th degree','Location','northwest')
grid on 
hold off

f(0)-fapprox3(0)