classdef mOpt
    % mOpt is a multivariable optimizer
    
    methods (Static)
        function [Fq,q,iter,PE,q1,q2] = Steep(F,q0,tol)
            syms x1 x2 x3 x4 as
            % Steep is a function that utilizes the 
            %   steepest descent method
            q = q0;
            q1(1) = q0(1);
            q2(1) = q0(2);
            q3(1) = q0(3);
            q4(1) = q0(4);
            i=2;
            q1(2) = 10^99;
            q2(2) = 10^99;
            q3(2) = 10^99;
            q4(2) = 10^99;
            gradF(x1,x2,x3,x4) = gradient(F,[x1,x2,x3,x4]);
            s = @(x1,x2,x3,x4) -gradF(x1,x2,x3,x4);
            while abs(F(q1(i),q2(i),q3(i),q4(i))-F(q1(i-1),q2(i-1),q3(i-1),q4(i-1)))>tol
                if q1(2) == 10^99
                    q1(2) = q0(1);
                    q2(2) = q0(2);
                    q3(2) = q0(3);
                    q4(2) = q0(4);
                end
                search = double(s(q1(i),q2(i),q3(i),q4(i)));
                fas(as) =  F(q1(i)+search(1)*as,q2(i)+search(2)*as,q3(i)+search(3)*as,q4(i)+search(4)*as);
                [xlow,w2,w1,xhigh] = onedOpt.Gold(0,1.2,20,10^-8,-fas);
                [alpha,y] = cubicFit(xlow,w2,w1,xhigh,fas);
                q = q + alpha(1)*search
                PE(i-1,1) = F(q1(i),q2(i),q3(i),q4(i));
                q1(i+1) = q(1);
                q2(i+1) = q(2);
                q3(i+1) = q(3);
                q4(i+1) = q(4);
                i = i + 1;
                if i == 101
                    break;
                end
            end
            Fq = F(q1(end),q2(end),q3(end),q4(end));
            iter = i - 1;    
            q1 = transpose(q1);
            q2 = transpose(q2);            
        end
        
        function [Fq,q,iter,PE,q1,q2] = BFGS(F,q0,theta,tol)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            syms x1 x2 x3 x4 as
            q = q0;
            q1(1) = q0(1);
            q2(1) = q0(2);
            q3(1) = q0(3);
            q4(1) = q0(4);
            i=2;
            q1(2) = 10^99;
            q2(2) = 10^99;
            q3(2) = 10^99;
            q4(2) = 10^99;
            gradF(x1,x2,x3,x4) = gradient(F,[x1,x2,x3,x4]);
            H = eye(length(q));
            D = 0;
            while abs(F(q1(i),q2(i),q3(i),q4(i))-F(q1(i-1),q2(i-1),q3(i-1),q4(i-1)))>tol
                if q1(2) == 10^99
                    q1(2) = q0(1);
                    q2(2) = q0(2);
                    q3(2) = q0(3);
                    q4(2) = q0(4);
                end
                if i >2
                p = [q1(i)-q1(i-1);q2(i)-q2(i-1);q3(i)-q3(i-1);q4(i)-q4(i-1)];
                y = double(gradF(q1(i),q2(i),q3(i),q4(i))-gradF(q1(i-1),q2(i-1),q3(i-1),q4(i-1)));
                sigma = transpose(p)*y;
                tau = transpose(y)*H*y;
                D = (sigma+theta*tau)/sigma^2*p*transpose(p)...
                +(theta-1)/tau*H*y*transpose(H*y)-...
                theta/sigma*(H*y*transpose(p)+p*transpose(H*y));
                end
                H = H + D;
                search = double(-H*gradF(q1(i-1),q2(i-1),q4(i-1),q3(i-1))/norm(-H*gradF(q1(i-1),q2(i-1),q3(i-1),q4(i-1)))); 
                fas(as) =  F(q1(i)+search(1)*as,q2(i)+search(2)*as,q3(i)+search(3)*as,q4(i)+search(4)*as);
                [xlow,w2,w1,xhigh] = onedOpt.Gold(-2,2,20,0,-fas);
                [alpha,y] = cubicFit(xlow,w2,w1,xhigh,-fas);
                q = q + alpha(1)*search;
                PE(i-1,1) = F(q1(i),q2(i),q3(i),q4(i));
                q1(i+1) = q(1);
                q2(i+1) = q(2);
                q3(i+1) = q(3);
                q4(i+1) = q(4);
                i = i + 1;
                if i == 201
                    break;
                end
            end
            Fq = F(q1(end),q2(end),q3(end),q4(end));
            iter = i - 1;     
            q1 = transpose(q1);
            q2 = transpose(q2);
        end
        
    end
end
