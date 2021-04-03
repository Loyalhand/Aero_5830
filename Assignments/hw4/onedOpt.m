classdef onedOpt
    % onedOpt is a class of 1-d optimization functions
    
    methods (Static)
        function [xlow,x2,x1,xhigh] = Gold(xlow,xhigh,n,es,f)
            % Gold is the Golden section algorithm for 1-d opt.
            % if using a set convergence target set es to the according
            % value and set iter to any value else set it to zero for a targeted amount of iterations
            R = (sqrt(5)-1)/2;
            if es>0
               n = log10(es)/log10(R)
            end
            iter = 1;
            d = R*(xhigh-xlow);
            x1 = xlow + d;
            x2 = xhigh - d;
            f1 = double(f(x1));
            f2 = double(f(x2));
            if f1>f2
                xopt = x1;
                fx = f1;
            else
                xopt = x2;
                fx = f2;
            end
            
            while iter<n
                d = R*d;
                if f1>f2
                    xlow = x2;
                    x2 = x1;
                    x1 = xlow + d;
                    f2 = f1;
                    f1 = double(f(x1));
                else
                    xhigh = x1;
                    x1 = x2;
                    x2 = xhigh - d;
                    f1 = f2;
                    f2 = double(f(x2));
                end
                if f1>f2
                    fx = f1;
                else
                    fx = f2;
                end
                iter = iter + 1;
            end
        end
    end
end



