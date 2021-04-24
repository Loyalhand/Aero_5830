classdef NCSpline
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    methods (Static)
        function [s] = sysMake(g,n,x)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            h = zeros(n,1);
            for i = 1:n-1
                h(i,1) = x(i+1)-x(i);
            end
            A = zeros(n);
            A(1,1) = 1;
            A(n,n) = 1;
            for i = 2:n-1
                A(i,i) = 2*(h(i-1)+h(i));
            end
            for i = 1:n-1
                A(i+1,i) = h(i);
                A(i,i+1) = h(i);
            end
            A(1,2) = 0;
            A(n,n-1) = 0 ;
            b = zeros(n,1);
            for i = 2:n-1
                b(i,1) = 3/h(i)*(g(i+1)-g(i))-3/h(n-1)*(g(i)-g(i-1));
            end
            c = gauss(A,b);
            k = zeros(n,1);
            d = zeros(n,1);
            for i = 1:n-1
                k(i,1) = (g(i+1)-g(i))/h(i)-h(i)/3*(2*c(i)+c(i+1));
                d(i,1) = (c(i+1)-c(i))/3/h(i);
            end
           
            for i = 1 :n
                s.f{i,1} = @(p)g(i)+k(i)*(p-x(i))+c(i)*(p-x(i))^2+d(i)*(p-x(i))^3
            end
        end
        

    end
end

