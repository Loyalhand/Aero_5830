function fun = f2(x)
syms y
% fun = log(x+2*y);
% fun = x*y^2
% fun = x.*sin(x);
fun = x*y*(exp(y-x));
end