function [x,y] = Euler(xi,yi,h,steps)
    x = zeros(steps,1);
    y = x;
    dydx = x;
    x(1,1) = xi;
    y(1,1) =yi;
    for i = 2:steps
        x(i,1) = x(i-1) + h;
        dydx(i,1) = Deriv(x(i-1),y(i-1));
        y(i,1) = y(i-1)+h*dydx(i,1);
    end
end