function I = Trapz(h,intervals,range)
    % Trapezoidal integration
    sum = 0;
        for i = 1:intervals
            sum = range(i)+range(i+1)+sum;
        end
    I = h*sum/2;
end
