function [x,y] = AB2(xi,yi,h,steps)
    % midpoint
    x = zeros(steps,1);
    y = x;
    x(1,1) = xi; 
    y(1,1) = yi;
    for i = 2:2
        x(i,1) = x(i-1) + h;
        y(i) = y(i-1) + h*Deriv(x(i-1)+h/2,y(i-1)+h/2*Deriv(x(i-1),y(i-1)));
    end
    
    %AB2
    for i = 3:steps
        x(i,1) = x(i-1) + h;
        y(i) = y(i-1) + h*(3/2*Deriv(x(i-1),y(i-1))-1/2*Deriv(x(i-2),y(i-2)));
end