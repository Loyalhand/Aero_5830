function [x,y] = mEuler(f,xi,yi,h,steps)
syms w
    x = zeros(steps,1);
    y = x;
    f(w) = diff(f)
    x(1,1) = xi;
    y(1,1) = yi;
    wp = yi;
    for i = 2:steps
        x(i,1) = x(i-1) + h;
        a = 1/h-f(y(i-1));
        b = Deriv(x(i-1),y(i-1));
        c = b/a+y(i-1);
        y(i) = c;
    end
end