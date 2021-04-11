classdef mOpt
    % mOpt is a multivariable optimizer
    
    methods (Static)
        function q = Steep(F,q0,tol)
            syms x1 x2 as
            % Steep is a function that utilizes the 
            %   steepest descent method
            q = q0;
            q1(1) = q0(1);
            q2(1) = q0(2);
            i=2;
            q1(2) = 10^99;
            q2(2) = 10^99;
            gradF(x1,x2) = gradient(F,[x1,x2]);
            s = @(x1,x2) -gradF(x1,x2)/norm(gradF(x1,x2));
            while abs(F(q1(i),q2(i))-F(q1(i-1),q2(i-1)))>tol
                if q1(2) == 10^99
                    q1(2) = q0(1);
                    q2(2) = q0(2);
                end
                search = double(s(q1(i),q2(i)))
                fas(as) =  F(q1(i)+search(1)*as,q2(i)+search(2)*as);
                [xlow,w2,w1,xhigh] = onedOpt.Gold(0,2,0,10^-7,-fas);
                [alpha,y] = cubicFit(xlow,w2,w1,xhigh,-fas);
                q = q + alpha(1)*search;
                q1(i+1) = q(1);
                q2(i+1) = q(2);
                i = i + 1
            end
        end
        
        function q = BFGS(F,q0,theta,tol)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            syms x1 x2 as
            q = q0;
            q1(1) = q0(1)
            q2(1) = q0(2)
            i=2
            q1(2) = 10^99
            q2(2) = 10^99
            gradF(x1,x2) = gradient(F,[x1,x2])
            H = eye(2)
            D = 0
            while abs(F(q1(i),q2(i))-F(q1(i-1),q2(i-1)))>tol
                if q1(2) == 10^99
                    q1(2) = q0(1);
                    q2(2) = q0(2);
                end
                if i >2
                p = [q1(i)-q1(i-1);q2(i)-q2(i-1)]
                y = double(gradF(q1(i),q2(i))-gradF(q1(i-1),q2(i-1)))
                sigma = transpose(p)*y
                tau = transpose(y)*H*y
                D = (sigma+theta*tau)/sigma^2*p*transpose(p)...
                +(theta-1)/tau*H*y*transpose(H*y)-...
                theta/sigma*(H*y*transpose(p)+p*transpose(H*y))
                end
                H = H + D
                search = double(-H*gradF(q1(i-1),q2(i-1))/norm(-H*gradF(q1(i-1),q2(i-1))))                                    
                fas(as) =  F(q1(i)+search(1)*as,q2(i)+search(2)*as);
                fas(0)
                [xlow,w2,w1,xhigh] = onedOpt.Gold(0,2,0,10^-7,-fas);
                [alpha,y] = cubicFit(xlow,w2,w1,xhigh,-fas);
                q = q + alpha(1)*search;
                q1(i+1) = q(1);
                q2(i+1) = q(2);
                i = i + 1
            end
            
        end
    end
end
