function I = Simp13(h,intervals,range)
    % Simpson 1/3 integration
    sum = f(0);
        for i = 1:2:intervals-1
            sum = sum+4*range(i)+2*range(i+1);
        end
    sum = sum + 4*range(end-1)+range(end);
    I = h*sum/3;
end
