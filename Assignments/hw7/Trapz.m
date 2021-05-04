function I = Trapz(h,intervals,range)
    % Trapezoidal integration
    sum = range(1);
        for i = 1:intervals-1
            sum = sum+2*range(i);
        end
    sum = sum + range(end);
    I = h*sum/2;
end
