% main.m
clc
clear all
close all
format longg

%=========================================================================%
                      % q1
%=========================================================================%
% syms xx 
% interval = 2;
% x = transpose(0:2/interval:2);
% f = @(x) sin(exp(x)-2);
% y = f(x);
% n = interval;
% fapprox3(xx) = Lagran(x,y,n,xx);
% interval = 5;
% x = transpose(0:2/interval:2);
% y = f(x);
% n = interval;
% fapprox6(xx) = Lagran(x,y,n,xx);
% hold on
% fplot(f)
% fplot(fapprox3)
% fplot(fapprox6)
% xlim([ 0 2 ])
% ylim([-1 1])
% title('Langrange interpolation')
% xlabel('x')
% ylabel('f(x)')
% legend('actual','3rd degree','6th degree','Location','northwest')
% grid on 
% hold off
% x = [.1;.9;1.5;1.9];
% err3 = double(f(x)-fapprox3(x));
% err6 = double(f(x)-fapprox6(x));
% err = [x err3 err6];


n = 11
a = 0 
b = 2 
points = 11
x = transpose(a:(b-a)/(points):b)
f = @(x) sin(exp(x)-2)
g = f(x)


[A,b] = NCSpline.sysMake(g,n,x)

