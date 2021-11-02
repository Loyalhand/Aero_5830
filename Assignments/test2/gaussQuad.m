function I = gaussQuad(f,a,b,n)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description

switch n
    case 2
        c = ones(2,1);
        t = [-1/sqrt(3);1/sqrt(3)];
    case 3 
        c = [5/9;8/9;5/9];
        t = [-sqrt(3/5);0;sqrt(3/5)];
    case 4   
        c = [.347855;.652145;.652145;.347855];  
        t = [-.861136;-.339981;.339981;.861136];
    otherwise 
        disp('nope')
end

x = zeros(n,1);
for i = 1:n
    x(i,1) = (b+a)/2-(b-a)/2*t(i);
end
I = 0;
for i = 1:n
    I = (b-a)/2*c(i)*f(x(i)) + I;
end