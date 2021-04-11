function [x,y] = cubicFit(xlow,x2,x1,xhigh,f)
%cubicFit fits a cubic function into to the specified points 
%   takes values from Gold 
q1 = x1^3*(x2-xlow)-x2^3*(x1-xlow)+xlow^3*(x1-x2);
q2 = xhigh^3*(x2-xlow)-x2^3*(xhigh-xlow)+xlow^3*(xhigh-x2);
q3 = (x1-x2)*(x2-xlow)*(x1-xlow);
q4 = (xhigh-x2)*(x2-xlow)*(xhigh-xlow);
q5 = double(f(x1))*(x2-x1)-double(f(x2))*(x1-xlow)+double(f(x1-x2));
q6 = double(f(xhigh))*(x2-x1)-double(f(x2))*(xhigh-xlow)+double(f(xhigh-x2));

a3 = (q3*q6-q4*q5)/(q2*q3-q1*q4);
a2 = (q5-a3*q1)/q3;
a1 = (double(f(x2)-f(xlow)))/(x2-xlow)-a3*(x2^3-xlow^3)/(x2-xlow)-...
    a2*(xlow+x2);
del = a2^2-3*a1*a3;

x(1) = double(-a2+sqrt(del))/3/a3;
x(2) = double(-a2-sqrt(del))/3/a3;
y(1) = double(f(x(1)));
y(2) = double(f(x(2)));
end

