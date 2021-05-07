function [x,y] = Heun(xi,yi,h,steps)
    x = zeros(steps,1);
    y = x;
    dydx = x;
    x(1,1) = xi;
    y(1,1) =yi;
    j = 1;
    for i = 2:steps+1
        x(i,1) = x(i-1) + h;
        dydx(i,1) = Deriv(x(i-1),y(i-1));
        w(j,1) = y(i-1)+h*dydx(i,1);
        y(i) = w(j)
        while true
            j = j + 1;
            w(j,1) = w(i-1)+(Deriv(x(i-1),w(i-1))+Deriv(x(i),w(j-1)))/2*h
            if abs(w(j)-w(j-1))<10^-5
                y(i+1) = w(j); 
                break
            end
        end
    end
end