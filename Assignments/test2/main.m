% main.m
clc
clear all
close all
format longg

%=========================================================================%
                      % q1
%=========================================================================%
syms xx 
interval = 3;
x = transpose(0:2/interval:2);
f = @(x) sin(exp(x)-2);
y = f(x);
n = interval;
fapprox3(xx) = Lagran(x,y,n,xx);
interval = 6;
x = transpose(0:2/interval:2);
y = f(x);
n = interval;
fapprox6(xx) = Lagran(x,y,n,xx);
figure(1);
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
x = [.1;.9;1.5;1.9];
err3 = double(f(x)-fapprox3(x));
err6 = double(f(x)-fapprox6(x));
err = [x err3 err6];
figure(2);
hold on
fplot((f(xx)-fapprox3(xx)))
fplot((f(xx)-fapprox6(xx)))
xlim([ 0 2 ])
ylim([-1 1])
title('Langrange interpolation error')
xlabel('x')
ylabel('f(x)')
legend('3rd degree','6th degree','Location','northwest')
grid on 
hold off


%=========================================================================%
                      % q2
%=========================================================================%
syms p 
a = 0; % lower bound
n = 11;
b = 2; % upper bound
points = 11;
x = transpose(a:(b-a)/(points):b);
fun = @(x) sin(exp(x)-2);
g = fun(x);
[f] = NCSpline.sysMake(g,n,x);
spline = sym(zeros(b*100,1));
err = spline;
i = 0 ;
j=1;
while(true)
    if i>=0 && i<b/n
        spline(j) = subs(f(1),p,i);
    end
    if i<2*b/n && i>=b/n
        spline(j) = subs(f(2),p,i);
    end      
    if i<3*b/n &&i>=2*b/n
        spline(j) = subs(f(3),p,i);
    end
    if i<4*b/n &&i>=3*b/n
        spline(j) = subs(f(4),p,i);
    end
    if i<5*b/n &&i>=4*b/n
        spline(j) = subs(f(5),p,i);
    end
    if i<6*b/n &&i>=5*b/n
        spline(j) = subs(f(6),p,i);
    end
    if i<7*b/n &&i>=6*b/n
        spline(j) = subs(f(7),p,i);
    end
    if i<8*b/n &&i>=7*b/n
        spline(j) = subs(f(8),p,i);
    end
    if i<9*b/n &&i>=8*b/n
        spline(j) = subs(f(9),p,i);
    end
    if i<10*b/n &&i>=9*b/n
        spline(j) = subs(f(10),p,i);
    end
    if i<11.1*b/n &&i>=10*b/n
        spline(j) = subs(f(11),p,i);
    end
    err(j,1) = abs(fun(i)-spline(j));
    i=i+.01;
    j =j+1;
    if i>=b
        break;
    end
    spline = double(spline);
    err = double(err)
   
    hold on 
    fplot(fun)
    plot((1:length(spline))/100,spline)
    plot((1:length(spline))/100,err)
    legend('actual','approximate','error','Location','northwest')
    title('Comparison of spline and function')
    grid on 
    xlabel('x')
    ylabel('f(x)')
    xlim([a b])
    hold off
    
end
%=========================================================================%
                      % q3
%=========================================================================%

x = 0.9;
fpEx = fprimeEx(x)*ones(10,1);
fp = zeros(10,1);
fwd_fp = zeros(10,1);
for k = 1:10
     h = 10^-k;
     fp2 = f(x+2*h);
     fp1 = f(x+h);
     fm1 = f(x-h);
     fm2 = f(x-2*h);
     fp(k,1) = fprime(fp2,fp1,fm1,fm2,h);
     fwd_fp(k,1) = fwd_fprime(fp1,f(x),h);
end

err = abs(fp - fpEx)
fwd_err = abs(fwd_fp - fpEx)

semilogy(1:10,err)
title('Error vs step size for a central diff. approx.')
xlabel('-k')
ylabel('absolute error')
grid on 
semilogy(1:10,fwd_err)
title('Error vs step size for a foward diff. approx.')
xlabel('-k')
ylabel('absolute error')
grid on 

function y = f(x)
    y = sin(exp(x)-2);
end
function y = fprimeEx(x)
    y = exp(x)*cos(exp(x)-2);
end