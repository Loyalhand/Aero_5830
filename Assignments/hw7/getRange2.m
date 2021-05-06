function [range,xpoints] = getRange2(f,xstart,xend,intervals)
% range needs to be a sym use this rather than getRange
xpoints = transpose(xstart:(xend-xstart)/(intervals):xend);
range = sym(zeros(intervals+1,1));
    for i = 1:intervals+1
        range(i,1) = f(xpoints(i));
    end
end


