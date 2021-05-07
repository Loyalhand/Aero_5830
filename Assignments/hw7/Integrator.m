function x = Integrator(x,y,h,xend)
    while true 
        if (xend-x<h)
            h = xend -x 
        end
        y = Euler(x,y,h)
        if x>=xend
            break
        end
    end
end