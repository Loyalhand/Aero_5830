function I = Simp13(f,h,intervals,range)
    % Simpson 1/3 integration
    sum = 0;
    for i = 1:2:intervals
    sum = range(i) + 4*range(i+1)+range(i+2)+sum;
    end
    I = h*sum/3;
end
