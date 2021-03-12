% Indirect Methods class
classdef IM
    methods (Static)
%=========================================================================%
                      % Gauss-Seidel Method
%=========================================================================%
function [x,w] = gauSei(A,b,n,x,imax,es,lambda)
    for i = 1:n
        dum = A(i,i)
        for j = 1:n
            A(i,j) = A(i,j)/dum
        end
        b(i) = b(i)/dum
    end
    for i = 1:n
        sum = b(i)
        for j = 1:n
            if i~= j
                sum = sum - A(i,j)*x(j)
            end
            x(i) = sum
        end
    end
    iter = 1
    sen = 0
    L2norm_0 = norm(b-A*x)^(1/2)
    while sen == 0
        sen = 1
        for i = 1:n
            old = x(i)
            sum = b(i)
            for j = 1:n
                if i~= j
                    sum = sum - A(i,j)*x(j)
                end
            end
            x(i) = lambda*sum + (1-lambda)*old
            L2norm = norm(b-A*x)^(1/2)
            if sen == 1 && x(i) ~= 0
                ea = abs(L2norm/L2norm_0)
                if ea > es
                    sen = 0
                end
            end
            
        end
        iter = iter + 1
        if iter >= imax
            break
        end
    end
    w = [lambda iter]
end
%=========================================================================%
                      % Newton-Raphson Method
%=========================================================================%        
function x = newRap(
    
end
    end
end
