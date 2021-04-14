classdef rootFind
    %rootFind is a class of functions that find the root of a function /
    %data set
 %------------------------------------------------------------------------%
    methods (Static)
        function x = Bisect(f,a,b,tol)
            %Bisect uses the bisection algoritm using the interval 
            iter = 0;
            while (b-a)/2 >= tol
                c = (a+b)/2;
                if f(c) > 0
                    b = c;
                end
                if f(c) < 0
                    a = c;
                end
                iter = iter + 1;
            end
            x = (a+b)/2
        end
 %------------------------------------------------------------------------%        
        function x = newRap(f,x0,eps,nmax)
            %newRap is a function that utilizes the Newton-Raphson
            %algorithm to find the roots of the function 
            %x0 is the initial guess
            fp = diff(f);  
            x=x0;
            n=0;
            while eps>=1e-5&&n<=nmax
                y=x-double(f(x))/double(fp(x));
                eps=abs(y-x);
                x=y;
                n=n+1;
            end
        end
 %------------------------------------------------------------------------%
%  function x = secant_Method(f,x0,eps,nmax)
%      newRap is a function that utilizes the Newton-Raphson
%      algorithm to find the roots of the function
%      x0 is the initial guess
%      y=x0(1);
%      x=x0(2);
%      n=0;
%      while abs((x-y)/y)>eps
%          y=x-double(f(x))/double(fp(x));
%          x=y;
%          n=n+1;
     end
     
 end
    end
end
