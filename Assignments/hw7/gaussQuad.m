function I = gaussQuad(f,a,b,n)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description

switch n
    case 2
        c = ones(2,1)
        t = [-.57735;.57735]
    case 3 
        c = [.555556;.888889;.555556]
        t = [-.774597;0;.774597]
    case 4   
        c = [.347855;.652145;.652145;.347855]  
        t = [-.861136;-.339981;.339981;.861136]
    otherwise 
        disp('nope')
end

x = zeros(n,1)
for i = 1:n
    x(i,1) = (b+a)/2-(b-a)/2*t(i)
end
I = 0
for i = 1:n
    I = (b-a)/2*c(i)*f(x(i)) + I
end