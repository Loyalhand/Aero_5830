function dfdx = fwd_fprimeO3(f,x,h)
    dfdx = (-11/6*f(x)+3*f(x+h)-3/2*f(x+2*h)+1/3*f(x+3*h))/h;
end

